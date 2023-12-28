# 0 "../../firmware/matmul.c"
# 1 "/home/ponponri/Desktop/shared_folder/SoCLab-ExtraLab_1226_uart/SoCLab-ExtraLab/testbench/counter_la//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "../../firmware/matmul.c"
# 1 "../../firmware/matmul.h" 1


# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 1 3 4
# 11 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 3 4
# 1 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 1 3 4
# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4

# 34 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h" 3 4
typedef signed char int8_t;


typedef short int int16_t;


typedef long int int32_t;


typedef long long int int64_t;


typedef unsigned char uint8_t;


typedef short unsigned int uint16_t;


typedef long unsigned int uint32_t;


typedef long long unsigned int uint64_t;




typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef long int int_least32_t;
typedef long long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef short unsigned int uint_least16_t;
typedef long unsigned int uint_least32_t;
typedef long long unsigned int uint_least64_t;



typedef int int_fast8_t;
typedef int int_fast16_t;
typedef int int_fast32_t;
typedef long long int int_fast64_t;
typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef long long unsigned int uint_fast64_t;




typedef int intptr_t;


typedef unsigned int uintptr_t;




typedef long long int intmax_t;
typedef long long unsigned int uintmax_t;
# 12 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint.h" 2 3 4
# 4 "../../firmware/matmul.h" 2




# 7 "../../firmware/matmul.h"
volatile uint32_t *mat_ptr;
volatile uint32_t mat_addr = 0x30100000;


 int __attribute__ ( ( section ( ".adder" ) ) ) A[4*4] = {0, 1, 2, 3,
   0, 1, 2, 3,
   0, 1, 2, 3,
   0, 1, 2, 3
 };
 int __attribute__ ( ( section ( ".adder" ) ) ) B[4*4] = {1, 2, 3, 4,
  5, 6, 7, 8,
  9, 10, 11, 12,
  13, 14, 15, 16
 };
 int result[4*4];
# 2 "../../firmware/matmul.c" 2

int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
 int i=0;
 int j;
 int k;
 int sum;
 int kk;
 unsigned int count = 0;
 for (i=0; i<4; i++){
  for (j=0; j<4; j++){
   sum = 0;
   for(k = 0;k<4;k++)
    sum += A[(i*4) + k] * B[(k*4) + j];
   result[(i*4) + j] = sum;
  }
 }

 return result;
}
