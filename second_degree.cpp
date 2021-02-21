#include <stdio.h>
#include <stdint.h>
#include <cmath>
#include <cstring>
#include "quad_library.cpp"

extern double quads();

int main(int argc, char* argv[]){
  double quack = 0.0;

  printf("%s\n", "Welcome to Root Calculator");
  printf("%s\n", "Programmed by Rosa Cho");

  quack = quads();
  printf("The main driver received %5.3lf and %5.3 ,and has decided to keep it. \n", quack);
	
  show_no_root();
  show_one_root();
  show_two_root();
  
  prtinf("%s\n", "Now 0 will be returned to the operating system. Have a nice day. Bye.")

  return 0;
}
