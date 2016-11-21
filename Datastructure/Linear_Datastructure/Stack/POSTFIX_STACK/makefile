CC = clang
TARGET = postfix_stack 
OBJECTS = main.o stack.o stack_postfix.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
