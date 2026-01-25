package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("User Management")
@Feature("User Login")
public class TC3 extends TestBase {
    HomePage homeObj;
    SignUpLoginPage signUpLoginPageObj;

    @Test
    @Description("Test Case 3: Login User with incorrect email and password - Verify error message is displayed for invalid credentials")
    @Story("Invalid Login")
    @Owner("QA Team")
    @Severity(SeverityLevel.NORMAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-003")
    public void LoginWithIncorrectEmailAndPassword() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new SignUpLoginPage(driver);
        signUpLoginPageObj.LoginUser("xeecse@mailinator.com", "1234567890", "Login to your account");
        signUpLoginPageObj.AssertionEmailOrPasswordIncorrect("Your email or password is incorrect!");
    }
}
