CC = clang
TARGET = sort
OBJECTS = sort_utility.o selection_sort.o insertion_sort.o bubble_sort.o quick_sort.o main.o

all : $(TARGET)

$(TARGET) : $(OBJECTS) 
	$(CC) -o $@ $^

clean : 
	rm *.o $(TARGET)
