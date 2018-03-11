package com.boraseoksoon.suit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class StealthSuit extends AbstractSuit {
    public StealthSuit (String suitName) {
        this.suitName = suitName;
    }

    @Override
    public String getSuitName() {
        return this.suitName;
    }
}
