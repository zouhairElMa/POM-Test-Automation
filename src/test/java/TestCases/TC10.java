package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.testng.annotations.Test;

public class TC10 extends TestBase {
@Epic("Subscription")
@Feature("Home Page Subscription")

    @Test
    public void VerifySubscriptionInHomePage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
    @Description("Test Case 10: Verify Subscription in home page - Verify subscription functionality in footer of home page with success message")
    @Story("Valid Subscription")
    @Owner("QA Team")
    @Severity(SeverityLevel.MINOR)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-010")
