//
//  array_graph.h
//  Graph
//
//  Created by Seoksoon Jang on 2016. 11. 30..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#ifndef array_graph_h
#define array_graph_h

#include <stdio.h>

typedef struct ArrayGraphType {
    int maxVertexCount;
    int currentVertexCount;
    int graphType;
    int** ppAdjEdge;
    int* pVertex;
}; ArrayGraph;

#endif /* array_graph_h */
