package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class SignUpLoginPage extends PageBase {
    public SignUpLoginPage(WebDriver driver) {
        super(driver);
    }

//    SignUp/Login_Page SignUp Info
    @FindBy(css = "[data-qa=\"signup-name\"]")
    WebElement SignUpUserNameField;
    @FindBy(css = "[data-qa=\"signup-email\"]")
    WebElement SignUpEmailField;
    @FindBy(css = "[data-qa=\"signup-button\"]")
    WebElement SignUpButton;

    //Verify 'New User Signup!' is visible
    @FindBy(css = ".login-form>h2")
    WebElement NewUserSignupTitle;


    public void SignUpUser(String name, String email , String expectedTextSignupFormText)
    {
        AssertionElement(NewUserSignupTitle, expectedTextSignupFormText);
        SendKeys(SignUpUserNameField,name);
        SendKeys(SignUpEmailField,email);
        click(SignUpButton);
    }

    //Verify 'Login to your account' is visible
    @FindBy(css = ".login-form h2")
    WebElement LoginToYourAccountTitle;

    public void AssertionLoginToYourAccountTitle(String expectedText)
    {
        AssertionElement(LoginToYourAccountTitle, expectedText);
    }

    @FindBy(css = "[data-qa=\"login-email\"]")
    WebElement LoginEmailField;
    @FindBy(css = "[data-qa=\"login-password\"]")
    WebElement LoginPasswordField;
    @FindBy(css = "[data-qa=\"login-button\"]")
    WebElement LoginButton;


    public void LoginUser(String email, String password , String expectedTextLoginFormText)
    {
//        AssertionElement(LoginToYourAccountTitle, expectedTextLoginFormText);
        SendKeys(LoginEmailField,email);
        SendKeys(LoginPasswordField,password);
        click(LoginButton);
    }

    //Verify that email or password is incorrect!
    @FindBy(css = "form>[style=\"color: red;\"]")
    WebElement EmailOrPasswordIncorrectText;

    public void AssertionEmailOrPasswordIncorrect(String expectedText)
    {
        AssertionElement(EmailOrPasswordIncorrectText, expectedText);
    }

    @FindBy(css = "form>[style=\"color: red;\"]")
    WebElement AssertionEmailAlreadyExistText;

    public void AssertionEmailAlreadyExist(String expectedText)
    {
        AssertionElement(AssertionEmailAlreadyExistText, expectedText);
    }
}
