package by.belst.it.korneliuk;

public class TestFunction {

    public int test;

    public TestFunction() {
        this.test = 0;
    }

    public String getValue(){
        return "Hello from the first project";
    }

    public int onCreate(){
        for (int i = 0; i < 10; i++) {
            test += i;
        }
        return test;
    }

    public void setTest(int test) {
        this.test = test;
    }

    public int getTest() {
        return test;
    }

}
