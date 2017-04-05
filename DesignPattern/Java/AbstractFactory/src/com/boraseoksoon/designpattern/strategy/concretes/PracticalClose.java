package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class PracticalClose implements ComputerScienceTheoretical {
    @Override
    public void printComputerScienceTheories() {
        System.out.println("OperatingSystem, Database, Network, Computer Architecture!");
    }
}
