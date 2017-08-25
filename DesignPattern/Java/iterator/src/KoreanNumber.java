import java.util.Iterator;

/**
 * Created by seoksoonjang on 2017. 8. 25..
 */
public class KoreanNumber implements Iterable<String> {
    String[] koreanNumberList = {"하나","둘","셋","넷"};
    int index = 0;

    @Override
    public Iterator<String> iterator() {
        index = 0;
        return new Iterator<String>() {
            @Override
            public boolean hasNext() {
                return koreanNumberList.length - 1 >= index;
            }

            @Override
            public String next() {
                return koreanNumberList[index++];
            }
        };
    }
}
