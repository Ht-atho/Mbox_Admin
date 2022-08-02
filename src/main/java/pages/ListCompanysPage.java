package pages;

import core.PageBase;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

public class ListCompanysPage extends PageBase {
    public ListCompanysPage() {
        PageFactory.initElements(driver, this);
    }
    public WebElement viewDetail(String option){
        return driver.findElement(By.xpath("//a[contains(@class,'btn-sm') and normalize-space(text()) = '"+option+"']"));
    }


}
