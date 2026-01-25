package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import TestPages.TestContactUsPage;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("Customer Support")
@Feature("Contact Us Form")
public class TC6 extends TestBase {
    HomePage homeObj;
    TestContactUsPage testContactUsPageObj;

    @Test
    @Description("Test Case 6: Contact Us Form - Verify contact form submission with name, email, subject, message and file upload")
    @Story("Valid Contact Form Submission")
    @Owner("QA Team")
    @Severity(SeverityLevel.NORMAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-006")
    public void TestContactUsPage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenContactUsPage();
        testContactUsPageObj = new TestContactUsPage();
        testContactUsPageObj.testContactUsPage();
        homeObj.OpenHomePage();
        homeObj.HomePageTitleAssertion("CATEGORY");

    }
}
