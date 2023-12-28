#ifndef _COUNTER_LA_H
#define _COUNTER_LA_H
#include "stdint.h"

volatile uint32_t *fir_ptr;
volatile uint32_t fir_addr = 0x36000000;
volatile uint32_t *mat_ptr;
volatile uint32_t mat_addr = 0x36100000;


#endif