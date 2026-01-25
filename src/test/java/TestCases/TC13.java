package TestCases;

import Pages.CartPage;
import Pages.DriverManager;
import Pages.ProductsPage;
import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import io.qameta.allure.*;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

@Epic("Shopping Cart")
@Feature("Cart Quantity Verification")
public class TC13 extends TestBase {

    CartPage cartPageObj;
    TestPoroductsPage testPoroductsPageObj;
    ProductsPage productsPageObj;

    @Test
    @Description("Test Case 13: Verify Product quantity in Cart - Verify product quantity can be increased and displays correctly in cart page")
    @Story("Valid Quantity Verification")
    @Owner("QA Team")
    @Severity(SeverityLevel.CRITICAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-013")
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
