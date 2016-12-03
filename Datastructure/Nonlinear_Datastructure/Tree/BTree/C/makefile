CC = clang
TARGET = BTree
OBJECTS = main.o btlinkedstack.o btree.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
