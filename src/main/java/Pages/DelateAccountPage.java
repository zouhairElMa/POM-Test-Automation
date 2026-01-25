package Pages;

import io.qameta.allure.Step;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class DelateAccountPage extends PageBase {

    public DelateAccountPage(WebDriver driver) {
        super(driver);
    }
    //Delete Account
    @FindBy(css = ".fa-trash-o")
    WebElement DeleteAccountButton;
    // Click to Continue Button
    @FindBy(css = "[data-qa=\"continue-button\"]")
    WebElement ContinueButton;

    @Step("Click 'Delete Account' button and verify 'ACCOUNT DELETED!' is visible, then click 'Continue' button")
    public void DeleteAccount()
    {
        click(DeleteAccountButton);
        click(ContinueButton);
    }
}
