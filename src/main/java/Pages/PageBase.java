package Pages;

import dev.failsafe.internal.util.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

public class PageBase {
    protected WebDriver driver;

    // Create a constructor
    public PageBase(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
    }

    protected void click(WebElement Element)
    {
        Element.click();
    }
    protected void SendKeys(WebElement element, String text)
    {
        element.sendKeys(text);
    }
    protected  void ChoseDropdown(WebElement Element , String text)
    {
        Select dropdown = new Select(Element);
        dropdown.selectByVisibleText(text);
    }
    protected void ValidateCheckAssertion(WebElement element, String expectedValue) {
        String actualValue = element.getText();

        if (actualValue.equals(expectedValue)) {
            System.out.println("✅ Validation OK: " + expectedValue);
        } else {
            String message = "❌ Échec validation - Attendu: [" + expectedValue + "] Obtenu: [" + actualValue + "]";
            System.err.println(message);
            throw new RuntimeException(message);
        }
    }
}
