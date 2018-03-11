package com.boraseoksoon.factory;

import com.boraseoksoon.suit.AbstractSuit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public abstract class AbstractOneFactory {
    AbstractSuit suit = null;
    abstract public AbstractSuit createSuit(String suitName);
}
