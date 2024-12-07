.section .text
.global start

// Logic to make sure that kerne runs only on CPU0 of Rpi
start:
    mrs x0, mpidr_el1 // Multiprocessor Affinity Register -> a system register whose lowest 2 bits, if unset ... indicates CPU0
    and x0, x0, #3 // Checking if the lowest 2 bits are unset by performing AND with 3 (0011 ... in binary)
    cmp x0, #0
    beq kernel_entry // if CPU0 then branch to <kernel_entry:> section

end:
    b end // infinite loop in case of condition failure

kernel_entry:
    mov sp, #0x80000 // move the stack pointer to this address as this is the addres from where Rpi expects the kernel code to be loaded in main memory 
    bl KMain // branches to KMain (short for kernel main) function but with link.... i.e it update the the LR(link register) with address of the next instruction (i.e. address f instruction "b end")
    b end