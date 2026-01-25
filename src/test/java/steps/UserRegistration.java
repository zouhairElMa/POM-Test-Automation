package steps;

import Pages.*;
import TestPages.TestBase;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.qameta.allure.Step;
import org.openqa.selenium.WebDriver;

public class UserRegistration extends TestBase {

    HomePage homeObject;
    UserRegistrationPages userRegistrationObject;
    SignUpLoginPage signUpLoginObject;
    DelateAccountPage delateAccountObj;

    @Step("Navigate to Home/Login Page and verify home page is visible")
    @Given("the user in the Home\\/Login Page")
    public void the_user_in_the_home_login_page() {
        // Write code here that turns the phrase above into concrete actions

    }

    @Step("Click on 'Signup / Login' button")
    @When("i Click on Resgister Link")
    public void i_click_on_resgister_link() {
        // Write code here that turns the phrase above into concrete actions
        WebDriver driver = DriverManager.getDriver();
        homeObject = new HomePage(driver);
        homeObject.OpenLoginRegistrationPage();

    }

    @Step("Enter name: {string} and email: {string2} in signup form")
    @When("i Fill the {string}, {string}")
    public void i_fill_the(String string, String string2) {
        // Write code here that turns the phrase above into concrete actions
        WebDriver driver = DriverManager.getDriver();
        signUpLoginObject = new SignUpLoginPage(driver);

        // Génération de données aléatoires avec Faker
//        Faker fakerData = new Faker();
//        String firstName = fakerData.name().firstName();
//        String lastName = fakerData.name().lastName();
//        String email = fakerData.internet().emailAddress();

        signUpLoginObject.SignUpUser(string, string2, "Login to your account");

    }

    @Step("Move to the Next Page Registration - Verify 'ENTER ACCOUNT INFORMATION' is visible")
    @When("Move to the Next Page Registration")
    public void move_to_the_next_page_registration() {
        // Write code here that turns the phrase above into concrete actions

    }

//******************************************************************************************************************************************************************************

    @Step("Verify user is on Registration Page")
    @When("The user in Registration Page")
    public void the_user_in_registration_page() {
        // Write code here that turns the phrase above into concrete actions
    }

    @Step("Fill all registration form details: gender={gender}, password, names, address, date of birth, country")
    @When("i Fill All the Registration Form {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
    public void i_fill_all_the_registration_form(String gender, String password, String firstNameAdressInfo, String lastNameAdressInfo, String companyAddressInfoInfo, String addressInfoInfo, String stateAddressInfo, String cityAddressInfo, String postcodeAddressInfo, String phoneNumberInfoInfo, String birthday, String birthMonth, String birthYear, String countryInfoInfoDropBox) {
        // Write code here that turns the phrase above into concrete actions
        WebDriver driver = DriverManager.getDriver();
        userRegistrationObject = new UserRegistrationPages(driver);
        // Convert gender string to enum and pass it to CreateAccount method
        // Convert string to enum for gender selection
        UserRegistrationPages.Gender genderEnum = UserRegistrationPages.Gender.valueOf(gender.trim().toUpperCase());
        // Call Create Account with the enum value for gender selection
        userRegistrationObject.CreateAccount(genderEnum ,password, firstNameAdressInfo, lastNameAdressInfo, companyAddressInfoInfo, addressInfoInfo, stateAddressInfo, cityAddressInfo, postcodeAddressInfo, phoneNumberInfoInfo, birthday, birthMonth, birthYear, countryInfoInfoDropBox, "ACCOUNT CREATED!");
    }

    @Step("Click on Create Account button, verify 'ACCOUNT CREATED!' is visible, then Delete Account")
    @When("i Click on Registration Button and Delete the Account")
    public void i_click_on_registration_button() {
        // Write code here that turns the phrase above into concrete actions
        WebDriver driver = DriverManager.getDriver();
        delateAccountObj = new DelateAccountPage(driver);
        delateAccountObj.DeleteAccount();
    }

    @Step("Verify 'ACCOUNT DELETED!' is visible and click 'Continue' button")
    @Then("Get the Succesful Registration Page")
    public void get_the_succesful_registration_page() {
        // Write code here that turns the phrase above into concrete actions
    }

    @Step("Click on Registration Button only (for invalid test cases)")
    @When("i Click on Registration Button")
    public void i_click_on_registration_button_only() {
        // Write code here that turns the phrase above into concrete actions
        // Pour les cas invalides, on clique sur le bouton sans supprimer le compte
    }

    @Step("Verify error message is displayed for invalid input")
    @Then("I see an error message")
    public void i_see_an_error_message() {
        // Write code here that turns the phrase above into concrete actions
    }
}
