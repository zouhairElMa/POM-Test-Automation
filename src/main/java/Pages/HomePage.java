package Pages;


import io.qameta.allure.Step;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class HomePage extends PageBase {


    public HomePage(WebDriver driver) {
        super(driver);
    }
    @FindBy(className = "fa-lock")
    WebElement LoginRegistrationPage;

    @Step("Click on 'Signup / Login' button")
    public void OpenLoginRegistrationPage()
    {
        AssertionElement(HomePageTitleAssertion,"CATEGORY");
        click(LoginRegistrationPage);
    }

    @FindBy(css = "a>b")
    WebElement HomePageLogedInUserAssertion;

    @Step("Verify that 'Logged in as {expectedText}' is visible")
    public void AssertionLogedInUser(String expectedText)
    {
        AssertionElement(HomePageLogedInUserAssertion,expectedText);
    }

    @FindBy(className = "fa-lock")
    WebElement LogoutButton;

    @Step("Click 'Logout' button")
    public void Logout()
    {
        click(LogoutButton);
    }

    @FindBy(linkText = "Contact us")
    WebElement ContactUsButton;

    @FindBy(css = "div.contact-form>h2")
    WebElement ContactUsAssertion;

    @Step("Click on 'Contact Us' button and verify 'GET IN TOUCH' is visible")
    public void OpenContactUsPage()
    {
        click(ContactUsButton);
        AssertionElement(ContactUsAssertion,"GET IN TOUCH");
    }

    @FindBy(linkText = "Test Cases")
    WebElement TestCasePageButton;
    @FindBy(css = ".text-center>b")
    WebElement TestCasePageAssertion;

    @Step("Click on 'Test Cases' button and verify navigation to test cases page")
    public void OpenTestCasePage()
    {
        click(TestCasePageButton);
        AssertionElement(TestCasePageAssertion,"TEST CASES");
    }

    @FindBy (css = ".navbar-nav>li>[href=\"/products\"]")
    WebElement ProductsPageButton;

    @Step("Click on 'Products' button")
    public void OpenProductsPage()
    {
        click(ProductsPageButton);
    }

    @FindBy(className = "fa-home")
    WebElement HomeButton;

    @Step("Click 'Home' button and verify landing to home page")
    public void OpenHomePage()
    {
        click(HomeButton);
    }

    @FindBy(css = ".left-sidebar>h2")
    WebElement HomePageTitleAssertion;

    @Step("Verify that home page is visible with title: {expectedText}")
    public void HomePageTitleAssertion(String expectedText)
    {
        AssertionElement(HomePageTitleAssertion,expectedText);
    }

    @FindBy(css = ".single-widget>h2")
    WebElement SubscriptionTitleAssertion;
    @FindBy(id = "susbscribe_email")
    WebElement SubscriptionEmailTextBox;
    @FindBy(id = "subscribe")
    WebElement SubscriptionButton;
    @FindBy(css = ".alert-success.alert")
    WebElement SubscriptionSuccessMessage;

    @Step("Scroll down to footer, verify 'SUBSCRIPTION' text, enter email: {Email} and verify success message")
    public void VerifySubscriptionInHomePage(String expectedText, String Email , String successMessage) {
        AssertionElement(SubscriptionTitleAssertion, expectedText);
        SendKeys(SubscriptionEmailTextBox, Email);
        click(SubscriptionButton);
        AssertionElement(SubscriptionSuccessMessage, successMessage);
    }

    @FindBy(className = "fa-shopping-cart")
    WebElement CartPageButton;

    @Step("Click 'Cart' button to open cart page")
    public void CartPageOpen()
    {
        click(CartPageButton);
    }
}
