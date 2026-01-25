package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("User Management")
@Feature("User Logout")
public class TC4 extends TestBase {
    HomePage homeObj;
    SignUpLoginPage signUpLoginPageObj;

    @Test
    @Description("Test Case 4: Logout User - Verify user can successfully logout after logging in with valid credentials")
    @Story("Valid Logout")
    @Owner("QA Team")
    @Severity(SeverityLevel.CRITICAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-004")
    public void LoginWithCorrectEmailAndPassword()
    {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj=new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new  SignUpLoginPage(driver);
        signUpLoginPageObj.LoginUser("xese@mailinator.com","1234567890","Login to your account");
        homeObj.AssertionLogedInUser("Baker Blair");
        homeObj.Logout();
        signUpLoginPageObj.AssertionLoginToYourAccountTitle("Login to your account");
    }
}
