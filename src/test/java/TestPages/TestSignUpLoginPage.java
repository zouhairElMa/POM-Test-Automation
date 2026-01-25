package TestPages;

import Pages.*;
import io.qameta.allure.Step;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestSignUpLoginPage extends TestBase{

    HomePage homeObj;
    SignUpLoginPage signupLoginObj;

    @Step("Navigate to home page and click on 'Signup / Login' button, then enter signup details")
    @Test
    public void testuserregistrationpages() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();

        signupLoginObj = new SignUpLoginPage(driver);
        signupLoginObj.SignUpUser("csdsdcs", "wiSswfa3sok@fhe.cow", "Login to your account");
    }

}
