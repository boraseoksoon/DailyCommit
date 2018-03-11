package com.boraseoksoon.factory2;

import com.boraseoksoon.suit.AbstractSuit;
import com.boraseoksoon.suit2.AbstractTwoSuit;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public abstract class AbstractTwoFactory {
    AbstractSuit suit = null;
    abstract public AbstractTwoSuit createSuit(String suitName);
}
