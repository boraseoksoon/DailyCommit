package subsystem;

/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
public class Facade {

    Subsystematic subsystem1;
    Subsystematic subsystem2;
    Subsystematic subsystem3;

    public Facade() {
        subsystem1 = new Subsystem1();
        subsystem2 = new Subsystem2();
        subsystem3 = new Subsystem3();
    }

    public void handleProcess() {
        subsystem1.process();
        subsystem2.process();
        subsystem3.process();
    }
}
