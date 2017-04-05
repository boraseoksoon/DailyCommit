package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.abstractions.Programmer;
import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;
import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;
import com.boraseoksoon.designpattern.strategy.interfaces.Stupid;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class Coder extends Programmer implements Stupid  {

    @Override
    public void sayIamPoser() {
        System.out.println("But, I am just only Posing all the time though I wrote I know those skills!");
    }

    public Coder () {
        System.out.println("I'm Coder. I have had nothing I've been able to do by myself and my-direct ability seriously!\nI am always busy posing and inflating myself more than really I am!");
    }

    protected void introduceMyself() {
        System.out.println("Hello, I'm Coder, Let me introduce myself!");
        String introduction = toString();
        System.out.println(introduction);
    }

    @Override
    public String toString() {
        return "Coder {" +
                "name='" + getName()+ '\'' +
                ", gender='" + getGender() + '\'' +
                ", height_cm=" + getHeight_cm() +
                ", weight_kg=" + getWeight_kg();
    }
}
