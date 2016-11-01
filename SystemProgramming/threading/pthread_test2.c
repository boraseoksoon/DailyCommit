#include <stdio.h> 
#include <pthread.h> 
#include <unistd.h> 

#define LOOP_MAX_SIZE	10

void* pthread_loop(void *data)
{
    int i = 0;

    int pthread_loop_data = *((int *)data);
    for (i = 0; i < LOOP_MAX_SIZE; i++)
    {
        printf("thread data : %d - is Running on %d number of loop index\n", pthread_loop_data, i);
        sleep(1);
    }
}

int main(int argc, char* argv[], char** envp)
{
    int thread_id;
    pthread_t p_thread[3];
    int thread_status;

    int a = 1;
    int b = 2;      
    int c = 3;      

    thread_id = pthread_create(&p_thread[0], NULL, pthread_loop, (void *)&a);
    thread_id = pthread_create(&p_thread[1], NULL, pthread_loop, (void *)&b);
    thread_id = pthread_create(&p_thread[2], NULL, pthread_loop, (void *)&c);

    pthread_join(p_thread[0], (void **) &thread_status);
    pthread_join(p_thread[1], (void **) &thread_status);
    pthread_join(p_thread[2], (void **) &thread_status);

    printf("programing(main function) ends after all thread joins\n");

    return 0;
}

