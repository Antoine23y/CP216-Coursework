/*
-------------------------------------------------------
count2.s
-------------------------------------------------------
Author: Antoine Youssef
ID: 169069832
Email: yous9832@mylaurier.ca
Date: 7/2/2025
-------------------------------------------------------
A simple count down program (bge)
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Store data in registers
ldr r3, =COUNTER
ldr r3, [r3]

TOP:
sub r3, r3, #1 // Decrement the countdown value
cmp r3, #0  // Compare the countdown value to 0
bge TOP   // Branch to top under certain conditions

_stop:
b _stop

.data
COUNTER: .word 5

.end