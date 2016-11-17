//
//  queue_array.h
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef queue_array_h
#define queue_array_h

/* ADT) Queue.
 *
 *      (1) Object : Datastructure for FIFO(First In First Out) operation.
 *
 *      (2) Functions :
 *          2-1. Node initQueue(queue) := initialize and create one queue.
 *          2-2. BOOL isEmpty(queue) := check whether the queue is empty or not.
 *          2-2. Void enqueue() := en-queue one data to the queue following FIFO.
 *          2-3. Object dequeue() := de-queue one data from the queue following FIFO.
 */

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define ARRAY_QUEUE_MAX_SIZE  5
#define ARRAY_QUEUE_INITIALIZE_INDEX    -1

typedef struct ArrayQueue {
    __int64_t arrayIndex[ARRAY_QUEUE_MAX_SIZE];
    __int64_t front;
    __int64_t rear;
} arrayQueue;

/* function declaration */
void initArrayQueue(arrayQueue* queue);
bool isQueueEmpty(arrayQueue queue);
bool isQueueFull(arrayQueue queue);
void arr_enqueue(arrayQueue* queue, __int64_t data);
__int64_t arr_dequeue(arrayQueue* queue);
void printArrayQueueAll(arrayQueue queue);

#endif /* queue_array_h */
