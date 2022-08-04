package testSuiteCollection.AdminMbox.doanhNghiep;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        tags = "@DN_14",
        features = "src/main/resources/features/AdminMbox/doanhNghiep/ConfigUngLuong.feature",
        glue = "stepdefinition",
        plugin = {"pretty", "json:target/cucumber-report/cucumber.json"}
)
public class ConfigUngLuong extends AbstractTestNGCucumberTests {
}
