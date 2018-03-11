package com.boraseoksoon.suit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class AttackSuit extends AbstractSuit {
    public AttackSuit(String suitName) {
        this.suitName = suitName;
    }

    @Override
    public String getSuitName() {
        return this.suitName;
    }
}
