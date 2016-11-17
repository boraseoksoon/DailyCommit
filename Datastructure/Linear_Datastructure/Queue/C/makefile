CC = clang
TARGET = queue
OBJECTS = main.o queue.o circular_queue.o queue_array.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
