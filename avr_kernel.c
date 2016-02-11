#include <avr/io.h>
#include <inttypes.h>
#include "avr_kernel.h"
#include "Task_switch.c"

#include "avr_kernel_defs.h"

volatile uint16_t stack[STACK_SIZE];
volatile uint16_t sp[4] = {stack + STACK_SIZE/4 - 3, stack + STACK_SIZE/2 - 3, stack + 3*STACK_SIZE/4 - 3, stack + STACK_SIZE - 3};
volatile int current_task = 0;
//volatile uint16_t SP;
void dispatcher();

void task_0();
void task_1();
void task_2();
void task_3();

uint16_t swap_endiannes (uint16_t x)
{
    return ((x & 0xFF) << 8) | ((x & 0xFF00) >> 8); 
}

void avr_kernel_init()
{
    stack[STACK_SIZE/4 - 2] = swap_endiannes(task_0);
    stack[STACK_SIZE/2 - 2] = swap_endiannes(task_1);
    stack[3*STACK_SIZE/4 - 2] = swap_endiannes(task_2);
    stack[STACK_SIZE - 2] = swap_endiannes(task_3);
    current_task = 0;
    SP = sp[current_task];
}

void yield()
{
    dispatcher();
}

void dispatcher()
{
    sp[current_task] = SP;
    SAVE_CONTEXT;
    current_task = ((current_task + 1) & (NUM_TASKS-1));
    RESTORE_CONTEXT;
    SP = sp[current_task];
    
}
