#!/bin/bash

echo "Welcome to IncIn, an inline interpreter for c";

while true; do
	read -p ">>> " code

	#Write out file
	echo "#include <stdio.h>" > temp.c;
	echo "int main(void) {" >> temp.c;
		echo $code >> temp.c;
	echo "return 0;}" >> temp.c;
	
	#compile
	gcc temp.c -o temp;
	
	#run
	./temp;
	
	#cleanup
	rm temp.c;
	rm ./temp;
	echo
done
