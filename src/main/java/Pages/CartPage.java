package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class CartPage extends PageBase{

    public  CartPage(WebDriver driver)
    {
        super(driver);
    }

    @FindBy(css = "#product-1>.cart_description>h4>a")
    WebElement FirstProductAddedInCart;
    @FindBy(css = "#product-2>.cart_description>h4>a")
    WebElement SecondProductAddedInCart;
    @FindBy(css = "#product-1>.cart_quantity>.disabled")
    WebElement FirstProductQuantity;
    @FindBy(css = "#product-2>.cart_quantity>.disabled")
    WebElement SecondProductQuantity;
    @FindBy(css = "#product-1>.cart_price>p")
    WebElement FirstProductPrice;
    @FindBy(css = "#product-2>.cart_price>p")
    WebElement SecondProductPrice;
    @FindBy(css = "#product-1>.cart_total>p")
    WebElement FirstProductTotalPrice;
    @FindBy(css = "#product-2>.cart_total>p")
    WebElement SecondProductTotalPrice;

    public void TestCase12_VerifyProductsAreAddedToCart(String firstProductName, String secondProductName, String firstProductQty, String secondProductQty, String firstProductPrice, String secondProductPrice, String FirstProcuctTotalPrice, String secondProductTotalPrice)
    {
        PartialTextElementAssertion(FirstProductAddedInCart, firstProductName);
        PartialTextElementAssertion(SecondProductAddedInCart, secondProductName);
        PartialTextElementAssertion(FirstProductQuantity, firstProductQty);
        PartialTextElementAssertion(SecondProductQuantity, secondProductQty);
        PartialTextElementAssertion(FirstProductPrice, firstProductPrice);
        PartialTextElementAssertion(SecondProductPrice, secondProductPrice);
        PartialTextElementAssertion(FirstProductTotalPrice, FirstProcuctTotalPrice);
        PartialTextElementAssertion(SecondProductTotalPrice, secondProductTotalPrice);
    }
    public void TestCase13_VerifyProductQuantityInCartAfterAddingSameProduct(String firstProductName,String expectedQty)
    {
        PartialTextElementAssertion(FirstProductAddedInCart, firstProductName);
        PartialTextElementAssertion(FirstProductQuantity, expectedQty);
    }
}
