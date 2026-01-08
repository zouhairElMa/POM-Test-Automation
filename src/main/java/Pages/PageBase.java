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


}
