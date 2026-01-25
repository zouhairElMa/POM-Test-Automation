package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("Navigation")
@Feature("Test Cases Page")
public class TC7 extends TestBase {
    HomePage homePageObj;

    @Test
    @Description("Test Case 7: Verify Test Cases Page - Verify user is navigated to test cases page successfully")
    @Story("Valid Navigation")
    @Owner("QA Team")
    @Severity(SeverityLevel.MINOR)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-007")
    public void TestCasePage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homePageObj = new HomePage(driver);
        homePageObj.OpenTestCasePage();
    }
}
