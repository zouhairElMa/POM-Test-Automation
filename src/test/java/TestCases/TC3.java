package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC3 extends TestBase {
    HomePage homeObj;
    SignUpLoginPage signUpLoginPageObj;

    @Test
    public void LoginWithIncorrectEmailAndPassword() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new SignUpLoginPage(driver);
        signUpLoginPageObj.LoginUser("xeecse@mailinator.com", "1234567890", "Login to your account");
        signUpLoginPageObj.AssertionEmailOrPasswordIncorrect("Your email or password is incorrect!");
    }
}
