package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import org.testng.annotations.Test;

public class TC8 extends TestBase {

    TestPoroductsPage testPoroductsPageObj;

    @Test
    public void TestProductsPage() {
        testPoroductsPageObj = new TestPoroductsPage();
        testPoroductsPageObj.TestProcuctsPage();
    }
}
