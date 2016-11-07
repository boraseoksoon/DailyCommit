array_list : c_array_list.o main.o
	clang -o array_list c_array_list.o main.o

c_array_list.o : c_array_list.c
	clang -c c_array_list.c

main.o : main.c
	clang -c main.c

clean : 
	rm *.o 
