package pages;

import core.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.openqa.selenium.support.PageFactory;

public class CommonPage extends PageBase {
    public CommonPage() {
        PageFactory.initElements(driver, this);
    }

    @FindBy(how = How.XPATH, using = "//div[contains(@class,'alert-success')]")
    public static WebElement alertSuccess;
    @FindBy(how = How.XPATH, using = "//div[contains(@class,'alert-danger')]")
    public static WebElement alert;
    @FindBy(how = How.XPATH, using = "//button[contains(text(),'Tìm kiếm')]")
    public WebElement btnSearch;

    public WebElement searchBox(String placeholder) {
        return driver.findElement(By.xpath("//input[@placeholder='" + placeholder + "']"));
    }

    public WebElement inputWithLabel(String label) {
        return driver.findElement(By.xpath("//label[contains(text(),'" + label + "')]/following-sibling::input"));
    }

    public WebElement btnEditThongtin(String text) {
        return driver.findElement(By.xpath("//div[@class='mb-3']//button[contains(text(),'" + text + "')]"));
    }

    public WebElement btnRadio(String label,String text) {
        return driver.findElement(By.xpath("//label[contains(.,'" + label + "')]/following-sibling::div/label[contains(.,'" + text + "')]/input[@type='radio']"));
    }
    public WebElement tab(String text) {
        return driver.findElement(By.xpath("//a[@role='tab' and contains(.,'"+ text+"')]"));
    }
    public WebElement subTab(String text) {
        return driver.findElement(By.xpath("//a[@role='presentation' and contains(.,'"+ text+"')]"));
    }
}
