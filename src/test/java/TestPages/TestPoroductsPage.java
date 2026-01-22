package TestPages;

import Pages.CartPage;
import Pages.DriverManager;
import Pages.HomePage;
import Pages.ProductsPage;
import org.openqa.selenium.WebDriver;
import org.testng.annotations.Test;

public class TestPoroductsPage extends TestBase {
    HomePage homePageObj;
    ProductsPage productsPageObj;
    CartPage cartPageObj;

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
        productsPageObj.VerifyFirstProductDetailsElements("Blue", "Category","500","Availability","Condition","Brand");
    }

    @Test
    public void TestProductsPageSearch()
    {
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homePageObj = new HomePage(driver);
        homePageObj.OpenProductsPage();
        homePageObj.HomePageTitleAssertion("CATEGORY");
        productsPageObj = new ProductsPage(driver);
        productsPageObj.VerifyAllProductsTitle("ALL PRODUCTS");
        productsPageObj.enterProductInSearchInput("Blue");
        productsPageObj.VerifySearchProductsTitle("SEARCHED PRODUCTS");
    }

    @Test
    public void addProductsInCart(){
        WebDriver driver = DriverManager.getDriver(); // pour l'implementation du DriverManager singleton
        homePageObj = new HomePage(driver);
        homePageObj.OpenProductsPage();
        homePageObj.HomePageTitleAssertion("CATEGORY");
        productsPageObj = new ProductsPage(driver);
        productsPageObj.VerifyAllProductsTitle("ALL PRODUCTS");
        productsPageObj.HoverFirstProductsAndClickAddToCartThenContinueButton();
        productsPageObj.HoverSecondProductsAndClickAddToCartThenViewCartButton();
        cartPageObj = new CartPage(driver);
        cartPageObj.TestCase12_VerifyProductsAreAddedToCart("Blue Top","Men Tshirt","1","1","500","400","500", "400");
    }
}
