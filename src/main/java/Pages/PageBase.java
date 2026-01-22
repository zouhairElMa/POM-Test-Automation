package Pages;

import static org.assertj.core.api.Assertions.assertThat;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;


public class PageBase {
    protected WebDriver driver;

    // Create a constructor
//    public PageBase(WebDriver driver) {
//        this.driver = driver;
//        PageFactory.initElements(driver, this);
//    }
    public PageBase(WebDriver driver) {
        this.driver = DriverManager.getDriver();
        PageFactory.initElements(this.driver, this);
    }

    public PageBase() {
    }

    protected void click(WebElement element) {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        element.click();
    }

    protected void SendKeys(WebElement element, String text) {
        element.sendKeys(text);
    }

    protected void ChoseDropdown(WebElement Element, String text) {
        Select dropdown = new Select(Element);
        dropdown.selectByVisibleText(text);
    }

    protected void AssertionElement(WebElement element, String expectedText) {
        assertThat(element.isDisplayed()).isTrue();
        assertThat(element.getText()).isEqualTo(expectedText);
    }

    protected void ElementIsDisplayed(WebElement element) {
        assertThat(element.isDisplayed()).isTrue();
    }

    protected void PartialTextElementAssertion(WebElement element, String expectedText) {
        assertThat(element.isDisplayed()).isTrue();
        assertThat(element.getText()).contains(expectedText);
    }

    protected void allertAccept() {
        driver.switchTo().alert().accept();
    }

    protected void allertAssertion(String expectedText) {
        String alertText = driver.switchTo().alert().getText();
        assertThat(alertText).isEqualTo(expectedText);
    }

    protected void hoverOverElement(WebElement element) {
        org.openqa.selenium.interactions.Actions actions = new org.openqa.selenium.interactions.Actions(driver);
        actions.moveToElement(element).perform();
    }
    protected void KeyboardUpButtonMultipleTimes(int times) {
        org.openqa.selenium.interactions.Actions actions = new org.openqa.selenium.interactions.Actions(driver);
        for (int i = 0; i < times; i++) {
            actions.sendKeys(org.openqa.selenium.Keys.ARROW_UP).perform();
        }
    }
}
