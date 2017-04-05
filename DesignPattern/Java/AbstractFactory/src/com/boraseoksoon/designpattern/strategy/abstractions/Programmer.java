package com.boraseoksoon.designpattern.strategy.abstractions;

import com.boraseoksoon.designpattern.strategy.concretes.ClientSide;
import com.boraseoksoon.designpattern.strategy.concretes.ServerSide;
import com.boraseoksoon.designpattern.strategy.interfaces.ComputerScienceTheoretical;
import com.boraseoksoon.designpattern.strategy.interfaces.ProgrammingAble;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public abstract class Programmer {
    private String name;
    private String gender;
    private double height_cm;
    private double weight_kg;

    ProgrammingAble clientSideAbility;
    ProgrammingAble serverSideAbility;
    ComputerScienceTheoretical csTheoryCloseKnowledge;
    ComputerScienceTheoretical csPracticeCloseKnowledge;

    protected abstract void introduceMyself();

    public void printAllIntroduction() {
        introduceMyself();
        printAllSkills();
    }

    private void printAllSkills() {
        if (clientSideAbility != null) {
            printClientSideAbility();
        }

        if (serverSideAbility != null) {
            printServerSideAbility();
        }

        if (csPracticeCloseKnowledge != null) {
            printCSPracticeCloseKnowledge();
        }

        if (csTheoryCloseKnowledge != null) {
            printCSTheroyCloseKnowledge();
        }
    }

    private  void printClientSideAbility() {
        clientSideAbility.printProgrammingAbilities();
    }

    private void printServerSideAbility() {
        serverSideAbility.printProgrammingAbilities();
    }

    private  void printCSTheroyCloseKnowledge() {
        csTheoryCloseKnowledge.printComputerScienceTheories();
    }

    private  void printCSPracticeCloseKnowledge() {
        csPracticeCloseKnowledge.printComputerScienceTheories();
    }

    // getter and setter

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public double getHeight_cm() {
        return height_cm;
    }

    public void setHeight_cm(double height_cm) {
        this.height_cm = height_cm;
    }

    public double getWeight_kg() {
        return weight_kg;
    }

    public void setWeight_kg(double weight_kg) {
        this.weight_kg = weight_kg;
    }

    public ProgrammingAble getClientSideAbility() {
        return clientSideAbility;
    }

    public void setClientSideAbility(ProgrammingAble clientSideAbility) {
        this.clientSideAbility = clientSideAbility;
    }

    public ProgrammingAble getServerSideAbility() {
        return serverSideAbility;
    }

    public void setServerSideAbility(ProgrammingAble serverSideAbility) {
        this.serverSideAbility = serverSideAbility;
    }

    public ComputerScienceTheoretical getCsTheoryCloseKnowledge() {
        return csTheoryCloseKnowledge;
    }

    public void setCsTheoryCloseKnowledge(ComputerScienceTheoretical csTheoryCloseKnowledge) {
        this.csTheoryCloseKnowledge = csTheoryCloseKnowledge;
    }

    public ComputerScienceTheoretical getCsPracticeCloseKnowledge() {
        return csPracticeCloseKnowledge;
    }

    public void setCsPracticeCloseKnowledge(ComputerScienceTheoretical csPracticeCloseKnowledge) {
        this.csPracticeCloseKnowledge = csPracticeCloseKnowledge;
    }

    @Override
    public String toString() {
        return "Programmer{" +
                "name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", height_cm=" + height_cm +
                ", weight_kg=" + weight_kg;
    }
}
