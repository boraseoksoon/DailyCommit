import com.boraseoksoon.abstractFactory.AbstractFactory;
import com.boraseoksoon.factory.*;
import com.boraseoksoon.factory2.AbstractTwoFactory;
import com.boraseoksoon.factory2.TwoConcreteFactory;
import com.boraseoksoon.suit.*;

/**
 * Created by seoksoonjang on 2018. 3. 11..
 */
public class FactorySeries {
    public static void main(String args[]) {
        System.out.println(">>>>>>>>>>>>>>>>>> Factory Pattern!");
        // Factory Pattern
        AbstractOneFactory factory1 = new OneConcreteFactory();

        AbstractSuit attackSuit = factory1.createSuit("attack");
        String name = attackSuit.getSuitName();
        System.out.println(name);

        AbstractSuit stealthSuit = factory1.createSuit("stealth");
        String name2 = stealthSuit.getSuitName();
        System.out.println(name2);

        System.out.println(">>>>>>>>>>>>>>>>>> Abstract Factory Pattern!");
        // Abstract Factory Pattern
        AbstractOneFactory concreteFactory = new TwoConcreteFactory();
        AbstractSuit fireSuit = AbstractFactory.createSuit(concreteFactory.createSuit("fire"));
        String name3 = fireSuit.getSuitName();
        System.out.println(name3);

        AbstractSuit spaceSuit = AbstractFactory.createSuit(concreteFactory.createSuit("space"));
        String name4 = spaceSuit.getSuitName();
        System.out.println(name4);

        AbstractSuit newAttackSuit = AbstractFactory.createSuit(factory1.createSuit("attack"));
        String name5 = newAttackSuit.getSuitName();
        System.out.println(name5);

        AbstractSuit newStealthSuit = AbstractFactory.createSuit(factory1.createSuit("stealth"));
        String name6 = newStealthSuit .getSuitName();
        System.out.println(name6);
    }
}
