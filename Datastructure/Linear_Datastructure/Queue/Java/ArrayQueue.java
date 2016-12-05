public class ArrayQueue implements Queue {
 
    private int front;
    private int rear;
    private int queueSize;
    private String[] itemArray;
 
    public ArrayQueue(int queueSize) {
        front = -1;
        rear = -1;
        // 초기의 front와 rear는 같은 위치선상에 있음
 
        this.queueSize = queueSize;
        itemArray = new String[this.queueSize];
    }
 
    public boolean isEmpty() {
        return (front == rear);
    }
 
    public boolean isFull() {
        return (rear == this.queueSize - 1);
    }
 
    public void enQueue(String item) {
        if (isFull()) {
            System.out.println("삽입 실패! 큐가 꽉찼습니다!");
        } else {
            itemArray[++rear] = item;
            System.out.println("삽입된 아이템 : " + item);
        }
    }
 
    public String deQueue() {
        if (isEmpty()) {
            System.out.println("삭제 실패! 큐가 비어있습니다!");
            return null;
        } else {
            return itemArray[++front];
        }
    }
 
    public void delete() {
        if (isEmpty()) {
            System.out.println("삭제 실패! 큐가 비어있습니다!");
        } else {
            ++front;
        }
    }
 
    public String peek() {
        if (isEmpty()) {
            System.out.println("삭제 실패! 큐가 비어있습니다!");
            return null;
        } else {
            return itemArray[front + 1];
        }
    }
 
    public void printQueue() {
        if (isEmpty()) {
            System.out.println("큐가 비어있습니다!");
        } else {
            System.out.print("큐 >> ");
 
            for (int i = front + 1; i <= rear; i++)
                System.out.print(itemArray[i] + " ");
            System.out.println();
        }
    }



    public static void main(String[] args) {
	ArrayQueue queue = new ArrayQueue(5);
	queue.enQueue("A");
	queue.enQueue("B");
	queue.enQueue("C");
	

	System.out.println("dequeue : " + queue.deQueue());	
	System.out.println("dequeue : " + queue.deQueue());	

	queue.printQueue();
    }

}
