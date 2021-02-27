#include <stdio.h>
#include <iostream>

extern "C" void show_no_root();
extern "C" void show_one_root(double root);
extern "C" void show_two_root(double root1, double root2);


//quad_library


void show_no_root(double a, double b){

		std::cout<< "There are no roots.\n"<<std::endl;
	
}

void show_one_root(double root){

		std::cout<< "The root is %5.3lf\n", root<< std::endl;
		
}

void show_two_root(double a, double b){

			std::cout<< "The roots are %5.3lf and %5.3lf\n", root1, root2 <<std::endl;
		  
}
