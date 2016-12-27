//
//  array_graph.h
//  Graph
//
//  Created by Seoksoon Jang on 2016. 11. 30..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef array_graph_h
#define array_graph_h

#include <stdbool.h>

typedef struct ArrayGraphType {
    int maxVertexCount;
    int currentVertexCount;
    int graphType;
    int** ppAdjEdge;
    int* pVertex;
} ArrayGraph;

// create a undirected / directed graph.
ArrayGraph* createArrayGraph(int maxVertexCount);
ArrayGraph* createArrayDirectedGraph(int maxVertexCount);

void deleteArrayGraph(ArrayGraph* pGraph);

int isEmptyArrayGraph(ArrayGraph* pGraph);

// add vertexs for the graph.
int addVertexArrayGraph(ArrayGraph* pGraph, int vertexID);

// add edges for undirected/directed graph.
int addEdgeAG(ArrayGraph* pGraph, int fromVertexID, int toVertexID);
int addEdgeWithWeightArrayGraph(ArrayGraph* pGraph, int fromVertexID, int toVertexID, int weight);

// remove.
int removeVertexArrayGraph(ArrayGraph* pGraph, int vertexID);
int removeEdgeArrayGraph(ArrayGraph* pGraph, int fromVertexID, int toVertexID);

#define USED        1
#define NOT_USED    0

#define SUCCESS     1
#define FAIL        0

#define GRAPH_UNDIRECTED    1
#define GRAPH_DIRECTED      2

#endif /* array_graph_h */
