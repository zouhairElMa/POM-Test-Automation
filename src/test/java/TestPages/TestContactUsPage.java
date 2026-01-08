package TestPages;

import Pages.ContactUsPage;
import Pages.DriverManager;
import Pages.HomePage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestContactUsPage extends TestBase {
    ContactUsPage contactUsObj;

    @Test
    public void testContactUsPage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton

        contactUsObj = new ContactUsPage(driver);
        contactUsObj.FillContactUsForm("John Doe", "lsmkdfk@ldkf.com", "Test Subject", "This is a test message.", "D:\\TestWare\\Selenium\\POM-Test-Automation\\target\\60487647-bfed-417f-b5d9-f8d674272428.jpg");
        contactUsObj.SubmitContactUsForm();
        contactUsObj.AssertContactUsSuccessMessage("Success! Your details have been submitted successfully.");
    }
}
