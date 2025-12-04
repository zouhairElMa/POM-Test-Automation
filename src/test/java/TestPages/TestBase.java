package TestPages;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;

public class TestBase extends AbstractTestNGCucumberTests {
    public static WebDriver driver;

    @BeforeSuite
    public void startDriver() {
        driver = new EdgeDriver();
        driver.manage().window().maximize();
        driver.navigate().to("https://automationexercise.com/");
    }

    @AfterSuite
    public void stopDriver() {
        driver.quit();
    }
}
