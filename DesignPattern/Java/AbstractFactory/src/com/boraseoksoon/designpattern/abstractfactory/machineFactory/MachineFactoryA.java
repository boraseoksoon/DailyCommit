package com.boraseoksoon.designpattern.abstractfactory.machineFactory;

import com.boraseoksoon.designpattern.abstractfactory.machineA.IMachineA;
import com.boraseoksoon.designpattern.abstractfactory.machineA.MachineA1;
import com.boraseoksoon.designpattern.abstractfactory.machineB.IMachineB;
import com.boraseoksoon.designpattern.abstractfactory.machineB.MachineB1;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class MachineFactoryA implements IMachineFactory{
    public IMachineA getMachineA() {
        return new MachineA1();
    }

    public IMachineB getMachineB() {
        return new MachineB1();
    }
}
