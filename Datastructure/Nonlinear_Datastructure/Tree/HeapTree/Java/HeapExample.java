import java.util.Scanner;

public class HeapExample {
 
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
	System.out.println("******* Min Heap begins **********");
        System.out.print(">> Input next number.. 'exit' to stop: ");  
	String userInput = sc.next();

	// Min Heap Tree practice.
        MinHeap<Integer> minHeap = new MinHeap<Integer>();

        while (!userInput.equals("exit")) {

            minHeap.insert(Integer.parseInt(userInput));
            System.out.println(minHeap);
            System.out.print(">> Input next number. input 'exit' to exit : ");
            userInput = sc.next();

        }
         
        while (!minHeap.isEmpty()) {
            int max = minHeap.delete();
            System.out.println(max + " " + minHeap);
        }
   
	// Max Heap Tree practice. 
	System.out.println("******* Max Heap begins **********");
        System.out.print(">> Input next number.. 'exit' to stop: ");  
	userInput = sc.next();

	MaxHeap<Integer> maxHeap = new MaxHeap<Integer>();

        while (!userInput.equals("exit")) {

            maxHeap.insert(Integer.parseInt(userInput));
            System.out.println(maxHeap);
            System.out.print(">> Input next number. input 'exit' to exit : ");
            userInput = sc.next();

        }
         
        while (!maxHeap.isEmpty()) {
            int max = maxHeap.delete();
            System.out.println(max + " " + maxHeap);
        }
    }  
}
