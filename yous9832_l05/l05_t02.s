/*
-------------------------------------------------------
l05_t02.s
-------------------------------------------------------
Author: Antoine Youssef
ID: 169069832
Email: yous9832@mylaurier.ca
Date:    2024-02-28
-------------------------------------------------------
Calculates stats on an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov    r1, #0       // Initialize counters
mov    r2, #0
mov    r3, #0
ldr    r4, =Data    // Store address of start of list
ldr    r5, =_Data   // Store address of end of list
bl     list_stats   // Call subroutine - total returned in r0

_stop:
b      _stop

//-------------------------------------------------------
list_stats:
/*
-------------------------------------------------------
Counts number of positive, negative, and 0 values in a list.
Equivalent of: void stats(*start, *end, *zero, *positive, *negatives)
-------------------------------------------------------
Parameters:
  r1 - number of zero values
  r2 - number of positive values
  r3 - number of negative values
  r4 - start address of list
  r5 - end address of list
Uses:
  r0 - temporary value
-------------------------------------------------------
*/


mov r1, #0
mov r2, #0
mov r3, #0

loop:
cmp r4,r5
bge end_loop

ldr r0,[r4], #4

cmp r0, #0
beq equal_zero
bgt moreThen_zero
b lessThen_zero

equal_zero:
add r1, r1,#1
b loop

moreThen_zero:
add r2, r2, #1
b loop

lessThen_zero:
add r3, r3, #1
b loop

end_loop:
bx lr

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end