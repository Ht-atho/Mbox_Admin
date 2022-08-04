package core;

import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriverService;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.annotations.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

public class BaseTest {

    public static ThreadLocal<RemoteWebDriver> dr = new ThreadLocal<RemoteWebDriver>();

    @BeforeSuite
    @Parameters({"platform", "browser"})
    public void beforeClass(String platform, String browser) throws MalformedURLException {
        DesiredCapabilities caps = new DesiredCapabilities();
        RemoteWebDriver driver = null;
        String url = "https://beta.mbox.vn/admin/login";
//set up OS
        if (browser.equalsIgnoreCase("Windows")) {
            caps.setPlatform(Platform.WINDOWS);
        }
        if (browser.equalsIgnoreCase("MAC")) {
            caps.setPlatform(Platform.MAC);
        }
//set up browser
        if (browser.equalsIgnoreCase("Internet Explorer")) {
            caps = DesiredCapabilities.internetExplorer();
            System.setProperty("webdriver.IE.driver", System.getProperty("user.dir") + "src/test/resources/browserDriver/IEDriverServer.exe");
            driver = new RemoteWebDriver(new URL(url), caps);
        }
        if (browser.equalsIgnoreCase("Chrome")) {
            System.out.println("browser1" + browser);
            caps = DesiredCapabilities.chrome();
            System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + "src/test/resources/browserDriver/IEDriverServer.exe");

            driver = new RemoteWebDriver(new URL(url), caps);
        }
        if (browser.equalsIgnoreCase("Firefox")) {
            System.out.println(browser);
            caps = DesiredCapabilities.firefox();
            System.setProperty("webdriver.gecko.driver", System.getProperty("user.dir") + "src/test/resources/browserDriver/IEDriverServer.exe");

            driver = new RemoteWebDriver(new URL(url), caps);
        }
        if (browser.equalsIgnoreCase("HeadlessMode")) {
            caps.setJavascriptEnabled(true); // not really needed: JS enabled by default
            caps.setCapability(PhantomJSDriverService.PHANTOMJS_EXECUTABLE_PATH_PROPERTY,
                    System.getProperty("user.dir") + "src/test/resources/browserDriver/phantomjs.exe");
            driver = new PhantomJSDriver(caps);
        }
        setWebDriver(driver);
        getDriver().manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        getDriver().manage().window().maximize();
    }

    public WebDriver getDriver() {
        return dr.get();
    }

    public void setWebDriver(RemoteWebDriver driver) {
        dr.set(driver);
    }

    @AfterSuite
    public void afterClass() {
        getDriver().quit();
        dr.set(null);
    }
}
