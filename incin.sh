#!/bin/bash

echo "Welcome to IncIn, an inline interpreter for c";

#check for env var, generic cc, then specific compilers
if [ "x$CC" = "x" ]; then
	for i in cc gcc clang; do
		if which "$i" >& /dev/null ; then
			CC=`which $i`
			break
		fi
	done
fi

#die meaningfully if no compiler
if [ "x$CC" = "x" ]; then
	echo "No c compiler found. Exiting."
	exit 42
fi

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
	$CC temp.c -o temp;
	
	#run
	./temp;
	#cleanup
	#rm temp.c;
	#rm ./temp;
	echo
done
