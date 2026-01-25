package runner;

import TestPages.TestBase;
import io.cucumber.testng.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.DataProvider;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@CucumberOptions(
        features = "src/test/java/features",
        glue = {"steps"},
        plugin = {
                "pretty",
                "json:target/cucumber-report.json",
                "timeline:target/cucumber-timeline",
                "io.qameta.allure.cucumber7jvm.AllureCucumber7Jvm"
        },
        monochrome = true
)
public class TestRunner extends TestBase {
    @Override
    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return super.scenarios();
    }

    @AfterSuite(alwaysRun = true)
    public void generateReport() {
        try {
            Thread.sleep(2000);

            File jsonFile = new File("target/cucumber-report.json");
            if (jsonFile.exists() && jsonFile.length() > 0) {
                File reportOutputDir = new File("target");

                List<String> jsonFiles = new ArrayList<>();
                jsonFiles.add(jsonFile.getAbsolutePath());

                Configuration config = new Configuration(reportOutputDir, "TestWare Automation");
                config.addClassifications("Platform", System.getProperty("os.name"));
                config.addClassifications("Browser", "Chrome");
                config.addClassifications("Environment", "Test");

                ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
                reportBuilder.generateReports();

                System.out.println("Rapport généré dans: target/cucumber-html-reports/overview-features.html");
            } else {
                System.err.println("Fichier JSON non trouvé ou vide: " + jsonFile.getAbsolutePath());
            }
        } catch (Exception e) {
            System.err.println("Erreur génération rapport: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
