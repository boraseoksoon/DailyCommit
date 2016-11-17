//
//  main.c
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "queue.h"
#include "queue_array.h"
#include "circular_queue.h"

#define ENQUEUE_SIZE    10

int main(int argc, char* argv[], char** envp) {
    

    printf("****** CIRCULAR QUEUE Begins ------> \n");
    circular_queue circular_queue;
    initCircularQueue(&circular_queue);
    circular_enqueue(&circular_queue, 1);
    circular_enqueue(&circular_queue, 2);
    circular_enqueue(&circular_queue, 3);
    circular_enqueue(&circular_queue, 4);
    circular_enqueue(&circular_queue, 5);
    circular_enqueue(&circular_queue, 6);

    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    printf("circular_queue dequeue : %lld\n", circular_dequeue(&circular_queue));
    
    circular_enqueue(&circular_queue, 6);
    circular_enqueue(&circular_queue, 7);
    circular_enqueue(&circular_queue, 8);
    
    printAllCircularQueueNode(circular_queue);
    
    
    printf("****** CIRCULAR QUEUE Ends ------> \n");
    
#ifdef LIST__QUEUE
    printf("****** QUEUE implemented BY LIST Begins ------> \n");
    
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

#endif
    printf("****** QUEUE implemented BY ARRAY Begins ------> \n");
    
    arrayQueue arr_queue;
    initArrayQueue(&arr_queue);

    printf("array queue - enqueing...\n");
    for (__int64_t i = 0; i < ARRAY_QUEUE_MAX_SIZE; i++) {
        arr_enqueue(&arr_queue, i);
    }
    printf("array queue enqueue compelted.\n");
    printArrayQueueAll(arr_queue);
    
    /*
    if (isQueueFull(arr_queue)) {
        printf("true!\n");
    } else {
        printf("false!\n");
    }
    */
    
    for (__int64_t i = arr_queue.rear; i > ARRAY_QUEUE_INITIALIZE_INDEX + 3; i--) {
        printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    }
    
    printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    printArrayQueueAll(arr_queue);
    printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    printArrayQueueAll(arr_queue);
    printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    printArrayQueueAll(arr_queue);
    
    printf("from here!!!\n");
    
    arr_enqueue(&arr_queue, 100);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 200);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 300);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 400);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 500);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 600);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 700);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 800);
    printArrayQueueAll(arr_queue);
    
    for (__int64_t i = arr_queue.rear; i > ARRAY_QUEUE_INITIALIZE_INDEX; i--) {
        printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    }
    
    printf("dequeue from arrayQueue : %lld\n", arr_dequeue(&arr_queue));
    
    printf("****** QUEUE implemented BY ARRAY Ends ------> \n");
    
    arr_enqueue(&arr_queue, 1000);
    printArrayQueueAll(arr_queue);
    arr_enqueue(&arr_queue, 2000);
    printArrayQueueAll(arr_queue);
    

    return 1;
}

