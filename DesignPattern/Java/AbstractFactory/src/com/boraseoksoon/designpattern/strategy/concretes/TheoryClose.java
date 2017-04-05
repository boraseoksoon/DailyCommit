package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class TheoryClose implements ComputerScienceTheoretical {
    @Override
    public void printComputerScienceTheories() {
        System.out.println("Algorithm, DataStructure, Compiler, Discrete Mathematics!");
    }
}
