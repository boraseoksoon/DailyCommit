package com.boraseoksoon.suit2;

import com.boraseoksoon.suit.AbstractSuit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class FireSuit extends AbstractSuit {
    public FireSuit(String suitName) {
        this.suitName = suitName;
    }

    @Override
    public String getSuitName() {
        return this.suitName;
    }
}

