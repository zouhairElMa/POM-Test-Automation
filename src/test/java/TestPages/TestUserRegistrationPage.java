package TestPages;

import Pages.DriverManager;
import Pages.UserRegistrationPages;
import net.datafaker.Faker;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestUserRegistrationPage extends TestBase{

    UserRegistrationPages userRegistrationPagesObj;

    @Test
    public void testuserregistrationdetails() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        // RegistrationSteps
        userRegistrationPagesObj = new UserRegistrationPages(driver);
        userRegistrationPagesObj.CreateAccount(
                UserRegistrationPages.Gender.MALE,
                "dwdw",
                "dfdf",
                "fdf",
                "cxd",
                "fdsf",
                "dsfd",
                "dsfds",
                "fdsf",
                "0658412181",
                "1",
                "January",
                "1987",
                "India",
                "ACCOUNT CREATED!")
        ;
    }
}
