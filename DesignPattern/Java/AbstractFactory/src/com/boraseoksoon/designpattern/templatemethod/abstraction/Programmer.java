package com.boraseoksoon.designpattern.templatemethod.abstraction;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public abstract class Programmer {
    public void doCoding() {
        prepareDevelopementEnvironment();
        if (isMoreDevice()) {
            getMoreRequiredDevice();
        }
        enjoyCoding();
        finishCoding();

    }

    protected abstract void prepareDevelopementEnvironment();
    protected abstract void enjoyCoding();
    protected abstract void finishCoding();

    public boolean isMoreDevice() {
        return false;
    }

    public void getMoreRequiredDevice(){}
}
