#include "dma.h"

inline void __attribute__ ( ( section ( ".mprjram" ) ) ) dma(
    volatile uint32_t start,  volatile uint32_t end)
{
    volatile uint32_t inst; 
    inst_ptr = (volatile uint32_t*)inst_addr;

    // initialize instruction buffer
    //inst = 0x30670000;
    inst = 0x00000000;
    inst = inst + ((start & 0x000000ff) << 8);
    inst = inst + ((start & 0x00000300) << 10);
    inst = inst + (end & 0x000000ff);
    inst = inst + ((end & 0x00000300) << 8);



    *inst_ptr = inst;

    //return inst;
}