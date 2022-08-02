package core;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static pages.HomePage.waitforPageLoad;

public class PageBase {
    private static final int TIMEOUT = 5;
    private static final int POLLING = 100;
    public static WebDriver driver;
    public static WebDriverWait wait;
    protected JavascriptExecutor executor;
    public static List<String> globalVariable;
    public static Actions actions ;

    public void createDriver() {
        System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir") + "/src/test/resources/browserDriver/chromedriver.exe");
        driver = new ChromeDriver();
        actions = new Actions(driver);
        wait = new WebDriverWait(driver, TIMEOUT, POLLING);
        driver.manage().window().maximize();
        globalVariable = new ArrayList<>();
        System.out.println("before");
        driver.get("https://beta.mbox.vn/admin/login");
        Assert.assertTrue(driver.findElement(By.name("user_name")).isDisplayed());
        File directory = new File(System.getProperty("user.dir") + "/Screenshots/Report");
        if (!directory.exists()) {
            System.out.println("Thư mục không tồn tại.");
        } else {
            try {
                delete(directory); // phương thức xóa tất cả các file
            } catch (IOException e) {
                e.printStackTrace();
                System.exit(0);
            }
        }
    }

    public void tearDown() {
        driver.close();
    }
    public void setUpGlobalVariable() {
        globalVariable = new ArrayList<>();
    }
    public void clickElement(WebElement element) {
        executor = (JavascriptExecutor) driver;
        executor.executeScript("arguments[0].click();", element);
    }
    public void getValueAttribute(WebElement element){
        String value = element.getAttribute("value");
        globalVariable.add(value);
    }

    public static String getCurrentTime() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd HHmmss");
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now).trim();
    }
    public static String todayPlusDate(int date){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDateTime now = LocalDateTime.now();
        now = now.plusDays(date);
        System.out.println("time"+ now);
        return dtf.format(now).trim();
    }
    public void refreshWeb() {
        driver.navigate().refresh();
    }

    public static void takeScreenShot(WebDriver webDriver, String fileWithPath) throws Exception {
//        waitforPageLoad();
        TakesScreenshot scrShot = ((TakesScreenshot) webDriver);
        File SrcFile = scrShot.getScreenshotAs(OutputType.FILE);
        File desFile = new File(fileWithPath + getCurrentTime() + ".png");
        FileUtils.copyFile(SrcFile, desFile);
    }
    public static void delete(File file) throws IOException {
        if (file.isDirectory()) {
            if (file.list().length == 0) {
                file.delete();
            } else {
                String files[] = file.list();
                for (String temp : files) {
                    File fileDelete = new File(file, temp);
                    delete(fileDelete);
                }
                if (file.list().length == 0) {
                    file.delete();
                }
            }

        } else {
            file.delete();
        }
    }

}


