#include "stm32f10x.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"

int main(void) {
  GPIO_InitTypeDef GPIO_InitStruct;

  // set clock (enable GPIOC)
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

  // configure GPIO_MODE, GPIO_PIN, GPIO_SPEED
  GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
  GPIO_InitStruct.GPIO_Pin = GPIO_Pin_13;
  GPIO_InitStruct.GPIO_Speed = GPIO_Speed_2MHz;

  // Port initialization
  GPIO_Init(GPIOC, &GPIO_InitStruct);

  // Bit 13 C set port equals 0
  GPIO_WriteBit(GPIOC, GPIO_Pin_13, Bit_RESET);

  // loop
  while (1) {
    ;
  }
}
