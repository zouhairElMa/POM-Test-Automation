package TestPages;

import Pages.DriverManager;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class TestBase extends AbstractTestNGCucumberTests {

    @BeforeMethod
    public void startDriver() {
        DriverManager.getDriver().navigate().to("https://automationexercise.com/");
        try {
            Thread.sleep(5000); // attendre 5s pour que Brave détecte les publicités avant les tests
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    @AfterMethod
    public void stopDriver() {
        DriverManager.closeDriver();
    }
}





