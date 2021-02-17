extern printf

extern scanf

global quads

segment .data

outputpurpose db "This program will find the roots of the quadratic equation ", 10, 0
input_coeff db "Please enter the three floating point coefficients of a quadratic equation in the order a, b, c separated by white spaces. Then press enter: ", 10, 0
output_equation db "Thank you. The equation is "%5.3lf"x^2 + "%5.3lf"x + "%5.3lf" = 0.0", 10, 0


input_c "%lf%lf%lf", 0

segment .bss

segment .text

quads:
