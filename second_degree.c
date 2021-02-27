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
