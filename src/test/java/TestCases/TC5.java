package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("User Management")
@Feature("User Registration")
public class TC5 extends TestBase {
    HomePage homepageobj;
    SignUpLoginPage signUpLoginPageObj;

    @Test
    @Description("Test Case 5: Register User with existing email - Verify error message is displayed when registering with an already registered email address")
    @Story("Invalid Registration")
    @Owner("QA Team")
    @Severity(SeverityLevel.NORMAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-005")
    public void testRegisterWithExistingEmail() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homepageobj = new HomePage(driver);
        homepageobj.OpenLoginRegistrationPage();
        signUpLoginPageObj = new SignUpLoginPage(driver);
        signUpLoginPageObj.SignUpUser("xese@mailinator.com","xese@mailinator.com","Login to your account");
        signUpLoginPageObj.AssertionEmailAlreadyExist("Email Address already exist!");
    }
}
