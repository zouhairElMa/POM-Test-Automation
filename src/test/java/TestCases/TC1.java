package TestCases;

import TestPages.TestBase;
import TestPages.TestDelatePage;
import TestPages.TestSignUpLoginPage;
import TestPages.TestUserRegistrationPage;
import org.testng.annotations.Test;

public class TC1 extends TestBase {
    TestSignUpLoginPage testSignUpLoginObj;
    TestUserRegistrationPage testUserRegistrationObj;
    TestDelatePage testDelateObj;

    @Test
    public void testEndToEndUserRegistrationAndDeletion() {
        testSignUpLoginObj = new TestSignUpLoginPage();
        testSignUpLoginObj.testuserregistrationpages();

        testUserRegistrationObj = new TestUserRegistrationPage();
        testUserRegistrationObj.testuserregistrationdetails();

        testDelateObj = new TestDelatePage();
        testDelateObj.testdeleteaccount();
    }
}
