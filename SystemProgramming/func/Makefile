strcpy.out : strlen.o strcpy.o
	clang -o strcpy.out strlen.o strcpy.o
strlen.o : strlen.c
	clang -c strlen.c
strcpy.o : strcpy.c
	clang -c strcpy.c
clean : 
	rm *.o strcpy.out

