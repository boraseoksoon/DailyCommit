#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
 
void *thread0(void *);
void *thread1(void *);
pthread_t tid[4];
pthread_mutex_t    mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t    cond = PTHREAD_COND_INITIALIZER;
 
int main(int argc, char* argv[], char* envp[]) {
    
    int i = 0;
    int id[4];
 
    id[0] = 0;
    pthread_create(&tid[0], NULL, thread0, (void*)&id[0]);

    id[1] = 1;
    pthread_create(&tid[1], NULL, thread1, (void*)&id[1]);
  
    sleep(2);
    
    // wake up 'a thread' using signal. if you want to wake up all, use pthread_cond_broadcast instead of pthread_cond_signal.
    // (if there are many thread using same conditional variable, waking up random)
    pthread_cond_signal(&cond);
 
    
    for(i = 0; i < 2 ; i++){
        pthread_join(tid[i], NULL);
    }
     
    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond);
 
    return 0;
}
 
void *thread1(void *arg){

    printf("mutex locks in threading number : %d\n", *((int*)arg));
    pthread_mutex_lock(&mutex);
    printf("in the critical section, threading number : %d\n", *((int*)arg));

    printf("threading number : 0 is now pthread_cond_wait\n");
    pthread_cond_wait(&cond, &mutex);

    printf("wake up from threading number : %d\n", *((int*)arg)); 
    printf("threading number : %d is now sleep..\n", *((int*)arg));
    sleep(5);   
    printf("threading number : %d mutex unlock!\n", *((int*)arg));
    pthread_mutex_unlock(&mutex);
}


void *thread0(void *arg){

    printf("mutex locks in threading number : %d\n", *((int*)arg));
    pthread_mutex_lock(&mutex);
    printf("in the critical section, threading number : %d\n", *((int*)arg));


    printf("threading number : 1 is now pthread_cond_wait\n");
    pthread_cond_wait(&cond, &mutex);

    printf("wake up from threading number : %d\n", *((int*)arg));  
    printf("threading number : %d is now sleep..\n", *((int*)arg));
    sleep(5);   
    printf("threading number : %d mutex unlock!\n", *((int*)arg));
    pthread_mutex_unlock(&mutex);
}

