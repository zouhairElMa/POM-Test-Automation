package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ProductsPage extends PageBase{

    public ProductsPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(css = ".features_items>h2")
    WebElement AllProductsTitle;

    public void VerifyAllProductsTitle(String expectedText)
    {
        AssertionElement(AllProductsTitle, expectedText);
    }

    @FindBy(css = ".col-sm-4>.product-image-wrapper>.single-products>div>[data-product-id=\"3\"]")
    WebElement ThirdAddToCartButton;

    public void  VerifyThirdAddToCartButtonIsPresent()
    {
        ElementIsDisplayed(ThirdAddToCartButton);
    }

    @FindBy(css = ".choose>.nav-justified>li>[href=\"/product_details/1\"]")
    WebElement FirstViewProductButton;

    public void  OpenFirstViewProductPage()
    {
        click(FirstViewProductButton);
    }

    // Assertion Product Details Elements
    @FindBy (css = ".product-information>h2")
    WebElement FirstProductTitleName;
    @FindBy (css = ".product-information>p:nth-of-type(1)")
    WebElement FirstProductCategoryTitle;
    @FindBy (css = ".product-information>span>span")
    WebElement FirstProductPriceTitle;
    @FindBy (css = ".product-information>p:nth-of-type(2)")
    WebElement FirstProductAvailabilityTitle;
    @FindBy (css = ".product-information>p:nth-of-type(3)")
    WebElement FirstProductConditionTitle;
    @FindBy (css = ".product-information>p:nth-of-type(4)")
    WebElement FirstProductBrandTitle;

    public void VerifyFirstProductDetailsElements(String expectedName, String expectedCategory, String expectedPrice, String expectedAvailability, String expectedCondition, String expectedBrand)
    {
        AssertionElement(FirstProductTitleName, expectedName);
        AssertionElement(FirstProductCategoryTitle, expectedCategory);
        AssertionElement(FirstProductPriceTitle, expectedPrice);
        AssertionElement(FirstProductAvailabilityTitle, expectedAvailability);
        AssertionElement(FirstProductConditionTitle, expectedCondition);
        AssertionElement(FirstProductBrandTitle, expectedBrand);
    }
}
