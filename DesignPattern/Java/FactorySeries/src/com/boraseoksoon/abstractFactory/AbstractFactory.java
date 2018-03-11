package com.boraseoksoon.abstractFactory;

import com.boraseoksoon.factory.AbstractOneFactory;
import com.boraseoksoon.suit.AbstractSuit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class AbstractFactory {
    static public AbstractSuit createSuit(AbstractSuit suit) {
        return suit;
    }
}
