package Pages;

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

    public void DeleteAccount()
    {
        click(DeleteAccountButton);
        click(ContinueButton);
    }
}
