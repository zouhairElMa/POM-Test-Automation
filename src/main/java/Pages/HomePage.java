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

    public void OpenLoginRegistrationPage()
    {
        AssertionElement(HomePageTitleAssertion,"CATEGORY");
        click(LoginRegistrationPage);
    }

    @FindBy(css = "a>b")
    WebElement HomePageLogedInUserAssertion;

    public void AssertionLogedInUser(String expectedText)
    {
        AssertionElement(HomePageLogedInUserAssertion,expectedText);
    }

    @FindBy(className = "fa-lock")
    WebElement LogoutButton;

    public void Logout()
    {
        click(LogoutButton);
    }

    @FindBy(linkText = "Contact us")
    WebElement ContactUsButton;

    @FindBy(css = "div.contact-form>h2")
    WebElement ContactUsAssertion;

    public void OpenContactUsPage()
    {
        click(ContactUsButton);
        AssertionElement(ContactUsAssertion,"GET IN TOUCH");
    }

    @FindBy(linkText = "Test Cases")
    WebElement TestCasePageButton;
    @FindBy(css = ".text-center>b")
    WebElement TestCasePageAssertion;
    public void OpenTestCasePage()
    {
        click(TestCasePageButton);
        AssertionElement(TestCasePageAssertion,"TEST CASES");
    }

    @FindBy (css = ".navbar-nav>li>[href=\"/products\"]")
    WebElement ProductsPageButton;
    public void OpenProductsPage()
    {
        click(ProductsPageButton);
    }

    @FindBy(className = "fa-home")
    WebElement HomeButton;
    public void OpenHomePage()
    {
        click(HomeButton);
    }

    @FindBy(css = ".left-sidebar>h2")
    WebElement HomePageTitleAssertion;

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

    public void VerifySubscriptionInHomePage(String expectedText, String Email , String successMessage) {
        AssertionElement(SubscriptionTitleAssertion, expectedText);
        SendKeys(SubscriptionEmailTextBox, Email);
        click(SubscriptionButton);
        AssertionElement(SubscriptionSuccessMessage, successMessage);
    }

    @FindBy(className = "fa-shopping-cart")
    WebElement CartPageButton;
    public void CartPageOpen()
    {
        click(CartPageButton);
    }
}
