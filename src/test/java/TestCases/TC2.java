package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import TestPages.TestDelatePage;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("User Management")
@Feature("User Login")
public class TC2 extends TestBase {
    HomePage homeObj;
    SignUpLoginPage signUpLoginPageObj;
    TestDelatePage delateAccountObj;

    @Test
    @Description("Test Case 2: Login User with correct email and password - Verify successful login with valid credentials and account deletion")
    @Story("Valid Login")
    @Owner("QA Team")
    @Severity(SeverityLevel.CRITICAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-002")
    public void LoginWithCorrectEmailAndPassword()
    {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj=new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new  SignUpLoginPage(driver);
        signUpLoginPageObj.LoginUser("xese@mailinator.com","1234567890","Login to your account");
        homeObj.AssertionLogedInUser("Baker Blair");
//        delateAccountObj = new TestDelatePage();
//        delateAccountObj.testdeleteaccount();
    }

}
