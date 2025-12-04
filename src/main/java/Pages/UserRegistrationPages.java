package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class UserRegistrationPages extends  PageBase {
    public UserRegistrationPages(WebDriver driver)
    {
        super(driver);
        this.driver=driver;
        PageFactory.initElements(driver, this);
    }

//    SignUp/Login_Page SignUp Info

    @FindBy(css = "[data-qa=\"signup-name\"]")
    WebElement SignUpUserNameField;
    @FindBy(css = "[data-qa=\"signup-email\"]")
    WebElement SignUpEmailField;
    @FindBy(css = "[data-qa=\"signup-button\"]")
    WebElement SignUpButton;

    //Verify 'New User Signup!' is visible
    @FindBy(css = ".login-form>.text-center>b")
    WebElement NewUserSignupTitle;



    public void SignUpUser(String name, String email, String expectedValue)
    {
        SendKeys(SignUpUserNameField,name);
        SendKeys(SignUpEmailField,email);
        click(SignUpButton);
        ValidateCheckAssertion(AccountCreated,expectedValue);
    }

//    Enter Account Information

    @FindBy(id = "id_gender1")
    WebElement TitleGender;
    @FindBy(id = "password")
    WebElement Password;
    @FindBy(id = "days")
    WebElement Birthday;
    @FindBy(id = "months")
    WebElement BirthMonth;
    @FindBy(id = "years")
    WebElement BirthYear;
    @FindBy(id = "newsletter")
    WebElement NewsletterCheckButton;
    @FindBy(id = "optin")
    WebElement OffersCheckButton;

//    Address Information

    @FindBy(id = "first_name")
    WebElement FirstNameAdressInfo;
    @FindBy(id = "last_name")
    WebElement LastNameAdressInfo;
    @FindBy(id = "company")
    WebElement CompanyAddressInfoInfo;
    @FindBy(id = "address1")
    WebElement AddressInfoInfo;
    @FindBy(id = "country")
    WebElement CountryInfoInfoDropBox;
    @FindBy(id = "state")
    WebElement StateAddressInfo;
    @FindBy(id = "city")
    WebElement CityAddressInfo;
    @FindBy(id = "zipcode")
    WebElement PostcodeAddressInfo;
    @FindBy(id = "mobile_number")
    WebElement PhoneNumberInfoInfo;
    @FindBy(css = "[data-qa=\"create-account\"]")
    WebElement CreateAccountClickElement;

    //Verification

    @FindBy(css = "[data-qa=\"account-created\"]>b")
    WebElement AccountCreated;


    public void CreateAccount(
                               String password,
                               String firstNameAdressInfo,
                               String lastNameAdressInfo,
                               String companyAddressInfoInfo,
                               String addressInfoInfo,
                               String stateAddressInfo,
                               String cityAddressInfo,
                               String postcodeAddressInfo,
                               String phoneNumberInfoInfo,
                               String birthday,
                               String birthMonth,
                               String birthYear,
                               String countryInfoInfoDropBox,
                               String expectedValue
    )
    {
        click(TitleGender);
        SendKeys(Password,password);
        ChoseDropdown(Birthday, birthday);
        ChoseDropdown(BirthMonth, birthMonth);
        ChoseDropdown(BirthYear, birthYear);
        click(NewsletterCheckButton);
        click(OffersCheckButton);
        SendKeys(FirstNameAdressInfo,firstNameAdressInfo);
        SendKeys(LastNameAdressInfo,lastNameAdressInfo);
        SendKeys(CompanyAddressInfoInfo,companyAddressInfoInfo);
        SendKeys(AddressInfoInfo,addressInfoInfo);
        ChoseDropdown(CountryInfoInfoDropBox, countryInfoInfoDropBox);
        SendKeys(StateAddressInfo,stateAddressInfo);
        SendKeys(CityAddressInfo,cityAddressInfo);
        SendKeys(PostcodeAddressInfo,postcodeAddressInfo);
        SendKeys(PhoneNumberInfoInfo,phoneNumberInfoInfo);
        click(CreateAccountClickElement);
        ValidateCheckAssertion(AccountCreated,expectedValue);
    }
}
