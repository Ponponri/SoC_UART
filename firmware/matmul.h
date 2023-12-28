#ifndef _MATMUL_H
#define _MATMUL_H
#include <stdint.h>

// volatile uint32_t *fir_ptr;
// volatile uint32_t fir_addr = 0x30000000;
volatile uint32_t *mat_ptr;
volatile uint32_t mat_addr = 0x30100000;

#define SIZE 4
	int __attribute__ ( ( section ( ".adder" ) ) ) A[SIZE*SIZE] = {0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3,
			0, 1, 2, 3
	};
	int __attribute__ ( ( section ( ".adder" ) ) ) B[SIZE*SIZE] = {1, 2, 3, 4,
		5, 6, 7, 8,
		9, 10, 11, 12,
		13, 14, 15, 16
	};
	int result[SIZE*SIZE];
#endif
