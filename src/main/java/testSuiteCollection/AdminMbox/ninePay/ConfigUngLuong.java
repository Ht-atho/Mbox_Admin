package testSuiteCollection.AdminMbox.ninePay;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        tags = "@DN_02",
        features = "src/main/java/testSuiteCollection/AdminMbox/ninePay/ConfigUngLuong.java",
        glue = "stepdefinition",
        plugin = {"pretty","json:target/cucumber.json"}
)
public class ConfigUngLuong extends AbstractTestNGCucumberTests {
}
