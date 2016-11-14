import java.util.ArrayList;
import java.util.NoSuchElementException;
 
public class MinHeap<T extends Comparable<T>> {
     
    private ArrayList<T> items;
     
    public MinHeap() {
        items = new ArrayList<T>();
    }
         
    private void moveUp() {

        int k = items.size() - 1;

        while (k > 0) {

            int p = (k-1)/2;
            T item = items.get(k);
            T parent = items.get(p);

            if (item.compareTo(parent) < 0) {
                // swap
                items.set(k, parent);
                items.set(p, item);
                 
                // move up one level
                k = p;
            } else {
                break;
            }
        }
    }
       
    private void moveDown() {

        int k = 0;
        int nodeToMoveUp = 2 * k + 1;

        while (nodeToMoveUp < items.size()) {
            
            // find child two binary nodes.
            int max = nodeToMoveUp;
            int r = nodeToMoveUp + 1;

	    // if there is a right child...
            if (r < items.size()) {
                if (items.get(r).compareTo(items.get(nodeToMoveUp)) < 0) {
                    max++;
                }
            }

            if (items.get(k).compareTo(items.get(max)) > 0) {
                    // swap
                    T temp = items.get(k);
                    items.set(k, items.get(max));
                    items.set(max, temp);
                    k = max;
                    nodeToMoveUp = 2 * k + 1;
            } else {
                break;
            }
        }
    }

    public void insert(T item) {
        items.add(item);
        moveUp();
    }
   
    public T delete() throws NoSuchElementException {

        if (items.size() == 0) {
            throw new NoSuchElementException();
        }

        if (items.size() == 1) {
            return items.remove(0);
        }

        T hold = items.get(0);
        items.set(0, items.remove(items.size()-1));
        moveDown();

        return hold;
    }
 
    public int size() {
        return items.size();
    }
     
    public boolean isEmpty() {
        return items.isEmpty();         
    }
     
    public String toString() {
        return items.toString();
    }
}
