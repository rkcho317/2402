//****************************************************************************************************************************
//Program name: "Quadratic Computation and Validation".  This program demonstrates how to turn 
//an input of a string in to three floats then use those floats to calculate a 
//quadratic equation. Once we get the roots from that equation, we determine how 
//many valid ones are there.
//
// Copyright (C) 2021 Rosa Cho.                                                                           *
//                                                                                                                           *
//This file is part of the software program "Quadratic Computation and Validation".                                                                   *
//Quadratic Computation and Validation is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
//version 3 as published by the Free Software Foundation.                                                                    *
//Quadratic Computation and Validation is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
//****************************************************************************************************************************


//=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
//
//Author information
//Author name: Rosa Cho
//Author email: rkcho317@fullerton.edu
//
//Program information
//  Program name: Quadratic Computation and Validation
//  Programming languages: C
//  Date program began: 2021-Feb-18
//  Date of last update: 2021-Feb-28
//  Files in this program: second_degree.c, quad_library.cpp, isfloat.cpp, isdigit.cpp, quadratic.asm
//  Status: Finished
//
//This file
//   File name: second_degree.c
//   Language: C
//   Max page width: 54 columns
//   Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o second_degree.o second_degree.c 
//   Link: g++ -m64 -std=c++14 -fno-pie -no-pie -o quad.out second_degree.o quadratic.o isfloat.o quad_library.o


#include <stdio.h>
#include <stdint.h>

extern double quads();

int main(int argc, char* argv[]){
  double quack = 0.0;

  printf("%s\n", "Welcome to Root Calculator");
  printf("%s\n", "Programmed by Rosa Cho");

  quack = quads();
  printf("The main driver received %5.3lf ,and has decided to keep it. \n", quack);

  printf("%s\n", "Now 0 will be returned to the operating system. Have a nice day. Bye.");

  return 0;
}
