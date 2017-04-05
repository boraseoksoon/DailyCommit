package com.boraseoksoon.designpattern.templatemethod.concrete;

import com.boraseoksoon.designpattern.templatemethod.abstraction.Programmer;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class AndroidDeveloper extends Programmer {
    @Override
    public void prepareDevelopementEnvironment() {
        System.out.println("Android Studio, Java setup!");
    }

    @Override
    public void enjoyCoding() {
        System.out.println("start Android coding!");
    }

    @Override
    public void finishCoding() {
        System.out.println("Android App done!");
    }

    @Override
    public boolean isMoreDevice() {
        return true;
    }

    @Override
    public void getMoreRequiredDevice() {
        System.out.println("Android Phone is needed to cross compile! : Optional method");
    }
}

