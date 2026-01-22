package TestCases;

import Pages.CartPage;
import Pages.DriverManager;
import Pages.ProductsPage;
import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TC13 extends TestBase {

    CartPage cartPageObj;
    TestPoroductsPage testPoroductsPageObj;
    ProductsPage productsPageObj;

    @Test
    public void TestCase13_VerifyProductQuantityInCartAfterAddingSameProduct() {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        testPoroductsPageObj = new TestPoroductsPage();
        testPoroductsPageObj.TestProcuctsPage();
        productsPageObj = new ProductsPage(driver);
        productsPageObj.QuantityIncreaseInFirstProductDetailsPage(3);
        productsPageObj.ClickAddToCartButtonInFirstProductDetailsPage();
        productsPageObj.ClickViewCartButton();
        cartPageObj = new CartPage(driver);
        cartPageObj.TestCase13_VerifyProductQuantityInCartAfterAddingSameProduct("Blue Top","4");
    }
}
