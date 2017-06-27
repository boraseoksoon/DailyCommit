/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
public class ConcreteMediator extends Mediator {
    @Override
    void mediate(String sendData) {
        for (Colleague colleague : colleagueList) {
            colleague.handleData(sendData);
        }
    }
}
