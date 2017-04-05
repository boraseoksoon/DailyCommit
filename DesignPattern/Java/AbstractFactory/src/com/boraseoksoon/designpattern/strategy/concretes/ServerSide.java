package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class ServerSide implements ProgrammingAble {
    @Override
    public void printProgrammingAbilities() {
        System.out.println("Server Side PL : C#, Java, Scala, Python, Javascript, GOLang, Swift!");
    }
}
