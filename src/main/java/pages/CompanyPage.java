package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

import static core.PageBase.driver;

public class CompanyPage {
    public WebElement a_btnAction(String action) {
        return driver.findElement(By.xpath("//div/a[contains(.,'" + action + "')]"));
    }
    public List<WebElement> dayOfWeek() {
        return driver.findElements(By.xpath("//div/label/parent::div//preceding::input[@type='checkbox' and @name='working_days[]']"));
    }
    public WebElement button_btnAction(String action) {
        return driver.findElement(By.xpath("//div/button[contains(text(),'" + action + "')]"));
    }

    public WebElement timeWork(String text) {
        return driver.findElement(By.xpath("//input[@name = '" + text + "']"));
    }

}
