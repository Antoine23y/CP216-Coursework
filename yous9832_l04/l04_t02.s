/*
-------------------------------------------------------
l04_t02.s
-------------------------------------------------------
Author:  Antoine Youssef
ID:      169069832
Email:   yous9832@mylaurier.ca
Date:    2025/02/11
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Load address of start of list
ldr    r3, =_Data   // Load address of end of list
mov    r4, #0       // Initialize count to 0
mov    r5, #36

Loop:
    ldr    r0, [r2], #4 // Load value and advance address by 4 bytes
    add    r4, r4, #1   // Increment element count
    cmp    r3, r2       // Compare current address with end address
    bne    Loop         // Loop until end

_stop:
    b _stop

.data
.align
Data:
    .word   4,5,-9,0,3,0,8,-7,12 // The list of data
_Data: // End of list address

.end
