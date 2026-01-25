package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("Subscription")
@Feature("Cart Page Subscription")
public class TC11 extends TestBase {

    HomePage homeObj;

    @Test
    @Description("Test Case 11: Verify Subscription in Cart page - Verify subscription functionality in footer of cart page with success message")
    @Story("Valid Subscription")
    @Owner("QA Team")
    @Severity(SeverityLevel.MINOR)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-011")
    public void VerifySubscriptionInCartPage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.HomePageTitleAssertion("CATEGORY");
        homeObj.CartPageOpen();
        homeObj.VerifySubscriptionInHomePage("SUBSCRIPTION", "SUBSCRIPTION@kjo.com", "You have been successfully subscribed!");
    }
}
