//
//  queue.c
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "queue.h"

/* 
 * function declaration information hiding
 * because user does not need to know this function.
 */
queueNode* createQueueNode (queue_int data) {
    
    queueNode* enqueueNode = (queueNode *)malloc(sizeof(queueNode)); //노드 생성
    enqueueNode->data = data;
    enqueueNode->next = NULL;
    
    return enqueueNode;
}
/* private func ends */

void initQueue(queue* queue) {
    
    queue->front = NULL;
    queue->rear = NULL;
    
    queue->count = 0;
}

queue_int isEmpty(queue* queue) {
    
    if (queue->count == 0) {
        return true;
    }
    else {
        return false;
    }
}

void enqueue(queue* queue, queue_int data) {
    
    queueNode* enqueueNode = createQueueNode(data);
    
    if (isEmpty(queue)) {
        queue->front = enqueueNode;
    }
    else {
        queue->rear->next = enqueueNode;
    }
    
    queue->rear = enqueueNode;
    queue->count++;
}

queue_int dequeue(queue* queue) {
    
    queue_int dequeue_data = 0;

    if (isEmpty(queue)) {
        return dequeue_data;
    }

    dequeue_data = (queue->front)->data;
    queue->front = (queue->front)->next;
    (queue)->count--;
    
    free(queue->front);

    return dequeue_data;
}

void printQueueAll(queue* queue) {
    
    printf("Print Queue ----> \n");
    printf("[");
    
    queueNode* runNode = queue->front;
    
    
    // iteration in while loop.
    while (runNode->next != NULL) {
        printf("%lld ", runNode->data);
        runNode = runNode->next;
    }
    
    // iteration in for loop.
    /*
     for (queue_int queueNodeCount = (queue)->count; queueNodeCount > 0; queueNodeCount--) {
     printf("%lld ", runNode->data);
     runNode = runNode->next;
     }
     */
    printf("]\n");
}
