package TestCases;

import TestPages.TestBase;
import TestPages.TestPoroductsPage;
import org.testng.annotations.Test;

public class TC12 extends TestBase {

TestPoroductsPage testPoroductsPageObj;

@Test
public void AddProductsInCart() {
    testPoroductsPageObj = new TestPoroductsPage();
    testPoroductsPageObj.addProductsInCart();
    }

}
