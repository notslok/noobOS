/* Defining "start" symbol (present globally in boot.s) as the entry point */
ENTRY(start)
SECTIONS
{   /* Defining the addess in the main memory where kernel18.img should be loaded */    
    . = 0x80000;

    .text : {
        *(.text)
    }

    .rodata : {
        *(.rodata)
    }

    /* Aligning the data segment to 64 bit boundary*/
    . = ALIGN(64);

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}