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
//   File name: auad_library.cpp
//   Language: C++
//   Max page width: 65 columns
//   Compile: g++ -c -m64 -Wall -fno-pie -no-pie -o quad_library.o quad_library.cpp -std=c++14
//   Link: g++ -m64 -std=c++14 -fno-pie -no-pie -o quad.out second_degree.o quadratic.o isfloat.o quad_library.o



#include <stdio.h>
#include <iostream>

extern "C" void show_no_root;
extern "C" void show_one_root;
extern "C" void show_two_root;


//quad_library


void show_no_root(double a, double b){

		std::cout<< "There are no roots.\n"<<std::endl;
	
}

void show_one_root(double a, double b){

		std::cout<< "The root is %5.3lf\n", root<< std::endl;
		
}

void show_two_root(double a, double b){

			std::cout<< "The roots are %5.3lf and %5.3lf\n", root1, root2 <<std::endl;
		  
}
