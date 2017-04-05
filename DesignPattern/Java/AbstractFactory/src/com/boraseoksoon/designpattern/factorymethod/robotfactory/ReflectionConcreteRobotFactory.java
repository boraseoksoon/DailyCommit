package com.boraseoksoon.designpattern.factorymethod.robotfactory;

import com.boraseoksoon.designpattern.factorymethod.robot.AbstractRobot;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class ReflectionConcreteRobotFactory extends RobotFactory {
    @Override
    public AbstractRobot createRobot(String name) {
        try {
            Class<?> cls = Class.forName(name);
            Object obj = cls.newInstance();
            return (AbstractRobot)obj;
        } catch (Exception e) {
            return null;
        }
    }
}
