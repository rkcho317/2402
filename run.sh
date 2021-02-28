#!/bin/bash

#Author: Rosa Cho
#Program name: Quadratic Demo

rm *.o, *.lis, *.out
echo " " #Blank line

echo "Compile the Cfile second_degree.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o second_degree.o second_degree.c 

echo "Assemble the X86 file quadratic.asm"
nasm -f elf64 -o quadratic.o quadratic.asm

echo "Compile the C++ file quad_library.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o quad_library.o quad_library.cpp -std=c++14

echo "Compile the C++ file isfloat.cpp"
g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++14

echo "Link the 'O' files second_degree.o and quadratic.o"
g++ -m64 -std=c++14 -fno-pie -no-pie -o quad second_degree.o quadratic.o isfloat.o quad_library.o

echo "Run the program Quadratic"
./quad

echo "This Bash script file will now terminate.  Bye."
