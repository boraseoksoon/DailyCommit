import java.util.Iterator;

public class Main {

    public static void main(String[] args) {
        System.out.println("-------------Korean");
        KoreanNumber koreanWordList = new KoreanNumber();
        for(String koreanWord : koreanWordList) {
            System.out.println(koreanWord);
        }

        System.out.println("-------------");

        Iterator iter = koreanWordList.iterator();

        while (iter.hasNext()) {
            System.out.println(iter.next());
        }

        System.out.println("-------------English");

        EnglishNumber englishNumber = new EnglishNumber();

        for (String word: englishNumber) {
            System.out.println(word);
        }

        System.out.println("-------------");

        Iterator<String> iterator = englishNumber.iterator();

        while(iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
