package com.boraseoksoon.factory;

import com.boraseoksoon.suit.*;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class OneConcreteFactory extends AbstractOneFactory {
    @Override
    public AbstractSuit createSuit(String suitName) {
        switch (suitName) {
            case "attack":
                return new AttackSuit(suitName);
            case "stealth":
                return new StealthSuit(suitName);
            default:
                return new AttackSuit(suitName);
        }
    }
}
