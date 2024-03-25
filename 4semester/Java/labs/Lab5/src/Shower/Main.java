package Shower;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Shower shower = new Shower();
        List<Person> people = new ArrayList<Person>();
        people.add(new Person("Man1", Gender.MAN, shower));
        people.add(new Person("Woman1", Gender.WOMAN, shower));
        people.add(new Person("Man2", Gender.MAN, shower));
        people.add(new Person("Man3", Gender.MAN, shower));
        people.add(new Person("Woman2", Gender.WOMAN, shower));
        people.add(new Person("Woman3", Gender.WOMAN, shower));
        people.add(new Person("Man4", Gender.MAN, shower));
        people.add(new Person("Man5", Gender.MAN, shower));
        people.add(new Person("Man6", Gender.MAN, shower));
        people.add(new Person("Woman4", Gender.WOMAN, shower));

        for (Person person : people){
            person.start();
        }
    }
}
