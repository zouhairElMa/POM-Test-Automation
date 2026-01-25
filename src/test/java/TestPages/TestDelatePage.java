package TestPages;

import Pages.DelateAccountPage;
import Pages.DriverManager;
import io.qameta.allure.Step;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestDelatePage extends TestBase{

    DelateAccountPage delateAccountPageObj;

    @Step("Click 'Delete Account' button and verify 'ACCOUNT DELETED!' is visible, then click 'Continue' button")
    @Test
    public void testdeleteaccount() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        delateAccountPageObj = new DelateAccountPage(driver);
        delateAccountPageObj.DeleteAccount();
    }

}
