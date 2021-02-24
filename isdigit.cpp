#include <stdio.h>
#include <iostream>

//return 1 if the char argument supplied is 0 to 9

bool isdigit(char in){
char arr_a[10] = {0,1,2,3,4,5,6,7,8,9};

	for (int i = 0; i<=10; i++){
		if (in == i){
		return 1;
		}
		else{
		return 0;
		}
	}

}
