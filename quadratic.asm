;****************************************************************************************************************************
;Program name: "Quadratic Computation and Validation".  This program demonstrates how to turn
;an input of a string in to three floats then use those floats to calculate a
;quadratic equation. Once we get the roots from that equation, we determine
;how many valid ones are there.
;Copyright (C) 2021 Rosa Cho.                                                                           *
;                                                                                                                           *
;This file is part of the software program "Quadratic Computation and Validation".                                                                   *
;Quadratic Computation and Validation is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                    *
;Quadratic Computation and Validation is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************

;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@csu.fullerton.edu
;
;Program information
;  Program name: Quadratic Computation and Validation
;  Programming languages: Three modules in C++, one in C, and one module in X86
;  Date program began: 2021-Feb-18
;  Date of last update: 2021-Feb-28
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
extern isfloat
extern show_no_root
extern show_one_root
extern show_two_root
global quads

segment .data

outputpurpose db "This program will find the roots of the quadratic equation ", 10, 0
inputstring1 db "Please enter the first coefficient or coefficient a: ", 10, 0
inputstring2 db "Please enter the second coefficient or coefficient b: ", 10, 0
inputstring3 db "Please enter the third coefficient or coefficient c: ", 10, 0
output_equation db "Thank you. The equation is %5.3lf x^2 + %5.3lf x + %5.3lf = 0.0", 10, 0
output_returncaller db "One of these roots will be returned to the caller function.", 10, 0
error_message db "Incorrect input. Please try again", 10, 0

string1 db "%s",0
string2 db "%s",0
string3 db "%s",0

output_root db "%lf",0


float4 dq 4.0
float2 dq 2.0

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

sub rsp, 512


;Begin calling for and accepting inputs for the quadratic formula

;Prompt for the first coefficient input
mov qword rdi, inputstring1
mov qword rax, 0
call printf

;Accept input for the first coefficient
mov rax, 0
mov rdi, string1   ;%s
mov rsi, rsp
call scanf

;Implement isfloat.cpp to see if the first coefficient input is a floating number
mov rax,0
mov rdi, rsp
call isfloat
cmp rax, 0
je invalidRoot

;Convert the first coefficient input to float
mov rax, 1
mov rdi, rsp
call atof
movsd xmm15, xmm0
movsd xmm5, xmm15

;Prompt for the second coefficient input
mov qword rdi, inputstring2
mov qword rax, 0
call printf

;Accept input for the second coefficient
mov rax, 0
mov rdi, string2   ;%s
mov rsi, rsp
call scanf

;Implement isfloat.cpp to see if the second coefficient input is a floating number
mov rax,0
mov rdi, rsp
call isfloat
cmp rax, 0
je invalidRoot

;Convert the second coefficient input to float
mov rax, 1
mov rdi, rsp
call atof
movsd xmm15, xmm0
movsd xmm6, xmm15

;Prompt for the third coefficient input
mov qword rdi, inputstring3
mov qword rax, 0
call printf

;Accept input for the third coefficient
mov rax, 0
mov rdi, string3   ;%s
mov rsi, rsp
call scanf

;Implement isfloat.cpp to see if the third coefficient input is a floating number
mov rax,0
mov rdi, rsp
call isfloat
cmp rax, 0
je invalidRoot

;Convert the third coefficient input to float
mov rax, 1
mov rdi, rsp
call atof
movsd xmm15, xmm0
movsd xmm7, xmm15

invalidRoot:
mov rax, 0
mov rsi, error_message
call printf
jmp see

see:
add rsp, 512

;Calculate the quadratic formula

;a * c
movsd xmm8, xmm5
mulsd xmm8, xmm7

;4*ac
mulsd xmm8, [float4]

;b^2
movsd xmm9, xmm6
mulsd xmm9, xmm6

;b^2 - 4ac
subsd xmm9, xmm8

;sqrtd(b^2-4ac) aka the determinant
sqrtsd xmm9, xmm9


;Determine how many roots there are based off of the determinant's value
mov r8,0
cvtsi2sd xmm10, r8
ucomisd xmm9, xmm10          ;compare the determinant to 0
jb nega_det                  ;if the determinant is <0
je zero_det                  ;if the determinant is =0
ja posi_det                  ;if the determinant is >0


nega_det:
jmp noroot

zero_det:
jmp oneroot

posi_det:
jmp tworoot

noroot:
mov rax,1
mov rdi, rsp
call show_no_root
jmp end

oneroot:
;Calculate
;sqrtd(b^2-4ac) + b
movsd xmm11, xmm9
addsd xmm11, xmm6

;2a
movsd xmm13, xmm5
mulsd xmm13, [float2]

;root = (sqrtd(b^2-4ac) + b) / 2a
divsd xmm11, xmm13
movsd xmm14, xmm11
jmp show_one

show_one:
;Call show_one_root
mov rax, 1
mov rdi, rsp
movsd xmm0, xmm14
call show_one_root
jmp end

tworoot:
;calculate
;sqrtd(b^2-4ac) - b
movsd xmm11, xmm9
subsd xmm11, xmm6

;sqrtd(b^2-4ac) + b
movsd xmm12, xmm9
addsd xmm12, xmm6

;2a
movsd xmm13, xmm5
mulsd xmm13, [float2]

;root 1 = (sqrtd(b^2-4ac) - b) / 2a
divsd xmm11, xmm13
movsd xmm14, xmm11

;root 2 = (sqrtd(b^2-4ac) + b) / 2a
divsd xmm12, xmm5
movsd xmm15, xmm12

jmp show_two

show_two:
mov rax, 1
mov rdi, rsp
movsd xmm0, xmm14
movsd xmm1, xmm15
call show_two_root
jmp end

end:
;Display Exit Message 1
mov rax, 1
mov rdi, rsp
mov rdi, output_equation
movsd xmm0, xmm5
movsd xmm1, xmm6
movsd xmm2, xmm7
call printf


;Display Exit Message 2
mov rax,0
mov rdi, output_returncaller
call printf

movsd xmm0, xmm14

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
