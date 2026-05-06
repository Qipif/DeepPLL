#include "main.h"
#include "ad9833.h"
#include "oled.h"
#include "comp.h"
#include <stdio.h>

AD9833_Handler ad9833;

#define TARGET_FREQ   10000000  //10000.00Hz(单位0.001Hz)
#define FREQ_LIMIT    2000     //±2Hz边界

//PI参数
#define P_DEN         20       // TICK→mHz:  1°(111tick) ~ 5.5mHz
#define INTEG_SHIFT   8        // 每周期累加: g_err_filt/256
#define I_DEN         100      // 积分→mHz:  g_integral/100
#define LP_SHIFT      7        // 低通时间常数 ~16个采样周期
#define INTEG_LIMIT   100000   // 积分抗饱和限幅
#define APPLY_DECIM   16        // 每8周期更新一次g_freq（减少DDS写入频率）


volatile static int32_t g_freq = TARGET_FREQ;
static volatile int32_t g_err_filt = 0;
static volatile int32_t g_integral = 0;
static volatile int32_t g_delta_dbg = 0;  //debug：原始相位差
static uint8_t g_apply_cnt = 0;

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

	AD9833_Init(&ad9833, wave_sine, (uint32_t)((float)TARGET_FREQ / 1000.0f + 0.5f), 0, &hspi2, GPIOC, GPIO_PIN_0);

	snprintf(buf, 21, "%ld.%02lu Hz   ", g_freq / 1000, g_freq % 1000);
	OLED_ShowString(1, 1, buf);
}

void main_loop(void)
{
	static uint32_t last_tick = 0;
	static int32_t last_freq = 0;
	char buf[21];

	int32_t diff = g_freq - last_freq;
	if (diff > 100 || diff < -100)    // 变化超过100 mHz才写入（AD9833步进~93mHz）
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

static void pll_update(int32_t err)
{
	g_err_filt += (err - g_err_filt) >> LP_SHIFT;
	g_integral += g_err_filt >> INTEG_SHIFT;

	if (g_integral > INTEG_LIMIT)
		g_integral = INTEG_LIMIT;
	if (g_integral < -INTEG_LIMIT)
		g_integral = -INTEG_LIMIT;
}

static void pll_apply(void)
{
	g_freq = TARGET_FREQ
		   - g_err_filt / P_DEN
		   - g_integral / I_DEN;

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
			uint32_t period = t_ref - g_t_ref_prev;

			if (period > 200000 || period < 1000)
			{
				g_t_ref_prev = t_ref;
				return;
			}

			int32_t delta = (int32_t)(t_ref - g_t_dds);
			if (delta > (int32_t)(period >> 1))
				delta -= (int32_t)period;

			g_delta_dbg = delta;
			pll_update(delta);

			g_apply_cnt++;
			if (g_apply_cnt >= APPLY_DECIM)
			{
				g_apply_cnt = 0;
				pll_apply();
			}
		}
		g_t_ref_prev = t_ref;
	}
	else if (hcomp->Instance == COMP2)
	{
		g_t_dds = DWT->CYCCNT;
		g_c2_cnt++;
	}
}
