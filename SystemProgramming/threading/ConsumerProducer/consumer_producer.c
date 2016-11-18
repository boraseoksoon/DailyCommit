#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

#define BUFF_SIZE		100
#define NUMBER_OF_THREAD	2
#define NUMBER_OF_PRODUCT	100000

void* producer(void* arg);
void* consumer(void* arg);

int buffer[BUFF_SIZE];		// buffer size to use. 
int count = 0;			// buffer remaining item number
int in = -1;	// Producer index
int out = -1;	// Consumer index

// critical section
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

// condition variable for Mutex between threads.
pthread_cond_t buffer_has_space = PTHREAD_COND_INITIALIZER;
pthread_cond_t buffer_has_data = PTHREAD_COND_INITIALIZER;

int main(int argc, char* argv[], char* envp[]){ 
	
	pthread_t threads[NUMBER_OF_THREAD];
	pthread_create(&threads[0], NULL, producer, NULL);
	pthread_create(&threads[1], NULL, consumer, NULL);

	pthread_join(threads[0], NULL);
	pthread_join(threads[1], NULL);

	pthread_cond_destroy(&buffer_has_space); 
	pthread_cond_destroy(&buffer_has_data);

	pthread_exit(NULL);

	printf("main ends!\n"); 
	
	return 1;
}

void* consumer(void* arg) {

	int i, data = 0;

	for (int i = 0; i < NUMBER_OF_PRODUCT; i++) {
	
		// sleep(1);
	
		printf("		** the consumer gets mutex_lock.\n");
		pthread_mutex_lock(&mutex);
		printf("		** consumer in the critical section.\n");

		
		if (count == 0) {
			printf("		** consumer blocked, waiting for signal. buffer is empty..\n");
			pthread_cond_wait(&buffer_has_data, &mutex);
		}

		out+=1;
		out = out % 100;
		data = buffer[out];
		count-=1;

		printf("		** the consumer throws signal : buffer_has_data.\n");
		pthread_cond_signal(&buffer_has_space);

		pthread_mutex_unlock(&mutex);
		printf("		** the consumer unlocks mutex!\n");

		printf("		the consumer is consuming data : %d\n", data);

		printf("\n\n");
	}
}

void* producer(void* arg) {
	
	int i = 0;

	for (int i = 0; i < NUMBER_OF_PRODUCT; i++) {
		
		// sleep(1);
		
		printf("the producer is producing the data : %d\n", i);

		printf("** the producer gets mutex_lock.\n");
		pthread_mutex_lock(&mutex);	
		printf("** producer in the critical section.");

		if (count == BUFF_SIZE) {
			printf("** producer blocked, waiting for signal. buffer size is full now.\n");
			pthread_cond_wait(&buffer_has_space, &mutex);
		}

		in+=1;
		in = in % 100;
		buffer[in] = i;
		count+=1;

		printf("** producer throws signal : buffer_has_data.\n");
		pthread_cond_signal(&buffer_has_data);
		
		pthread_mutex_unlock(&mutex);
		printf("** the producer unlocks mutex!\n");

		printf("\n\n");
	}
}
