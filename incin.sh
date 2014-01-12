#!/bin/bash

echo "Welcome to IncIn, an inline interpreter for c";
CODE=""
while true; do
	read -p ">>> " temp
	CODE="$CODE $temp" #Append old code to new

	#Write out file
	echo "#include <stdio.h>" > temp.c;
	echo "int main(void) {" >> temp.c;
		echo $CODE >> temp.c;
	echo "return 0;}" >> temp.c;
	
	#compile
	gcc temp.c -o temp;
	
	#run
	./temp;
	#cleanup
	#rm temp.c;
	#rm ./temp;
	echo
done
