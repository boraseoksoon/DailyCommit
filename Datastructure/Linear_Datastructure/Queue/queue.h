//
//  queue.h
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef queue_h
#define queue_h

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
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

/* define */

// #define ARRAY__QUEUE    1
#define LIST__QUEUE     1

/* header */
#ifdef LIST__QUEUE

typedef int64_t queue_int;

typedef struct QueueNode {
    queue_int data;
    struct QueueNode *next;
} queueNode;

typedef struct Queue {
    queueNode *front;
    queueNode *rear;
    queue_int count;
} queue;

#elif ARRAY_QUEUE

#endif

/* function declaration */
void initQueue(queue* queue);
queue_int isEmpty(queue* queue);
void enqueue(queue* queue, queue_int data);
queue_int dequeue(queue* queue);
void printQueueAll(queue* queue);

#endif /* queue_h */
