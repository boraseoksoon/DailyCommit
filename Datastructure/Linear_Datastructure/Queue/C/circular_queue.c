//
//  circular_queue.c
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "circular_queue.h"

void initCircularQueue(circular_queue* queue) {
    
    memset(queue->arrayIndex, 0, CIRCULAR_QUEUE_SIZE);
    queue->front = 0;
    queue->rear = 0;
}

bool isCircularQueueEmpty(circular_queue queue) {
    
    return (queue.front == queue.rear) ? true : false;
}

bool isCircularQueueFull(circular_queue queue) {
    
    return (queue.front == (queue.rear + 1) % CIRCULAR_QUEUE_SIZE) ? true : false;
}

void circular_enqueue(circular_queue* queue, int64_t data) {
    
    // if queue is full
    if (isCircularQueueFull(*queue)) {
        perror("circular queue is full status.\n");
        return ;
    }
    
    // Otherwise,
    else {
        queue->rear += 1;
        queue->rear = queue->rear % CIRCULAR_QUEUE_SIZE;
        queue->arrayIndex[queue->rear] = data;
    }
}

int64_t circular_dequeue(circular_queue* queue) {
    
    // if queue is empty
    if (isCircularQueueEmpty((*queue))) {
        perror("there is no node to dequeue. circular queue is currently empty status.\n");
        return (int64_t)NULL;
    }
    
    queue->front += 1;
    queue->front = queue->front % CIRCULAR_QUEUE_SIZE;
    return queue->arrayIndex[queue->front];
}

void printAllCircularQueueNode(circular_queue queue) {
    
    if (isCircularQueueEmpty((queue))) {
        perror("there is no node to print in circular queue..\n");
        return ;
    }
    
    else {
        
        printf("** Print Circular Queue : [");
        
        for (int64_t i = queue.front + 1; i <= queue.rear; i++) {
            printf(" %lld", queue.arrayIndex[i]);
        }
        printf(" ]\n");
    }
}
