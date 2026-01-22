/*
-------------------------------------------------------
l06_t03.s
-------------------------------------------------------
Author: Antoine Youssef
ID: 169069832
Email: yous9832@mylaurier.ca
Date:    2024-03-06
-------------------------------------------------------
Working with stack frames.
Finds the common prefix of two null-terminate strings.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 80

.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov r3, #SIZE
stmfd sp!, {r3}
ldr r3, =Common
stmfd sp!, {r3}
ldr r3, =Second
stmfd sp!, {r3}
ldr r3, =First
stmfd sp!, {r3}

bl     FindCommon
add sp, sp, #16

_stop:
b      _stop

//-------------------------------------------------------
FindCommon:
/*
-------------------------------------------------------
Equivalent of: FindCommon(*first, *second, *common, size)
Finds the common parts of two null-terminated strings from the beginning of the
strings. Example:
first: "pandemic"
second: "pandemonium"
common: "pandem", length 6
-------------------------------------------------------
Parameters:
  first - pointer to start of first string
  second - pointer to start of second string
  common - pointer to storage of common string
  size - maximum size of common
Uses:
  r0 - address of first
  r1 - address of second
  r2 - address of common
  r3 - value of max length of common
  r4 - character in first
  r5 - character in second
-------------------------------------------------------
*/

//=======================================================

// prologue: save registers and get parameters from stack

//=======================================================

stmfd   sp!, {fp}       // preserve frame pointer
mov    fp, sp           // Save current stack top to frame pointer
stmfd  sp!, {r0-r5}     // preserve other registers

ldr r0, [fp, #4]
ldr r1, [fp, #8]
ldr r2, [fp, #12]
ldr r3, [fp, #16]

FCLoop:
cmp    r3, #1          // is there room left in common?
beq    _FindCommon     // no, leave subroutine
ldrb   r4, [r0], #1    // get next character in first
ldrb   r5, [r1], #1    // get next character in second
cmp    r4, r5
bne    _FindCommon     // if characters don't match, leave subroutine
cmp    r5, #0          // reached end of first/second?
beq    _FindCommon
strb   r4, [r2], #1    // copy character to common
sub    r3, r3, #1      // decrement space left in common
b      FCLoop

_FindCommon:
mov    r4, #0
strb   r4, [r2]        // terminate common with null character

ldmfd sp!, {r0-r5}
ldmfd sp!, {fp}
bx lr


//-------------------------------------------------------
.data
First:
.asciz "pandemic"
Second:
.asciz "pandemonium"
Common:
.space SIZE

.end