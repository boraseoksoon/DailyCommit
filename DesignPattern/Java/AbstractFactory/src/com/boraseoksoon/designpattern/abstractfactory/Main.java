package com.boraseoksoon.designpattern.abstractfactory;

import com.boraseoksoon.designpattern.abstractfactory.machineFactory.IMachineFactory;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryA;
import com.boraseoksoon.designpattern.abstractfactory.machineFactory.MachineFactoryB;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class Main {
    public static void main(String[] args) {
        IMachineFactory machineFactoryA = new MachineFactoryA();
        machineFactoryA.getMachineA().process();
        machineFactoryA.getMachineB().process();

        IMachineFactory machineFactoryB = new MachineFactoryB();
        machineFactoryB.getMachineA().process();
        machineFactoryB.getMachineB().process();
    }
}
