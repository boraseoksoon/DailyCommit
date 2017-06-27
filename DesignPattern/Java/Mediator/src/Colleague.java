/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
public abstract class Colleague {
    Mediator mediator;

    public void join(Mediator mediator) {
        if (mediator == null) {
            return;
        }

        this.mediator = mediator;
        mediator.addColleague(this);
    }

    void sendData(String data) {
        if (mediator == null) {
            return;
        }

        mediator.mediate(data);
    }

    abstract void handleData(String sendData);
}
