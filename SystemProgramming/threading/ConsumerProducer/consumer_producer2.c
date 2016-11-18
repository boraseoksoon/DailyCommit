#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

#define BUFF_SIZE		100
#define NUMBER_OF_THREAD	2
#define NUMBER_OF_PRODUCT	1000

void* producer(void* arg);
void* consumer(void* arg);

int buffer[BUFF_SIZE];		// buffer size to use. 
int count = 0;			// buffer remaining item number
int input = -1;	// Producer index
int output = -1;	// Consumer index

// critical section
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

// condition variable for Mutex between threads.
pthread_cond_t space_required = PTHREAD_COND_INITIALIZER;
pthread_cond_t data_required = PTHREAD_COND_INITIALIZER;

int main(int argc, char* argv[], char* envp[]){ 
	
	pthread_t threads[NUMBER_OF_THREAD];
	pthread_create(&threads[0], NULL, producer, NULL);
	pthread_create(&threads[1], NULL, consumer, NULL);

	pthread_join(threads[0], NULL);
	pthread_join(threads[1], NULL);

	pthread_cond_destroy(&space_required); 
	pthread_cond_destroy(&data_required);

	pthread_exit(NULL);

	printf("main ends!\n"); 
	
	return 1;
}

void* consumer(void* arg) {

	int i, data = 0;

	for (int i = 0; i <= NUMBER_OF_PRODUCT; i++) {
	
		// sleep(1);
	
		printf("		** the consumer gets mutex_lock.\n");
		pthread_mutex_lock(&mutex);
		printf("		** consumer input the critical section.\n");

		if ( NUMBER_OF_PRODUCT == i ) {

			printf("		** finally, the consumer throws signal to wake up producer thread sleeping!!\n");
			pthread_cond_signal(&space_required);

			pthread_mutex_unlock(&mutex);
			/*	
			output+=1;
			output = output % 100;
			data = buffer[output];
			count-=1;	

			pthread_mutex_unlock(&mutex);

			printf("		** the consumer unlocks mutex!\n");
			printf("		the consumer is consuming data : %d\n", data);
			*/

			printf("\n\n");	

		} else {


			if (count == 0) {
				printf("		** the consumer throws signal : space_required to consume to notify that the consumer has completely consumed datas..\n");
				pthread_cond_signal(&space_required);

				printf("		** consumer blocked, waiting for signal until datas are all produced in the buffer. now, buffer is empty..\n");
				pthread_cond_wait(&data_required, &mutex);
			} 
					// sleep(5);
				

			output+=1;
			output = output % 100;
			data = buffer[output];
			count-=1;

			pthread_mutex_unlock(&mutex);
			printf("		** the consumer unlocks mutex!\n");
			printf("		the consumer is consuming data : %d\n", data);

			printf("\n\n");
		}
	}
}

void* producer(void* arg) {
	
	int i = 0;

	for (int i = 0; i <= NUMBER_OF_PRODUCT; i++) {
		
		// sleep(1);
		
		printf("the producer is producing the data : %d\n", i);

		printf("** the producer gets mutex_lock.\n");
		pthread_mutex_lock(&mutex);	
		printf("** producer input the critical section.");


		printf("producer count : %d\n", count);	
		if (count == BUFF_SIZE) {
			printf("producer in!\n");
			printf("** producer throws signal : data_required to notify consumer that producer has completely produced spaces to consume.\n");
			pthread_cond_signal(&data_required);

			printf("** producer blocked, waiting for signal until buffer is all consumed.. buffer size is full now.\n");
			pthread_cond_wait(&space_required, &mutex);

			// sleep(5);
		}

		input+=1;
		input = input % 100;
		buffer[input] = i;
		count+=1;
	
		pthread_mutex_unlock(&mutex);
		printf("** the producer unlocks mutex!\n");

		printf("\n\n");
	}
}
