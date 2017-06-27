public class Main {

    public static void main(String[] args) {

        Mediator mediator = new ConcreteMediator();

        Colleague concreteColleague1 = new ConcreteColleague1();
        Colleague concreteColleague2 = new ConcreteColleague2();
        Colleague concreteColleague3 = new ConcreteColleague3();

        concreteColleague1.join(mediator);
        concreteColleague2.join(mediator);
        concreteColleague3.join(mediator);

        concreteColleague1.sendData("1 : Hello Meditor");
        concreteColleague1.sendData("2 : Is this message going well?");
        concreteColleague1.sendData("3 : Test message");
    }
}
