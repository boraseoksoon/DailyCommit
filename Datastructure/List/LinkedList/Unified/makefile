CC = clang
TARGET = linked_list
OBJECTS = main.o singly_linkedlist.o doubly_linkedlist.o circulary_linkedlist.o doubly_circular_linkedlist.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
