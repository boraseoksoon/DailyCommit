package subsystem;

/**
 * Created by seoksoonjang on 2017. 6. 27..
 */
class Subsystem2 implements Subsystematic {
    @Override
    public void process() {
        System.out.println("process by " + this);
    }
}
