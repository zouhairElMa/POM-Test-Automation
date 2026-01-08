package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC5 extends TestBase {
    HomePage homepageobj;
    SignUpLoginPage signUpLoginPageObj;
    @Test
    public void testRegisterWithExistingEmail() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homepageobj = new HomePage(driver);
        homepageobj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new SignUpLoginPage(driver);
        signUpLoginPageObj.SignUpUser("xese@mailinator.com","xese@mailinator.com","Login to your account");
        signUpLoginPageObj.AssertionEmailAlreadyExist("Email Address already exist!");
    }
}
