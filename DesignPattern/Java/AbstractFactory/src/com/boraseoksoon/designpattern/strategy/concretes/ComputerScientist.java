package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.abstractions.Programmer;
import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;
import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class ComputerScientist extends Programmer {

    public ComputerScientist() {
        ProgrammingAble clientSideSkill = new ClientSide();
        ComputerScienceTheoretical practicalTheory = new PracticalClose();
        ComputerScienceTheoretical theoryclose = new TheoryClose();

        setClientSideAbility(clientSideSkill);
        setCsPracticeCloseKnowledge(practicalTheory);
        setCsTheoryCloseKnowledge(theoryclose);
    }

    protected void introduceMyself() {
        System.out.println("Hello, I'm Computer Scientist, Let me introduce myself!");
        String introduction = toString();
        System.out.println(introduction);

    }

    @Override
    public String toString() {
        return "Computer Scientist {" +
                "name='" + getName()+ '\'' +
                ", gender='" + getGender() + '\'' +
                ", height_cm=" + getHeight_cm() +
                ", weight_kg=" + getWeight_kg();
    }
}
