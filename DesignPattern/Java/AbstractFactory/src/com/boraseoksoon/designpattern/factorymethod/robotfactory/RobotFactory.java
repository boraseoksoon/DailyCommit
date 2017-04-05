package com.boraseoksoon.designpattern.factorymethod.robotfactory;

import com.boraseoksoon.designpattern.factorymethod.robot.AbstractRobot;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public abstract class RobotFactory {
    public abstract AbstractRobot createRobot(String name);
}
