package com.boraseoksoon.designpattern.templatemethod.concrete;

import com.boraseoksoon.designpattern.templatemethod.abstraction.Programmer;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class iOSDeveloper extends Programmer {
    @Override
    public void prepareDevelopementEnvironment() {
        System.out.println("macOS, Xcode setup! fresh nice tool, Swift too!");
    }

    @Override
    public void enjoyCoding() {
        System.out.println("start iOS coding!");
    }

    @Override
    public void finishCoding() {
        System.out.println("iOS App done!");
    }

    @Override
    public boolean isMoreDevice() {
        return true;
    }

    @Override
    public void getMoreRequiredDevice() {
        System.out.println("iPhone is needed to cross compile! : Optional method");
    }
}
