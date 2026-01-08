package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import TestPages.TestContactUsPage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC6 extends TestBase {
    HomePage homeObj;
    TestContactUsPage testContactUsPageObj;
    @Test

    public void TestContactUsPage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homeObj = new HomePage(driver);
        homeObj.OpenContactUsPage();
        testContactUsPageObj = new TestContactUsPage();
        testContactUsPageObj.testContactUsPage();
    }
}
