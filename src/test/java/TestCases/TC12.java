package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import io.qameta.allure.*;

public class TC12 extends TestBase {
@Epic("Shopping Cart")
@Feature("Add Products to Cart")

@Test
    TestPoroductsPage testPoroductsPageObj;
    testPoroductsPageObj = new TestPoroductsPage();
    @Test
    @Description("Test Case 12: Add Products in Cart - Verify adding multiple products to cart and verify their prices, quantity and total price")
    @Story("Valid Add to Cart")
    @Owner("QA Team")
    @Severity(SeverityLevel.CRITICAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-012")
    public void AddProductsInCart() {
