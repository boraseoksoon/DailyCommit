package com.boraseoksoon.factory2;

import com.boraseoksoon.factory.AbstractOneFactory;
import com.boraseoksoon.suit.AbstractSuit;
import com.boraseoksoon.suit.AttackSuit;
import com.boraseoksoon.suit.StealthSuit;
import com.boraseoksoon.suit2.AbstractTwoSuit;
import com.boraseoksoon.suit2.FireSuit;
import com.boraseoksoon.suit2.SpaceSuit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class TwoConcreteFactory extends AbstractOneFactory {
    @Override
    public AbstractSuit createSuit(String suitName) {
        switch (suitName) {
            case "fire":
                return new FireSuit(suitName);
            case "space":
                return new SpaceSuit(suitName);
            default:
                return new FireSuit(suitName);
        }
    }
}
