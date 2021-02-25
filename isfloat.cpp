#include <stdio.h>
#include <iostream>
#include "isdigit.cpp"

extern "C" bool isfloat(char []);

//isfloat
/*The plan is save the input as a string, 
pass it to isDigit as a string, 
make sure all elements are numbers with one “.”. 
If that’s true, return a 1 (true). 
Then call is float and look for that one “.”, 
which is silly because it seems we can do that in isDigit(). 
If it returns a 1, we turn that string into a float in the .asm file*/

bool isfloat(char a[]){
	bool result = true;
    bool b_result = false;
    int start = 0;
    if (a[0] == '-' || a[0] == '+') start = 1;
    unsigned long int k = start;
    while (!(a[k] == '\0') && result )
    {    if (a[k] == '.' && !b_result) 
               b_result = true;
         else
               result = result && isdigit(a[k]) ; 
         k++;
     }
     return result && b_result;
}
