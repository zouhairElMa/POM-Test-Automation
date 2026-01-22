package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC11 extends TestBase {

    HomePage homeObj;

    @Test
    public void VerifySubscriptionInCartPage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.HomePageTitleAssertion("CATEGORY");
        homeObj.CartPageOpen();
        homeObj.VerifySubscriptionInHomePage("SUBSCRIPTION", "SUBSCRIPTION@kjo.com", "You have been successfully subscribed!");
    }
}
