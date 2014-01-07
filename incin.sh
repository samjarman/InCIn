#!/bin/bash

echo "Welcome to IncIn, an inline interpreter for c";

while true; do
	read -p ">>> " code

	#Write out file
	echo "#include <stdio.h>" > temp.c;
	echo "int main(void) {" >> temp.c;
		echo $code >> temp.c;
	echo "return 0;}" >> temp.c;
	gcc temp.c -o temp;
	./temp;
	rm temp.c;
	rm ./temp;
	echo
done

float a = 4.233234234; printf("Num = %0.2f", a);