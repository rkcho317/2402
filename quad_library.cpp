#include <stdio.h>
#include <iostream>

extern double quads();

//quad_library

double a,b = 0.0;
a,b = quads();
	
void show_no_root(double a, double b){
	if (a==0.0 && b == 0.0){
		std::cout<< "There are no roots."<<std::endl;
		std::cout<< "The roots are "<< a << " and "<< b <<std::endl;
	}
}

void show_one_root(double a, double b){
		if (a == b){
		std::cout<< "The root is "<< a <<std::endl;
		}
}

void show_two_root(double a, double b){
		  if (a != b){
			std::cout<< "The roots are "<< a << " and "<< b <<std::endl;
		  }
}
