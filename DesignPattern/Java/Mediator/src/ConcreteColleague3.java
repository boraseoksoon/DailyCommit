/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
public class ConcreteColleague3 extends Colleague {
    @Override
    void handleData(String sendData) {
        System.out.println(this + " " + sendData);
    }
}
