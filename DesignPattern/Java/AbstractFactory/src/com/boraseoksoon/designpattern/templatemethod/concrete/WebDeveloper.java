package com.boraseoksoon.designpattern.templatemethod.concrete;

import com.boraseoksoon.designpattern.templatemethod.abstraction.Programmer;

/**
 * Created by seoksoonjang on 2017. 4. 6..
 */
public class WebDeveloper extends Programmer {
    @Override
    public void prepareDevelopementEnvironment() {
        System.out.println("Web-browser, Atom editor setup!");
    }

    @Override
    public void enjoyCoding() {
        System.out.println("start Web development Coding!");
    }

    @Override
    public void finishCoding() {
        System.out.println("Wep application done!");
    }
}

