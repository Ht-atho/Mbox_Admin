package testSuiteCollection;

import io.cucumber.testng.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        tags = "",
        features = "src/main/resources/features",
        glue = "stepdefinition",
        plugin = {"pretty", "json:target/cucumber-report/cucumber.json"}
)
public class RunCukeTest extends AbstractTestNGCucumberTests {

}
