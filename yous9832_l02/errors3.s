/*
-------------------------------------------------------
errors3.s
-------------------------------------------------------
Author:Antoine Youssef
ID:169069832
Email:yous9832@mylaurier.ca
Date:2025/01/31`
-------------------------------------------------------
Copies contents of one vector to another.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

.text // code section
// Copy contents of first element of Vec1 to Vec2
ldr r0, =Vec1
ldr r1, =Vec2
ldr r2, [r0]
str r2, [r1]
// Copy contents of second element of Vec1 to Vec2
add r0, r0, #4 //Changed 2 to 4 as 4 is the size of a byte
add r1, r1, #4
ldr r2, [r0]
str r2, [r1]
// Copy contents of second element of Vec1 to Vec2
add r0, r0, #4 // r1 to r0
add r1, r1, #4
ldr r2, [r0]
str r2, [r1]//Changed r2 to r1 
// End program
_stop:
b _stop

.data // Initialized data section
Vec1:
.word 1, 2, 3
.bss // Uninitialized data section
Vec2:
.space 12 //changed .word to .space to allocate memory to the second vector and size for 3 items each of 4 bytes

.end