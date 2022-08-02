package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import static core.PageBase.driver;

public class CompanyPage {

    public WebElement a_btnAction(String action) {
        return driver.findElement(By.xpath("//div/a[contains(text(),'" + action + "')]"));
    }
    public WebElement button_btnAction(String action) {
        return driver.findElement(By.xpath("//div/button[contains(text(),'" + action + "')]"));
    }
}
