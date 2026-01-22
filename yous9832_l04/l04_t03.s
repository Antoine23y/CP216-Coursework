/*
-------------------------------------------------------
l04_t03.s
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
ldr    r0, [r2], #4 
mov    r6, r0       
mov    r7, r0

Loop:

ldr    r0, [r2], #4 // Read value from address and move to next (r0 = *r2, r2 += 4)

cmp    r0, r6       
movlt  r6, r0       

cmp    r0, r7       
movgt  r7, r0

bne    Loop         // If not at end, continue

_stop:
b _stop



.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data

_Data: // End of list address

.end