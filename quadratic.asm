;****************************************************************************************************************************
;Program name: "Quadratic".  This program demonstrates the
;
; Copyright (C) 2021 Rosa Cho.                                                                           *
;                                                                                                                           *
;This file is part of the software program "Quadratics".                                                                   *
;Quadratics is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                    *
;Quadratics is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************

;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@csu.fullerton.edu
;
;Program information
;  Program name: Quadratics
;  Programming languages: Four modules in C and one module in X86
;  Date program began: 2021-Feb-18
;  Date of last update: 2021-Feb-20
;  Files in this program: second_degree.c, quad_library.cpp, isfloat.cpp, isdigit.cpp, quadratic.asm
;  Status: In-progress
;
;This file
;   File name: quadratic.asm
;   Language: X86 with Intel syntax.
;   Max page width:
;   Assemble: nasm -f elf64 -l quadratic.lis -o quadratic.o quadratic.asm


extern printf
extern scanf
extern atof
extern stof
extern isfloat
extern quad_library
global quads

segment .data

outputpurpose db "This program will find the roots of the quadratic equation ", 10, 0
input_coeff db "Please enter the three floating point coefficients of a quadratic equation in order of a, b, c each separated by a ws then Press enter: ", 10, 0

output_equation db "Thank you. The equation is %5.3lf x^2 + %5.3lf x + %5.3lf = 0.0", 10, 0
output_returncaller db "One of these roots will be returned to the caller function.", 10, 0
error_message db "Incorrect input. Please try again", 10, 0

string1 db "%s",0

segment .bss

segment .text

quads:

;Back up Registers
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx

push qword -1

;Display Welcome Message
mov rax,0
mov rdi, outputpurpose
call printf


;Begin calling for and accepting inputs for the quadratic formula
mov rax, 0
mov rdi, input_coeff
call printf

;Input the coefficient 
sub rsp, 512
mov rax, 0
mov rdi, string1
mov rsi, rsp
call scanf

;Implement isfloat.cpp
mov rdi, rsp
call isfloat

cmp rax, 0
je invalidRoot

valid:
;Convert to float
mov rax, 0
mov rdi, rsp
call atof
movsd xmm15, xmm0
mov r15, 0
cvtsi2sd xmm8, r15
ucomisd xmm8, xmm15
je invlaid

jmp end

invalidRoot:
mov rax, 0
mov rsi, error_message
call printf
pop rax

end:
add rsp, 512

;Calculate the quadratic formula

;a * c
;movsd xmm8, xmm5
;mulsd xmm8, xmm7

;4*ac
;cvtss2sd xmm3, dword [4]
;mulsd xmm8, xmm3

;b^2
;mulsd xmm6, xmm6

;b^2 - 4ac
;movsd xmm9, xmm6
;subsd xmm9, xmm8

;sqrtd(b^2-4ac)
;sqrtsd xmm10, xmm9

;sqrtd(b^2-4ac) - b
;movsd xmm11, xmm10
;subsd xmm11, xmm6

;sqrtd(b^2-4ac) + b
;movsd xmm12, xmm10
;addsd xmm12, xmm6

;2a
;cvtss2sd xmm4, dword [2]
;mulsd xmm5, xmm4
;movsd xmm13, xmm5

;root 1 = (sqrtd(b^2-4ac) - b) / 2a
;divsd xmm11, xmm13
;movsd xmm14, xmm11

;root 2 = (sqrtd(b^2-4ac) + b) / 2a
;divsd xmm12, xmm5
;movsd xmm15, xmm12


;Display Exit Message 1
;mov rax,0
;mov rdi, output_equation
;call printf
;pop rax

;Display Exit Message 2
;mov rax,0
;mov rdi, output_returncaller
;call printf
;pop rax

;movsd xmm0, xmm14
;movsd xmm1, xmm15



;Restore Registers
pop rax                                                      
pop rbx                                                     
pop r15                                                     
pop r14                                                      
pop r13                                                      
pop r12                                                      
pop r11                                                     
pop r10                                                     
pop r9                                                      
pop r8                                                      
pop rcx                                                     
pop rdx                                                     
pop rsi                                                     
pop rdi                                                     
pop rbp

ret
