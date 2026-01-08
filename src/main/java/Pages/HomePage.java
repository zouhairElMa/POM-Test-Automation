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
    @FindBy(css = ".left-sidebar>h2")
    WebElement HomePageTitleAssertion;

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
}
