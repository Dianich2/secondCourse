import org.example.company.Company;
import org.example.emploee.Employee;
import org.example.emploee.Positions;
import org.example.exception.MyException;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.List;


public class CompanyTest {

    @BeforeAll
    @DisplayName("the test method before all tests")
    static void beforeAllMethod(){
        System.out.println("THe method before all the tests is executed");
    }

    @BeforeEach
    void beforeEacthMethod(){
        System.out.println("Before each method is executed");
    }

    @Test
    @DisplayName("Check the correct hiring new employee method")
    void HireAnEmployeeTestSuccess() {
        Company myCompany = new Company("myCompany");
        Employee em1 = new Employee("employy1", 5000, true, Positions.MIDDLE);
        myCompany.HireAnEmployee(em1);

        Assertions.assertTrue(myCompany.employees.contains(em1));
    }


    @DisplayName("Check the correct firing the employee method")
    @Test
    void fireEmployeeTestSuccess() throws MyException {
        Company myCompany = new Company("myCompany");
        Employee em1 = new Employee("employy1", 5000, true, Positions.MIDDLE);
        myCompany.HireAnEmployee(em1);
        myCompany.fireEmployee(em1);

        Assertions.assertFalse(myCompany.employees.contains(em1));
    }

    @Test
    @DisplayName("check if fireEmployee method throws exception")
    void fireEmployeeTestThrowsException() throws MyException {
        Company myCompany = new Company("myCompany");
        Employee em1 = new Employee("employy1", 5000, true, Positions.MIDDLE);

        Assertions.assertThrows(MyException.class, () -> myCompany.fireEmployee(em1));
    }


    @ParameterizedTest
    @ValueSource(strings = { "str1", "str2", "'str 3'" })
    void stringNotNullTest(String first) {
        Assertions.assertNotNull(first);
    }

    @ParameterizedTest
    @CsvFileSource(resources = "data.txt", numLinesToSkip = 1)
    void stringsFromFileNotNullTest(String str){
        Assertions.assertNotNull(str);
    }

    @Test
    @DisplayName("Check all assert")
    void GroupTest(){
        Assertions.assertAll("all assertion",
                () -> Assertions.assertEquals(2+2, 4),
                () -> Assertions.assertTrue(2 < 5)
        );
        Assertions.assertLinesMatch(List.of("1","2"),List.of("1","2"));
    }


    @AfterEach
    void afterEachMethod(){
        System.out.println("After each method is executed");
    }

    @AfterAll
    static void afterAllMethod(){
        System.out.println("The method after all tests is executed");
    }
}
