#include "main.h"
#include "ad9833.h"
#include "oled.h"
#include "comp.h"
#include <stdio.h>

AD9833_Handler ad9833;

#define TARGET_FREQ   10000000  //10000.00Hz(单位0.001Hz)
#define FREQ_LIMIT    2000     //±1Hz边界

//PI参数
#define P_DEN         200
#define INTEG_SHIFT   10
#define I_DEN         50
#define LP_SHIFT      5

volatile static int32_t g_freq = TARGET_FREQ;
static volatile int32_t g_err_filt = 0;
static volatile int32_t g_integral = 0;
static volatile int32_t g_delta_dbg = 0;  //debug：原始相位差

//TDC时间戳
static volatile uint32_t g_t_dds = 0;
static volatile uint32_t g_t_ref_prev = 0;
static volatile uint32_t g_c2_cnt = 0;  //COMP2触发计数

static void tdc_init(void)
{
	CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
	DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
}

void main_init(void)
{
	char buf[21];

	OLED_Init();
	OLED_ShowString(1, 1, "TDC PLL");
	OLED_ShowString(2, 1, "Init...");

	tdc_init();
	HAL_COMP_Start(&hcomp1);
	HAL_COMP_Start(&hcomp2);

	AD9833_Init(&ad9833, wave_sine, (uint32_t)((float)TARGET_FREQ / 1000.0f + 0.5f), 0, &hspi1, GPIOA, GPIO_PIN_4);

	snprintf(buf, 21, "%ld.%02lu Hz   ", g_freq / 1000, g_freq % 1000);
	OLED_ShowString(1, 1, buf);
}

void main_loop(void)
{
	static uint32_t last_tick = 0;
	static int32_t last_freq = 0;
	char buf[21];

	if (g_freq != last_freq)
	{
		AD9833_SetFrequency(&ad9833, g_freq / 1000.0f);
		last_freq = g_freq;
	}

	uint32_t now = HAL_GetTick();
	if (now - last_tick >= 500)
	{
		last_tick = now;
		snprintf(buf, 21, "%ld.%02lu Hz  ", g_freq / 1000, g_freq % 1000);
		OLED_ShowString(1, 1, buf);
		snprintf(buf, 21, "d=%+6ld ", g_delta_dbg);
		OLED_ShowString(2, 1, buf);
		snprintf(buf, 21, "I=%+6ld ", g_integral);
		OLED_ShowString(3, 1, buf);
		snprintf(buf, 21, "C2=%5lu", g_c2_cnt);
		OLED_ShowString(4, 1, buf);
	}
}

// PI控制器
static void pll_pi(int32_t err)
{
	g_err_filt += (err - g_err_filt) >> LP_SHIFT;

	g_integral += g_err_filt >> INTEG_SHIFT;

	g_freq = TARGET_FREQ
		   + g_err_filt / P_DEN
		   + g_integral / I_DEN;

	if (g_freq > TARGET_FREQ + FREQ_LIMIT)
		g_freq = TARGET_FREQ + FREQ_LIMIT;
	if (g_freq < TARGET_FREQ - FREQ_LIMIT)
		g_freq = TARGET_FREQ - FREQ_LIMIT;
}

void HAL_COMP_TriggerCallback(COMP_HandleTypeDef *hcomp)
{
	if (hcomp->Instance == COMP1)
	{
		uint32_t t_ref = DWT->CYCCNT;

		if (g_t_dds != 0 && g_t_ref_prev != 0)
		{
			uint32_t period = t_ref - g_t_ref_prev;      // 周期 = 这一个上升沿 - 上一个上升沿
			int32_t delta = (int32_t)(t_ref - g_t_dds);  // 差距

			if (delta > (int32_t)(period >> 1)) // 如果差距大于半个周期，就减掉一个周期（以区分超前滞后的多少）
				delta -= (int32_t)period;

			g_delta_dbg = delta;
			pll_pi(delta);
		}
		g_t_ref_prev = t_ref;
	}
	else if (hcomp->Instance == COMP2)
	{
		g_t_dds = DWT->CYCCNT;
		g_c2_cnt++;
	}
}
