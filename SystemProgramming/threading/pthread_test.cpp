#include <iostream>
#include <cstdlib>
#include <pthread.h>

using namespace std;

#define NUM_THREADS     5

void* pthreadSayingHello(void *threadid) {
   long tid;
   tid = (long)threadid;
   cout << " Hello World! Thread ID, " << tid << endl;
   cout.flush();
   pthread_exit(NULL);
}

int main () {
   pthread_t threads[NUM_THREADS];
   int rc;
   int i;
	
   for( i=0; i < NUM_THREADS; i++ ){
      cout << "main() : creating thread, " << i << endl;
      cout.flush();
      rc = pthread_create(&threads[i], NULL, pthreadSayingHello, (void *)i);
		
      if (rc){
         cout << "Error:unable to create thread," << rc << endl;
	 cout.flush();
         exit(-1);
      }
   }
	
   pthread_exit(NULL);
}
