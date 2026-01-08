package TestCases;

import Pages.DriverManager;
import Pages.HomePage;
import TestPages.TestBase;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC7 extends TestBase {
    HomePage homePageObj;

    @Test
    public void TestCasePage() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homePageObj = new HomePage(driver);
        homePageObj.OpenTestCasePage();
    }
}
