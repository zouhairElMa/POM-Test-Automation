package Pages;

import static org.assertj.core.api.Assertions.assertThat;

import io.qameta.allure.Step;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
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

    @Step("Click on element")
    protected void click(WebElement element) {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        element.click();
    }

    @Step("Enter text: {text}")
    protected void SendKeys(WebElement element, String text) {
        element.sendKeys(text);
    }

    @Step("Select dropdown option: {text}")
    protected void ChoseDropdown(WebElement Element, String text) {
        Select dropdown = new Select(Element);
        dropdown.selectByVisibleText(text);
    }

    @Step("Verify element displays expected text: {expectedText}")
    protected void AssertionElement(WebElement element, String expectedText) {
        assertThat(element.isDisplayed()).isTrue();
        assertThat(element.getText()).isEqualTo(expectedText);
    }

    @Step("Verify element is displayed")
    protected void ElementIsDisplayed(WebElement element) {
        assertThat(element.isDisplayed()).isTrue();
    }

    @Step("Verify element contains text: {expectedText}")
    protected void PartialTextElementAssertion(WebElement element, String expectedText) {
        assertThat(element.isDisplayed()).isTrue();
        assertThat(element.getText()).contains(expectedText);
    }

    @Step("Accept alert popup")
    protected void allertAccept() {
        driver.switchTo().alert().accept();
    }

    @Step("Verify alert message: {expectedText}")
    protected void allertAssertion(String expectedText) {
        String alertText = driver.switchTo().alert().getText();
        assertThat(alertText).isEqualTo(expectedText);
    }

    @Step("Hover over element")
    protected void hoverOverElement(WebElement element) {
        Actions actions = new Actions(driver);
        actions.moveToElement(element).perform();
    }

    @Step("Press keyboard UP button {times} times")
    protected void KeyboardUpButtonMultipleTimes(int times) {
        Actions actions = new Actions(driver);
        for (int i = 0; i < times; i++) {
            actions.sendKeys(Keys.ARROW_UP).perform();
        }
    }
}
