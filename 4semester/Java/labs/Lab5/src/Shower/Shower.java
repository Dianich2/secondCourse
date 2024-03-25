package Shower;

import java.util.Random;

public class Shower {

    private static final int SHOWER_CAPACITY = 3;
    private int currentCapacity = 0;
    private Gender currentGender;

    public void takeShower(Person person){
        System.out.println(person.getPersonName() + " waiting for shower");

        synchronized (this){
            checkCurrentGender(person.getGender());

            while(currentCapacity >= SHOWER_CAPACITY ||
            currentGender != person.getGender()){
                try{
                    if(currentCapacity == 0)
                        break;
                    wait();
                }catch (InterruptedException e){
                    throw new RuntimeException(e);
                }
            }
            checkCurrentGender(person.getGender());
            currentCapacity++;
            System.out.println(person.getPersonName() + " entered th shower. " +
                   "Number of people in shower: " + currentCapacity +
                    ", current gender: " + currentGender.getGender());
        }

        long showerDuration = (long) 1000 * (new Random().nextInt(10));
        try{
            Thread.sleep(showerDuration);
        }catch (InterruptedException e){
            throw new RuntimeException(e);
        }

        synchronized (this){
            person.interrupt();
            currentCapacity--;
            System.out.println(person.getPersonName() + " left the shower. " +
                   "Number of people in shower: " +currentCapacity);
            notifyAll();
        }
    }

    private void checkCurrentGender(Gender gender){
        if(currentCapacity == 0){
            currentGender = gender;
        }
    }

}
