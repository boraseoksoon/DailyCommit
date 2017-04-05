package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class ClientSide implements ProgrammingAble {
    @Override
    public void printProgrammingAbilities() {
        System.out.println("Client Side PL : C, C++, Objective-C, Swift, Java, C#, Javascript!");
    }
}
