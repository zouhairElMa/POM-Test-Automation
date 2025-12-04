package TestPages;

import Pages.HomePage;
import Pages.UserRegistrationPages;
import org.testng.annotations.Test;

public class TestUserRegistrationPages extends TestBase{

    HomePage homeObj;
    UserRegistrationPages userRegObj;

    @Test
    public void testuserregistrationpages()
    {
        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
//        homeObj.validateCheckAssertion("New User Signup!");
        userRegObj = new UserRegistrationPages(driver);
        userRegObj.SignUpUser("csdcs", "wikdsxdssddwsok@fhe.cow", "Enter Account Information");

        // RegistrationSteps

        userRegObj.CreateAccount(
                "dwdw",
                "dfdf",
                "fdf",
                "cxd",
                "fdsf",
                "dsfd",
                "dsfds",
                "fdsf",
                "0658412181",
                "1",
                "January",
                "1987",
                "India",
                "Account Created!"
        );
    }

}
