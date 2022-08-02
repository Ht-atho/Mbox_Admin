package testSuiteCollection.doanhNghiep;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        tags = "@UL_93",
        features = "src/main/resources/features/9pay/ConfigUngLuong.feature",
        glue = "stepdefinition",
        plugin = {"pretty","json:target/cucumber.json"}
)
public class ConfigUngLuong extends AbstractTestNGCucumberTests {
}
