#include <stdio.h>
#include <iostream>
#include "isdigit.cpp"

extern "C" bool isfloat(char []);

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
