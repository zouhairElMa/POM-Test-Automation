package TestPages;

import Pages.DriverManager;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class TestBase extends AbstractTestNGCucumberTests {

    @BeforeMethod
    public void startDriver() {
        DriverManager.getDriver().navigate().to("https://automationexercise.com/");
    }

    @AfterMethod
    public void stopDriver() {
        DriverManager.closeDriver();
    }
}





