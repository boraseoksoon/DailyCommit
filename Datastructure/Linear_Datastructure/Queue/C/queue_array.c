//
//  queue_array.c
//  Queue
//
//  Created by Seoksoon Jang on 2016. 11. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include "queue_array.h"

void initArrayQueue(arrayQueue* queue) {
    memset(queue, 0, ARRAY_QUEUE_MAX_SIZE);
    queue->front = ARRAY_QUEUE_INITIALIZE_INDEX;
    queue->rear = ARRAY_QUEUE_INITIALIZE_INDEX;
}

bool isQueueFull(arrayQueue queue) {
    
    if (queue.rear >= ARRAY_QUEUE_MAX_SIZE - 1){
        return true;
    }
    
    return false;
}

bool isQueueEmpty(arrayQueue queue) {
    
    if (queue.front == queue.rear) {
        return true;
    }
    
    return false;
}

void arr_enqueue(arrayQueue* queue, __int64_t data) {
    
    // if queue is full.
    if (isQueueFull(*queue)) {
        
        if ((queue->rear - queue->front)) {
            perror("array queue is now full.\n");
            return ;
        }
        
        // in order to use empty buffer array using this array queue
        // when rear and front keep increasing and are same in the end of the array buffer.
        memcpy (&queue[0], &queue[queue->front], sizeof(queue->arrayIndex[0]));
        queue->rear = ARRAY_QUEUE_INITIALIZE_INDEX;
        queue->front = ARRAY_QUEUE_INITIALIZE_INDEX;
    }
    
    queue->arrayIndex[++(queue)->rear] = data;
}

__int64_t arr_dequeue(arrayQueue* queue) {
    
    // if queue is empty
    if (isQueueEmpty(*queue)) {
        perror("array queue is now empty.\n");
        return (__int64_t)NULL;
    }
    
    return queue->arrayIndex[++(queue->front)];
}

void printArrayQueueAll(arrayQueue queue) {
    
    printf("** ArrayQueue : [ ");
    
    if (isQueueEmpty(queue)) {
        printf("Your Queue is now empty! ");
    }
    
    else {
        for (__int64_t i = queue.front + 1; i <= queue.rear; i++) {
            printf("%lld ", queue.arrayIndex[i]);
        }
    }
    
    printf("]\n");
}
