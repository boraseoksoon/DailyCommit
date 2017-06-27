import java.util.ArrayList;
import java.util.List;

/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
public abstract class Mediator {
    List<Colleague> colleagueList;

    public Mediator() {
        colleagueList = new ArrayList<Colleague>();
    }

    public boolean addColleague(Colleague colleague) {
        if (colleague == null) {
            System.out.println("Return without operation because colleague object is null ");
            return false;
        }

        return colleagueList.add(colleague);
    }

    abstract void mediate(String sendData);
}
