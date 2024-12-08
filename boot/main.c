#include "uart.h"

void KMain(void)
{
    init_uart();
    write_string("Hello to Raspberry pi!");
    
    while(1) {;}
}