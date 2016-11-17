//
//  main.c
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "queue.h"
#include "circular_queue.h"

#define ENQUEUE_SIZE    10

int main(int argc, char* argv[], char** envp) {
    
#ifdef LIST__CIRCULAR__QUEUE
    printf("****** CIRCULAR QUEUE implemented BY ARRAY Begins ------> \n");
#elif ARRAY_CIRCULAR__QUEUE
    printf("****** CIRCULAR QUEUE implemented BY ARRAY Begins ------> \n");
#endif
    printf("****** CIRCULAR QUEUE Ends ------> \n");
    
#ifdef LIST__QUEUE
    printf("****** QUEUE implemented BY LIST Begins ------> \n");
    
#elif ARRAY_QUEUE
    printf("****** QUEUE implemented BY ARRAY Begins ------> \n");
#endif

    queue queue;
    initQueue(&queue);

    
    printf("** Now, enqueue-ing bunch of datas...\n");
    
    for (queue_int i = 1; i <= ENQUEUE_SIZE; i++) {
        enqueue(&queue, i);
    }
    
    printQueueAll(&queue);
    
    while (!isEmpty(&queue)) {
        printf("dequeue-ing! : %lld\n", dequeue(&queue));
    }
    
    printf("\n");

    printf("****** QUEUE Ends ------> \n");
    
    return 1;
}

