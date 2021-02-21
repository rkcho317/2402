#include <stdio.h>

extern double quads();

//quad_library

double a,b = 0.0
a,b = quads();
	
void show_no_root(double a,b){
	if (a=0.0 && b = 0.0){
		std::cout< "No root";
	}
}

void show_one_root(double a,b){
		if (a == b){
		std::cout< "One root";
		}
}

void show_two_root(double a,b){
		  if (a != b){
			std::cout<<"Two roots";
		  }
}
