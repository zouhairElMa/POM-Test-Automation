package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import io.qameta.allure.*;
import org.testng.annotations.Test;

@Epic("Products")
@Feature("Product Catalog")
public class TC8 extends TestBase {

    TestPoroductsPage testPoroductsPageObj;

    @Test
    @Description("Test Case 8: Verify All Products and product detail page - Verify products list visibility and product details (name, category, price, availability, condition, brand)")
    @Story("Valid Product View")
    @Owner("QA Team")
    @Severity(SeverityLevel.NORMAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-008")
    public void TestProductsPage() {
        testPoroductsPageObj = new TestPoroductsPage();
        testPoroductsPageObj.TestProcuctsPage();
    }
}
