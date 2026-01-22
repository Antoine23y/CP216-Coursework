/*
-------------------------------------------------------
l08_t03.s
-------------------------------------------------------
Author: Antoine Youssef
ID: 169069832
Email: you9832@mylaurier.ca
Date:    2025-03-21
-------------------------------------------------------
Echoes characters from the UART to the UART until the Enter key is pressed.
Does not use memory for storing the string.
-------------------------------------------------------
*/
.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

bl    EchoString  // Call the EchoString subroutine

_stop:
b _stop  // Infinite loop to stop execution

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address for DE1-SoC
.equ VALID, 0x8000          // Mask to check for valid data in UART
.equ ENTER, 0x0A            // ASCII code for the Enter key

EchoString:
/*
-------------------------------------------------------
Echoes characters from the UART to the UART.
Stops echoing when the Enter key is pressed.
-------------------------------------------------------
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/
stmfd sp!, {r0, r1}          // Push r0 and r1 to stack to preserve their values

ldr   r1, =UART_BASE         // Load the base address of the UART into r1

echoLOOP:
    ldr   r0, [r1]           
    tst   r0, #VALID         
    beq   echoLOOP           
    and   r0, r0, #0xFF      
    cmp   r0, #ENTER         
    beq   _EchoDone          
    str   r0, [r1]           
    b     echoLOOP          

_EchoDone:
ldmfd sp!, {r0, r1}          // Pop r0 and r1 from stack to restore their original values
bx    lr                     // Return from subroutine

.end
