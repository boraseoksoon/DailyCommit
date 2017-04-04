package com.boraseoksoon.designpattern.abstractfactory.machineFactory;

import com.boraseoksoon.designpattern.abstractfactory.machineA.IMachineA;
import com.boraseoksoon.designpattern.abstractfactory.machineB.IMachineB;

/**
 * Created by seoksoonjang on 2017. 4. 5..
 */


public interface IMachineFactory {
    public IMachineA getMachineA();
    public IMachineB getMachineB();
}
