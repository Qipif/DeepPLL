#include "main.h"
#include "ad9833.h"
#include "oled.h"
#include "comp.h"
#include <stdio.h>

AD9833_Handler ad9833;

#define STEP_SIZE     1
#define TARGET_FREQ   10000000
#define FREQ_LIMIT    1000  //±1Hz(10kHz)

volatile static int32_t g_freq = TARGET_FREQ;

void main_init(void)
{
	char buf[21];

	OLED_Init();
	OLED_ShowString(1, 1, "BangBang PLL");

	HAL_COMP_Start(&hcomp1);
	HAL_COMP_Start(&hcomp2);

	AD9833_Init(&ad9833, wave_sine, (uint32_t)((float)TARGET_FREQ / 1000.0f + 0.5f), 0, &hspi1, GPIOA, GPIO_PIN_4);

	snprintf(buf, 21, "%ld.%02lu Hz", g_freq / 1000, g_freq % 1000);
	OLED_ShowString(2, 1, buf);
	OLED_ShowString(3, 1, "Locking...");
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
		snprintf(buf, 21, "%ld.%02lu Hz   ", g_freq / 1000, g_freq % 1000);
		OLED_ShowString(2, 1, buf);
	}
}

void HAL_COMP_TriggerCallback(COMP_HandleTypeDef *hcomp)
{
	if (hcomp->Instance != COMP1) return;

	if (HAL_COMP_GetOutputLevel(&hcomp2) == COMP_OUTPUT_LEVEL_HIGH)
	{
		g_freq -= STEP_SIZE;
	}
	else
	{
		g_freq += STEP_SIZE;
	}

	if (g_freq > TARGET_FREQ + FREQ_LIMIT)
	{
		g_freq = TARGET_FREQ + FREQ_LIMIT;
	}
	if (g_freq < TARGET_FREQ - FREQ_LIMIT)
	{
		g_freq = TARGET_FREQ - FREQ_LIMIT;
	}
}
