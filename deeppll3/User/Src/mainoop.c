#include "mainoop.h"
#include "main.h"
#include "dac.h"
#include "adc.h"
#include "arm_math.h"

#define FS          200000.0f
#define BUF_SIZE    256
#define NUM_TAPS    141

static uint16_t adc_buf[BUF_SIZE];
static uint16_t dac_buf[BUF_SIZE];

static arm_fir_instance_f32 fir;
static float32_t fir_state[NUM_TAPS + BUF_SIZE / 2];
static float32_t fir_coeffs[NUM_TAPS];
static float32_t fir_in[BUF_SIZE / 2], fir_out[BUF_SIZE / 2];

static void design_hpf(float32_t *h, int taps, float fc)
{
    int mid = taps / 2;
    for (int i = 0; i < taps; i++) {
        int n = i - mid;
        float w = 0.54f - 0.46f * cosf(2.0f * PI * i / (taps - 1));
        if (n == 0)
            h[i] = 2.0f * fc * w;
        else
            h[i] = sinf(2.0f * PI * fc * n) / (PI * n) * w;
    }
    for (int i = 0; i < taps; i++) h[i] = -h[i];
    h[mid] += 1.0f;
}

static void process_block(uint16_t *src, uint16_t *dst, int n)
{
    for (int i = 0; i < n; i++)
        fir_in[i] = (src[i] - 2048) / 2048.0f;
    arm_fir_f32(&fir, fir_in, fir_out, n);
    for (int i = 0; i < n; i++) {
        int v = (int)(fir_out[i] * 2000.0f + 2048.5f);
        if (v < 0) v = 0;
        if (v > 4095) v = 4095;
        dst[i] = (uint16_t)v;
    }
}

void TIM_Set_Frequency(TIM_HandleTypeDef *htim, uint32_t freq_hz)
{
    uint32_t timer_clk = HAL_RCC_GetPCLK1Freq() * 2;
    HAL_TIM_Base_Stop(htim);
    __HAL_TIM_SET_AUTORELOAD(htim, timer_clk / freq_hz - 1);
    __HAL_TIM_SET_COUNTER(htim, 0);
    HAL_TIM_Base_Start(htim);
}

void main_init(void)
{
    design_hpf(fir_coeffs, NUM_TAPS, 7500.0f / FS);
    arm_fir_init_f32(&fir, NUM_TAPS, fir_coeffs, fir_state, BUF_SIZE / 2);

    DAC1->CR = (DAC1->CR & ~DAC_CR_TSEL1) | (DAC_TRIGGER_T2_TRGO & DAC_CR_TSEL1);

    HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_1, (uint32_t *)dac_buf,
                      BUF_SIZE, DAC_ALIGN_12B_R);
    HAL_ADC_Start_DMA(&hadc1, (uint32_t *)adc_buf, BUF_SIZE);

    TIM_Set_Frequency(&htim2, 200000);
}

void main_loop(void) { }

void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef *hadc)
{
    if (hadc->Instance != ADC1) return;
    process_block(adc_buf, dac_buf, BUF_SIZE / 2);
    SCB_CleanDCache_by_Addr((uint32_t *)dac_buf, (BUF_SIZE / 2) * sizeof(uint16_t));
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc)
{
    if (hadc->Instance != ADC1) return;
    process_block(adc_buf + BUF_SIZE / 2, dac_buf + BUF_SIZE / 2, BUF_SIZE / 2);
    SCB_CleanDCache_by_Addr((uint32_t *)(dac_buf + BUF_SIZE / 2),
                            (BUF_SIZE / 2) * sizeof(uint16_t));
}
