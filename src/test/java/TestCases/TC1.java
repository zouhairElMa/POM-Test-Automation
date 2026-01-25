package TestCases;

import TestPages.TestBase;
import TestPages.TestDelatePage;
import TestPages.TestSignUpLoginPage;
import TestPages.TestUserRegistrationPage;
import io.qameta.allure.*;

public class TC1 extends TestBase {
@Epic("User Management")
@Feature("User Registration")
    TestDelatePage testDelateObj;

    @Test
    public void testEndToEndUserRegistrationAndDeletion() {
        testSignUpLoginObj = new TestSignUpLoginPage();
        testSignUpLoginObj.testuserregistrationpages();
    @Description("Test Case 1: Register User - Complete end-to-end user registration flow including signup, account creation, verification, and account deletion")
    @Story("Valid Registration")
    @Owner("QA Team")
    @Severity(SeverityLevel.CRITICAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-001")
    }
}
