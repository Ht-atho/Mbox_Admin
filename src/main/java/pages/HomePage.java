package pages;

import core.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class HomePage extends PageBase {
    public HomePage() {
        PageFactory.initElements(driver, this);
    }

    public static void waitforPageLoad() {
        wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.xpath("//div[@class='container-fluid']")));
    }

    public WebElement menu(String menu) {
        return driver.findElement(By.xpath("//a[contains(.,'" + menu + "')]"));
    }
    public WebElement menuSameStart(String menu, String not) {
        return driver.findElement(By.xpath("//a[contains(.,'"+ menu+"') and not(contains(.,'"+ not+"'))]"));

    }
    public WebElement subMenu(String menu, String submenu) {
        return driver.findElement(By.xpath("//a[contains(.,'" + menu + "')]//following-sibling::ul//a[contains(.,'" + submenu + "')]"));
    }

}
