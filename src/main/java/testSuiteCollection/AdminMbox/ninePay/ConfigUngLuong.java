package testSuiteCollection.AdminMbox.ninePay;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        tags = "@UL_90",
        features = "src/main/resources/features/ConfigUngLuong.feature",
        glue = "stepdefinition",
        plugin = {"pretty","json:target/cucumber.json"}
)
public class ConfigUngLuong extends AbstractTestNGCucumberTests {
}
