//package steps;
//
//import Pages.HomePage;
//import Pages.PageBase;
//import Pages.UserRegistrationPages;
//import TestPages.TestBase;
//import io.cucumber.java.en.Given;
//import io.cucumber.java.en.Then;
//import io.cucumber.java.en.When;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//
//public class UserRegistration extends TestBase {
//
//    HomePage homeObject;
//    UserRegistrationPages userRegistrationObject;
//
//    @Given("the user in the Home\\/Login Page")
//    public void the_user_in_the_home_login_page() {
//        // Write code here that turns the phrase above into concrete actions
////        homeObject = new HomePage(driver);
////        homeObject.validateCheckAssertion("New User Signup!");
//
//
//    }
//    @When("i Click on Resgister Link")
//    public void i_click_on_resgister_link() {
//        // Write code here that turns the phrase above into concrete actions
//        homeObject = new HomePage(driver);
//        homeObject.OpenLoginRegistrationPage();
//
//    }
//    @When("i Fill the {string}, {string}")
//    public void i_fill_the(String string, String string2) {
//        // Write code here that turns the phrase above into concrete actions
//        userRegistrationObject = new UserRegistrationPages(driver);
//        userRegistrationObject.SignUpUser(string, string2);
//
//    }
//    @When("Move to the Next Page Registration")
//    public void move_to_the_next_page_registration() {
//        // Write code here that turns the phrase above into concrete actions
//
//    }
//
////******************************************************************************************************************************************************************************
//
//    @When("The user in Registration Page")
//    public void the_user_in_registration_page() {
//        // Write code here that turns the phrase above into concrete actions
//    }
//    @When("i Fill All the Registration Form {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}")
//    public void i_fill_all_the_registration_form(String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11, String string12, String string13) {
//        // Write code here that turns the phrase above into concrete actions
//        userRegistrationObject = new UserRegistrationPages(driver);
//        userRegistrationObject.CreateAccount(string, string2, string3, string4, string5, string6, string7, string8, string9, string10, string11, string12, string13);
//    }
//    @When("i Click on Registration Button")
//    public void i_click_on_registration_button() {
//        // Write code here that turns the phrase above into concrete actions
//    }
//    @Then("Get the Succesful Registration Page")
//    public void get_the_succesful_registration_page() {
//        // Write code here that turns the phrase above into concrete actions
//    }
//}

