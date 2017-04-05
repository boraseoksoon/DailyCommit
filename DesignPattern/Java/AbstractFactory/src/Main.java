import com.boraseoksoon.designpattern.abstractfactory.machineFactory.IMachineFactory;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryA;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryB;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotA;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotB;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.ConcreteRobotFactory;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.ReflectionConcreteRobotFactory;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.RobotFactory;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class Main {
    public static void main(String[] args) {
        /* Factory Method Pattern */
        RobotFactory robotFactory = new ConcreteRobotFactory();
        ConcreteRobotA robotA = (ConcreteRobotA) robotFactory.createRobot("A");
        ConcreteRobotB robotB = (ConcreteRobotB) robotFactory.createRobot("B");

        System.out.println(robotA.getName());
        System.out.println(robotB.getName());

        RobotFactory reflectionRobotFactory = new ReflectionConcreteRobotFactory();
        ConcreteRobotA reflectionRobotA = (ConcreteRobotA) reflectionRobotFactory.createRobot("com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotA");
        ConcreteRobotB reflectionRobotB = (ConcreteRobotB) reflectionRobotFactory.createRobot("com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotB");

        System.out.println("/* using java reflection! */");
        System.out.println(reflectionRobotA.getName());
        System.out.println(reflectionRobotB.getName());


        /* Abstract Factory Pattern */
        IMachineFactory machineFactoryA = new MachineFactoryA();
        machineFactoryA.getMachineA().process();
        machineFactoryA.getMachineB().process();

        IMachineFactory machineFactoryB = new MachineFactoryB();
        machineFactoryB.getMachineA().process();
        machineFactoryB.getMachineB().process();


    }
}
