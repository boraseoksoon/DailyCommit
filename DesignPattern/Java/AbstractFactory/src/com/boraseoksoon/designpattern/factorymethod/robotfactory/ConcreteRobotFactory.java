package com.boraseoksoon.designpattern.factorymethod.robotfactory;

import com.boraseoksoon.designpattern.factorymethod.robot.AbstractRobot;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotA;
import com.boraseoksoon.designpattern.factorymethod.robot.ConcreteRobotB;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class ConcreteRobotFactory extends RobotFactory {
    @Override
    public AbstractRobot createRobot(String name) {
        switch (name) {
            case "A" : return new ConcreteRobotA();
            case "B" : return new ConcreteRobotB();
        }

        return null;
    }
}
