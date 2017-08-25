import java.util.Iterator;

/**
 * Created by seoksoonjang on 2017. 8. 25..
 */
public class EnglishNumber implements Iterable<String> {
    String[] englishWordList = {"Java", "Is", "Java"};
    int index = 0;

    @Override
    public Iterator<String> iterator() {
        index = 0;
        return new EnglishIterator();
    }

    public class EnglishIterator implements Iterator<String> {
        @Override
        public boolean hasNext() {
            return englishWordList.length - 1 >= index;
        }

        @Override
        public String next() {
            return englishWordList[index++];
        }
    }
}
