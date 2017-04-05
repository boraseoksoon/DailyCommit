package com.boraseoksoon.designpattern.strategy.concretes;

import com.boraseoksoon.designpattern.strategy.abstractions.Programmer;
import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;
import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class SoftwareDeveloper extends Programmer {

    public SoftwareDeveloper() {
        ProgrammingAble serverSideSkill = new ServerSide();
        ProgrammingAble clientSideSkill = new ClientSide();
        ComputerScienceTheoretical practicalTheory = new PracticalClose();

        setClientSideAbility(clientSideSkill);
        setCsPracticeCloseKnowledge(practicalTheory);
        setServerSideAbility(serverSideSkill);
    }

    protected void introduceMyself() {
        System.out.println("Hello, I'm Software Developer, Let me introduce myself!");
        String introduction = toString();
        System.out.println(introduction);

    }

    @Override
    public String toString() {
        return "SoftwareDeveloper{" +
                "name='" + getName()+ '\'' +
                ", gender='" + getGender() + '\'' +
                ", height_cm=" + getHeight_cm() +
                ", weight_kg=" + getWeight_kg();
    }
}
