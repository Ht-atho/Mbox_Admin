package stepdefinition;

import core.PageBase;
import io.cucumber.java.After;
import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterSuite;

import static core.PageBase.*;

public class ServiceHooks {
    core.PageBase PageBase = new PageBase();

    @Before
    public void initTest() {
        PageBase.createDriver();
    }

    @After
    public void afterHooks(Scenario scenario) {
        if (scenario.isFailed()) {
            scenario.attach(((TakesScreenshot) driver).getScreenshotAs(OutputType.BYTES),
                    "image/png", "image");
        }
        PageBase.tearDown();
    }

    @AfterStep
    public void afterStep() throws Exception {
        takeScreenShot( driver, "target/screenshots/report/");
    }
}
