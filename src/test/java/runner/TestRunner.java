package runner;

import TestPages.TestBase;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.DataProvider;

@CucumberOptions(
        features = "src/test/java/features",
        glue = {"steps"},
        plugin = {"pretty", "html:target/cucumber-html-report.html"}
)
public class TestRunner extends TestBase {
    @Override
    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return super.scenarios();
    }
}
