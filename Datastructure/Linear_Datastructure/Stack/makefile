CC = clang
TARGET = stack 
OBJECTS = main.o stack.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
