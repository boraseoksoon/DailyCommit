import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class Main {
    public static void main(String[] args) {
        List<Integer> datas = new ArrayList<Integer>(Arrays.asList(0, 1, 2, 3, 4, 5, 6, 7, 8, 9));
        List<Integer> mut = new ArrayList<Integer>(datas.map(() => arguments[0] + 10 ));
        System.out.println(mut);
    }
}
