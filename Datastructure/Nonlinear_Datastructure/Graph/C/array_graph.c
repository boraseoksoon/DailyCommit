//
//  array_graph.c
//  Graph
//
//  Created by Seoksoon Jang on 2016. 11. 30..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "array_graph.h"

ArrayGraph* createArrayGraph(int maxVertexCount) {

    ArrayGraph* agPointer = NULL;
    
    // maximum vertex count should be more than 0.
    if (maxVertexCount > 0) {
        
        agPointer = (ArrayGraph*) malloc(sizeof(ArrayGraph));
        
        if (agPointer == NULL) {
            perror("error, memory alloc in createdArrayGraph!\n");
            return NULL;
        }
        
        // setup and initialize : graph type and max vertex count.
        agPointer->graphType = GRAPH_UNDIRECTED;
        agPointer->maxVertexCount = maxVertexCount;
    }
    
    else {
        perror("error, Maximum node number should be more than 0!\n");
        return NULL;
    }
    
    agPointer->pVertex = (int* )malloc(sizeof(int) * maxVertexCount);
    
    if (agPointer->pVertex == NULL) {
        perror("Error, memory alloc in createArrayGraph 2!\n");
        return NULL;
    }
    
    
    agPointer->ppAdjEdge = (int**) malloc(sizeof(int*) * maxVertexCount);
    
    if (agPointer->ppAdjEdge == NULL) {
        perror("Error, memory alloc in createArrayGraph 3!\n");
        
        if (agPointer->pVertex != NULL) {
            free(agPointer->pVertex);
        }
        
        if (agPointer != NULL) {
            free(agPointer);
        }
        
        return NULL;
    }

    for (int i = 0; i < maxVertexCount; i++) {
        
        agPointer->ppAdjEdge[i] = (int *)malloc(sizeof(int) * maxVertexCount);
        
        if (agPointer->ppAdjEdge[i] != NULL) {
            perror("Error, memory alloc in createArrayGraph 4!\n");
            
            
            for (int j = 0; j < -i-1; j++) {
                if (agPointer->ppAdjEdge[j] != NULL) {
                    free(agPointer->ppAdjEdge[j]);
                }
            }
            
            if (agPointer->ppAdjEdge != NULL) {
                free(agPointer->ppAdjEdge);
            }
            
            if (agPointer->pVertex != NULL) {
                free(agPointer->pVertex);
            }
            
            if (agPointer != NULL) {
                free(agPointer);
            }
            
            return NULL;
        }
    }
    
    memset(agPointer->pVertex, NOT_USED, sizeof(int) * maxVertexCount);
    
    for (int i = 0; i < maxVertexCount; i++) {
        memset(agPointer->ppAdjEdge[i], 0, sizeof(int) * maxVertexCount);
    }
    
    return agPointer;
}

ArrayGraph* createArrayDirectedGraph(int maxVertexCount) {
    
    ArrayGraph* agPointer = NULL;
    
    agPointer = createArrayDirectedGraph(maxVertexCount);
    
    if (agPointer != NULL) {
        agPointer->graphType = GRAPH_DIRECTED;
    }
    
    return agPointer;
}

/*
void deleteArrayGraph(ArrayGraph* pGraph) {
    
}

int isEmptyArrayGraph(ArrayGraph* pGraph) {
    
}

// add vertexs for the graph.
int addVertexArrayGraph(ArrayGraph* pGraph, int vertexID) {
    
}

// add edges for undirected/directed graph.
int addEdgeAG(ArrayGraph* pGraph, int fromVertexID, int toVertexID) {
    
}

int addEdgeWithWeightArrayGraph(ArrayGraph* pGraph, int fromVertexID, int toVertexID, int weight) {
    
}

// remove.
int removeVertexArrayGraph(ArrayGraph* pGraph, int vertexID) {
    
}

int removeEdgeArrayGraph(ArrayGraph* pGraph, int fromVertexID, int toVertexID) {
    
}
*/
