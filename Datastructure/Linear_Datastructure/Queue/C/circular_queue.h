//
//  circular_queue.h
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef circular_queue_h
#define circular_queue_h

/* ADT) Queue.
 *
 *      (1) Object : Queue implementing circular structure by array.
 *                   Datastructure or collection with restriction that insertion can be performed at one end(rear)
 *                   and deletion can be performed at another end(front).
 *
 *
 *      (2) Functions :
 *          2-1. Node initQueue(queue) := initialize and create one queue.
 *          2-2. BOOL isCircularQueueEmpty(queue) := check whether the queue is empty or not.
 *          2-3. BOOL isCircularQueueFull(queue) := check if the queus is full.
 *          2-4. Void enqueue() := en-queue one data to the queue in FIFO way.
 *          2-5. Object dequeue() := de-queue one data from the queue in FIFO way.
 *          2-6. Void printAllCircularQueueNode(queue) : print all stored data in circular queue.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define CIRCULAR_QUEUE_SIZE  5

typedef struct Circular_queue {
    int64_t arrayIndex[CIRCULAR_QUEUE_SIZE];
    int64_t front;
    int64_t rear;
} circular_queue;

/* function declaration */
void initCircularQueue(circular_queue* queue);
bool isCircularQueueEmpty(circular_queue queue);
bool isCircularQueueFull(circular_queue queue);
void circular_enqueue(circular_queue* queue, int64_t data);
int64_t circular_dequeue(circular_queue* queue);
void printAllCircularQueueNode(circular_queue queue);

#endif /* circular_queue_h */
