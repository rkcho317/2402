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
;  Files in this program: second_degree.cpp, quad_library.cpp, isfloat.cpp, isdigit.cpp, quadratic.asm
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
extern  isfloat
extern  quad_library

global quads

segment .data

outputpurpose db "This program will find the roots of the quadratic equation ", 10, 0
input_coeff db "Please enter the three floating point coefficients of a quadratic equation in the order a, b, c separated by white spaces. Then press enter: ", 10, 0
output_equation db "Thank you. The equation is %5.3lf x^2 + %5.3lf x + %5.3lf = 0.0", 10, 0
output_returncaller db "One of these roots will be returned to the caller function.", 10, 0
error_message db "Incorrect input. Please try again", 10, 0

input_c db "%s%s%s", 0
output_three_float db "%lf%lf%lf",0


segment .bss

segment .text
quads:

push qword 0

;Display Welcome Message
mov rax,0
mov rdi, outputpurpose
call printf
pop rax

;Display User Input Message
mov rax,0
mov rdi, input_coeff
call printf
pop rax

sub rsp, 1024

;Accept input of three numbers for the quadratic formula
push qword 99
mov rax, 0
mov rdi, input_c
mov rsi, rsp
mov rdx, rsp 
add rdx, 8
mov rcx, rsp
add rcx, 16
call scanf

;Implement isfloat.cpp
;mov rax,0 
mov rdi, rsp
call isfloat

add rsp, 1024

;cmp rax, 0
;je invalidRoot

mov rax, 0
mov rdi, rsp
call atof
movsd xmm5, xmm0
mov rdi,rsp
add rdi, 8
call atof
movsd xmm6, xmm0
mov rdi, rsp
add rdi,16
movsd xmm7, xmm0

 

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



invalidRoot:
mov rax,0
mov rdi, error_message
call printf
pop rax