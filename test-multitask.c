#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#include <stdlib.h>
#include <inttypes.h>

#include "avr_kernel.h"

void task_0()
{
    int i;
    for (i = 0; i < 10; ++i)
    {
        PINB = 1;
        _delay_ms(100);
    }
    while (1)
    {
        PINB = 1;
        _delay_ms(100);
        yield();
//         for (i = 0; i < 300; ++i)
//         {
//             _delay_ms(1);
//              yield();
//         }
    }
}

void task_1()
{
    int i;
    for (i = 0; i < 10; ++i)
    {
        PINB = 2;
        _delay_ms(100);
    }
    while (1)
    {
        PINB = 2;
        _delay_ms(100);
        yield();
//         for (i = 0; i < 200; ++i)
//         {
//             _delay_ms(1);
//            yield();
//         }
    }
}

void task_2()
{
    int i;
    for (i = 0; i < 10; ++i)
    {
        PINB = 4;
        _delay_ms(100);
    }
    while (1)
    {
        PINB = 4;
        _delay_ms(100);
        yield();
//         for (i = 0; i < 125; ++i)
//         {
//             _delay_ms(1);
//            yield();
//         }
    }
}

void task_3()
{
    int i;
    for (i = 0; i < 10; ++i)
    {
        PINB = 8;
        _delay_ms(100);
    }
    while (1)
    {
        PINB = 8;
        _delay_ms(100);
        yield();
//         for (i = 0; i < 225; ++i)
//         {
//             _delay_ms(1);
//            yield();
//         }
    }
}


int main ()
{
    // connect all LEDs to port pins
    DDRB = 0xFF;
    DDRC = 0xFF;
    DDRA = 0;
    PORTA = 0xFF;
    PORTB = 0;
    
    uint8_t portb = 0;

    avr_kernel_init();
    // task_0();

    int i;
    while (1)
    {
        PINB = 4;
        for (i = 0; i < 500; ++i)
        {
            _delay_ms(1);
           yield();
        }
       
    }

    return 0;
}
