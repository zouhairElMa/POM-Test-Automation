package Pages;


import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HomePage extends PageBase {


    public HomePage(WebDriver driver) {
        super(driver);
    }
    @FindBy(className = "fa-lock")
    WebElement LoginRegistrationPage;
    @FindBy(css = "signup-form>h2")
    WebElement SignupFormText;

    public void OpenLoginRegistrationPage()
    {
        click(LoginRegistrationPage);
    }
    public void validateCheckAssertion(String actualValue){
        ValidateCheckAssertion(SignupFormText,actualValue);
    }
}
