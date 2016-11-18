#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int ncount;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void* do_loop(void* data) {
	
	printf("do_loop locks!\n");
	pthread_mutex_lock(&mutex);
	printf("do_loop in the critical section!\n");

	for (int i = 0; i < 10; i++) {
		printf("loop1 : %d\n", ncount);
		ncount++;
		sleep(1);
	}

	pthread_mutex_unlock(&mutex);
	printf("do_loop unlocks!\n");
}

void* do_loop2(void* data) {

	printf("		do_loop2 locks!\n");	
	pthread_mutex_lock(&mutex);
	printf("		do_loop2 in the critical section!\n");	

	for (int i = 0; i < 10; i++) {
		printf("loop2 : %d\n", ncount);
		ncount++;
		sleep(1);
	} 

	pthread_mutex_unlock(&mutex);
	printf("		do_loop unlocks!\n");
}

int main(int argc, char* argv[], char** envp){
	
	int thr_id;
	pthread_t p_thread[2];
	int status;
	int a = 1;

	ncount = 0;
	thr_id = pthread_create(&p_thread[0], NULL, do_loop, (void *)&a);
	sleep(1);
	thr_id = pthread_create(&p_thread[1], NULL, do_loop2, (void *)&a);

	pthread_join(p_thread[0], (void *) &status);
	pthread_join(p_thread[1], (void *) &status);

	status = pthread_mutex_destroy(&mutex);
	printf("code = %d\n", status);
	printf("main function is end\n");

	return 1;
}
