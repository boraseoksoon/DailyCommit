import java.util.Iterator;
import java.util.LinkedList;
 
public class Array_vs_LinkedList {
 
	private final static int MAX_SIZE = 40000000;

	public static void main(String[] args) {
   
		LinkedList lList = new LinkedList(); 

		/* insertion performance check */

		long startTime = System.currentTimeMillis();

    		for (int i=0; i<MAX_SIZE; i++) {
			lList.add(i);
    		}

	      	long stopTime = System.currentTimeMillis();
      		long elapsedTime = stopTime - startTime;
      		System.out.println("[Insert]LinkedList insert operation with " + MAX_SIZE + " number of integer elapsed time is " + elapsedTime + " millisecond.");
 
    		int[] arr = new int[MAX_SIZE];

		startTime = System.currentTimeMillis();
    		for(int i=0; i<MAX_SIZE; i++){
       			arr[i] = i; 
    		}

	      	stopTime = System.currentTimeMillis();
      		elapsedTime = stopTime - startTime;
      		System.out.println("[Insert]Array Insert operation with " + MAX_SIZE + " number of integer elapsed time is " + elapsedTime + " millisecond.");


		/* iteration performance check */
		
		startTime = System.currentTimeMillis();

		Iterator itr = lList.iterator();

    		while(itr.hasNext()) {
			itr.next();
      			// System.out.println("Linked list running : " + itr.next());
    		}

	      	stopTime = System.currentTimeMillis();
      		elapsedTime = stopTime - startTime;
      		System.out.println("[Loop]LinkedList iteration with " + MAX_SIZE + " number of integer elapsed time is " + elapsedTime + " millisecond.");


		startTime = System.currentTimeMillis();

		for (int i=0; i<MAX_SIZE; i++) {
			// System.out.println("array running : " + i); 
		}

	      	stopTime = System.currentTimeMillis();
      		elapsedTime = stopTime - startTime;
      		System.out.println("[Loop]Array iteration with " + MAX_SIZE + " number of integer elapsed time is " + elapsedTime + " millisecond.");
	}
}

