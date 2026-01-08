package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.SignUpLoginPage;
import TestPages.TestBase;
import TestPages.TestDelatePage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC2 extends TestBase {
    HomePage homeObj;
    SignUpLoginPage signUpLoginPageObj;
    TestDelatePage delateAccountObj;

    @Test
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
