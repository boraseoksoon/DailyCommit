import com.boraseoksoon.designpattern.abstractfactory.machineFactory.IMachineFactory;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryA;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryB;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotA;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotB;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.ConcreteRobotFactory;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.ReflectionConcreteRobotFactory;
import com.boraseoksoon.designpattern.factorymethod.robotfactory.RobotFactory;
import com.boraseoksoon.designpattern.strategy.concretes.*;
import com.boraseoksoon.designpattern.templatemethod.concrete.AndroidDeveloper;
import com.boraseoksoon.designpattern.templatemethod.abstraction.Programmer;
import com.boraseoksoon.designpattern.templatemethod.concrete.WebDeveloper;
import com.boraseoksoon.designpattern.templatemethod.concrete.iOSDeveloper;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class Main {
    public static void main(String[] args) {

        /* Strategy Pattern */
        com.boraseoksoon.designpattern.strategy.abstractions.Programmer softwareDeveloper =
                new SoftwareDeveloper();
        softwareDeveloper.setName("JSS");
        softwareDeveloper.setGender("Male");
        softwareDeveloper.setHeight_cm(177.0);
        softwareDeveloper.setWeight_kg(80.0);
        System.out.println("---------------");
        softwareDeveloper.printAllIntroduction();
        System.out.println("---------------");
        System.out.println("---------------");
        System.out.println("The Software Developer has improved CS theory!!");
        softwareDeveloper.setCsTheoryCloseKnowledge(new TheoryClose());
        softwareDeveloper.printAllIntroduction();
        System.out.println("---------------");

        com.boraseoksoon.designpattern.strategy.abstractions.Programmer computerScientist =
                new ComputerScientist();
        computerScientist.setName("Stephen Arthur Cook");
        computerScientist.setGender("Male");
        computerScientist.setHeight_cm(182.0);
        computerScientist.setWeight_kg(70.0);
        System.out.println("---------------");
        computerScientist.printAllIntroduction();
        System.out.println("---------------");

        com.boraseoksoon.designpattern.strategy.abstractions.Programmer coder =
                new Coder();
        coder.setName("Sucky");
        coder.setGender("Male");
        coder.setHeight_cm(200.0);
        coder.setWeight_kg(100.0);
        System.out.println("---------------");
        coder.printAllIntroduction();
        System.out.println("---------------");

        System.out.println("---------------");
        System.out.println("The Coder has studied CS theory close theory!!");
        coder.setCsTheoryCloseKnowledge(new TheoryClose());
        System.out.println("The Coder has studied Server Side Programming Ability!!");
        coder.setServerSideAbility(new ServerSide());
        coder.printAllIntroduction();
        System.out.println("---------------");

        // Dynamic Programmer
        /*
        com.boraseoksoon.designpattern.strategy.abstractions.Programmer dynamicProgrammer =
                new com.boraseoksoon.designpattern.strategy.abstractions.Programmer() {
                    @Override
                    protected void introduceMyself() {
                        System.out.println("Hello, I'm Dynamic Programmer,\nI think you do not have to know my private information!");
                    }
                };
        dynamicProgrammer.setClientSideAbility(new ClientSide());
        dynamicProgrammer.setServerSideAbility(new ServerSide());
        System.out.println("---------------");
        dynamicProgrammer.printAllIntroduction();
        System.out.println("---------------");
        */


        /* Template Method pattern */
        Programmer iOSDeveloper = new iOSDeveloper();
        iOSDeveloper.doCoding();

        System.out.println("-------");

        Programmer androidDeveloper = new AndroidDeveloper();
        androidDeveloper.doCoding();

        System.out.println("-------");
        Programmer webDeveloper = new WebDeveloper();
        webDeveloper.doCoding();

        System.out.println("-------");







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
