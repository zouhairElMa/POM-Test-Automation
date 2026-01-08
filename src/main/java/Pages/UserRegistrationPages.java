package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.HashMap;
import java.util.Map;

public class UserRegistrationPages extends  PageBase {
    public UserRegistrationPages(WebDriver driver)
    {
        super(driver);
        this.driver=driver;
        PageFactory.initElements(driver, this);

        // Initialize gender map
        genderMap = new HashMap<>();
        genderMap.put(Gender.MALE, MaleTitleGender);
        genderMap.put(Gender.FEMALE, FemaleTitleGender);
    }

//    Enter Account Information

    @FindBy(id = "id_gender1")
    WebElement MaleTitleGender;
    @FindBy(id = "id_gender2")
    WebElement FemaleTitleGender;

    // Gender Enum for better readability in method calls
    public enum Gender {
        MALE,
        FEMALE
    }

    // Map to associate Gender enum with corresponding WebElements
    private Map<Gender, WebElement> genderMap;

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

    // Click to Continue Button
    @FindBy(css = "[data-qa=\"continue-button\"]")
    WebElement ContinueButton;

    //Verification
    @FindBy(css = "[data-qa=\"account-created\"]>b")
    WebElement AccountCreated;

    public void CreateAccount(
                               Gender gender,
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
        click(genderMap.get(gender));
        SendKeys(Password,password);
        ChoseDropdown(Birthday, birthday);
        ChoseDropdown(BirthMonth, birthMonth);
        ChoseDropdown(BirthYear, birthYear);
//        click(NewsletterCheckButton);
//        click(OffersCheckButton);
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
        AssertionElement(AccountCreated, expectedValue);
        click(ContinueButton);
    }
}

