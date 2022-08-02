package stepdefinition;

import core.PageBase;
import io.cucumber.java.After;
import io.cucumber.java.AfterStep;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.cucumber.plugin.event.Node;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;

import java.io.IOException;

import static core.PageBase.*;

public class ServiceHooks {
    core.PageBase PageBase = new PageBase();

    @Before
    public void initTest() {
        PageBase.createDriver();
    }
//    @BeforeTest
//    public void createGlobalVariable() {
//        PageBase.setUpGlobalVariable();
//    }

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
        takeScreenShot( driver, "Screenshots/Report/");
    }
}
