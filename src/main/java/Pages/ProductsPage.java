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
        PartialTextElementAssertion(FirstProductTitleName, expectedName);
        PartialTextElementAssertion(FirstProductCategoryTitle, expectedCategory);
        PartialTextElementAssertion(FirstProductPriceTitle, expectedPrice);
        PartialTextElementAssertion(FirstProductAvailabilityTitle, expectedAvailability);
        PartialTextElementAssertion(FirstProductConditionTitle, expectedCondition);
        PartialTextElementAssertion(FirstProductBrandTitle, expectedBrand);
    }

    @FindBy(id = "search_product")
    WebElement ProductSearchInput;
    @FindBy(id = "submit_search")
    WebElement SubmitSearchButton;

    public void enterProductInSearchInput(String productName)
    {
        SendKeys(ProductSearchInput, productName);
        click(SubmitSearchButton);
    }

    @FindBy(css = ".features_items>h2")
    WebElement SearchProductsTitle;

    public void VerifySearchProductsTitle(String expectedText)
    {
        AssertionElement(SearchProductsTitle, expectedText);
    }

    @FindBy(css = ".productinfo>[data-product-id=\"1\"]")
    WebElement FirstAddToCartProductHoverElement;
    @FindBy(css = ".overlay-content>[data-product-id=\"1\"]")
    WebElement FirstProductAddToCartButton;

    @FindBy(css = ".productinfo>[data-product-id=\"2\"]")
    WebElement SecondAddToCartProductHoverElement;
    @FindBy(css = ".overlay-content>[data-product-id=\"2\"]")
    WebElement SecondProductAddToCartButton;

    @FindBy(css = ".modal-footer>button")
    WebElement ContinueShoppingButton;
    @FindBy(css = "p>[href=\"/view_cart\"]")
    WebElement ViewCartButton;

    public void HoverFirstProductsAndClickAddToCartThenContinueButton()
    {
        hoverOverElement(FirstAddToCartProductHoverElement);
        click(FirstProductAddToCartButton);
        click(ContinueShoppingButton);
    }
    public void HoverSecondProductsAndClickAddToCartThenViewCartButton()
    {
        hoverOverElement(SecondAddToCartProductHoverElement);
        click(SecondProductAddToCartButton);
        click(ViewCartButton);
    }
    public void ClickViewCartButton()
    {
        click(ViewCartButton);
    }

    @FindBy(id = "quantity")
    WebElement FirstProductQuantityInput;
    public void QuantityIncreaseInFirstProductDetailsPage(int quantity)
    {
        click(FirstProductQuantityInput);
        KeyboardUpButtonMultipleTimes(quantity);
    }

    @FindBy(css = "button>.fa-shopping-cart")
    WebElement FirstProductAddToCartButtonInDetailsPage;
    public void ClickAddToCartButtonInFirstProductDetailsPage()
    {
        click(FirstProductAddToCartButtonInDetailsPage);
    }

}
