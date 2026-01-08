package TestPages;

import Pages.DriverManager;
import Pages.HomePage;
import Pages.ProductsPage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestPoroductsPage extends TestBase {
    HomePage homePageObj;
    ProductsPage productsPageObj;

    @Test
    public void TestProcuctsPage()
    {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homePageObj = new HomePage(driver);
        homePageObj.OpenProductsPage();

        productsPageObj = new ProductsPage(driver);
        productsPageObj.VerifyAllProductsTitle("ALL PRODUCTS");
        productsPageObj.VerifyThirdAddToCartButtonIsPresent();
        productsPageObj.OpenFirstViewProductPage();
        productsPageObj.VerifyFirstProductDetailsElements("Blue", "Category","$33.00","Availability: In Stock","Condition: New","Brand: Polo");
    }
}
