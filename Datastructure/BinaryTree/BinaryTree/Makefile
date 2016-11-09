binary_tree : binary_tree.o main.o
	clang -o binary_tree binary_tree.o main.o
binary_tree.o : 
	clang -c binary_tree.c 
main.o : 
	clang -c main.c

clean : 
	rm *.o binary_tree 
