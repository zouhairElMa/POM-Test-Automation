package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import org.testng.annotations.Test;

public class TC9 extends TestBase {

    TestPoroductsPage testPoroductsPageObj;

    @Test
    public void TestProductsPageSearch() {
        testPoroductsPageObj = new TestPoroductsPage();
        testPoroductsPageObj.TestProductsPageSearch();
    }
}
