package com.boraseoksoon.designpattern.abstractfactory.machineFactory;

import com.boraseoksoon.designpattern.abstractfactory.machineA.IMachineA;
import com.boraseoksoon.designpattern.abstractfactory.machineA.MachineA2;
import com.boraseoksoon.designpattern.abstractfactory.machineB.IMachineB;
import com.boraseoksoon.designpattern.abstractfactory.machineB.MachineB2;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */
public class MachineFactoryB implements IMachineFactory{
    public IMachineA getMachineA() {
        return new MachineA2();
    }

    public IMachineB getMachineB() {
        return new MachineB2();
    }
}
