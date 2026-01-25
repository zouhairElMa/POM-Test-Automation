package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import io.qameta.allure.*;
import org.testng.annotations.Test;

@Epic("Products")
@Feature("Product Search")
public class TC9 extends TestBase {

    TestPoroductsPage testPoroductsPageObj;

    @Test
    @Description("Test Case 9: Search Product - Verify product search functionality and visibility of searched products")
    @Story("Valid Product Search")
    @Owner("QA Team")
    @Severity(SeverityLevel.NORMAL)
    @Link(name = "Automation Exercise", url = "http://automationexercise.com")
    @TmsLink("TC-009")
    public void TestProductsPageSearch() {
        testPoroductsPageObj = new TestPoroductsPage();
        testPoroductsPageObj.TestProductsPageSearch();
    }
}
