#include "matmul.h"

int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZE; i++){
		for (j=0; j<SIZE; j++){
			sum = 0;
			for(k = 0;k<SIZE;k++)
				sum += A[(i*SIZE) + k] * B[(k*SIZE) + j];
			result[(i*SIZE) + j] = sum;
		}
	}

	return result;
}

// void __attribute__ ( ( section ( ".mprjram" ) ) ) firPtr()
// {
// 	volatile uint32_t *fir_addr = (volatile uint32_t *)0x30000000;
// 	*fir_addr = 0x00001c3c;
// 	*fir_addr = 0x00100054;
// 	*fir_addr = 0x003c407c;
// 	*fir_addr = 0x143c687c;
// 	*fir_addr = 0x043c687c;
// 	*fir_addr = 0x1c3c087c;

// }