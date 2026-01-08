package TestPages;

import Pages.DelateAccountPage;
import Pages.DriverManager;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestDelatePage extends TestBase{

    DelateAccountPage delateAccountPageObj;

    @Test
    public void testdeleteaccount() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        delateAccountPageObj = new DelateAccountPage(driver);
        delateAccountPageObj.DeleteAccount();
    }

}
