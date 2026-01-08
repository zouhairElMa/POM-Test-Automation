package TestPages;

import Pages.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestSignUpLoginPage extends TestBase{

    HomePage homeObj;
    SignUpLoginPage signupLoginObj;

    @Test
    public void testuserregistrationpages() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();

        signupLoginObj = new SignUpLoginPage(driver);
        signupLoginObj.SignUpUser("csdsdcs", "wiSswfa3sok@fhe.cow", "Login to your account");
    }

}
