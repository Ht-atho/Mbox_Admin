package pages;

import core.PageBase;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;
import org.testng.Assert;
import org.openqa.selenium.support.PageFactory;

public class LoginPage extends PageBase {
    //    khoi tao pageFactory de dung annotation @FinsBy
    public LoginPage() {
        PageFactory.initElements(driver, this);
    }

    @FindBy(how = How.NAME, using = "user_name")
    public WebElement fillAccount;
    @FindBy(how = How.NAME, using = "password")
    public WebElement fillPassword;
    @FindBy(how = How.XPATH, using = "//button[@type= 'submit']")
    public WebElement btnLogin;

    public void iFillLoginAs(String username) {
        fillAccount.sendKeys(username);
    }

    public void iFillPasswordAs(String password) {
        fillPassword.sendKeys(password);
    }

    public void iClickOnSubmitButton() {
        btnLogin.click();
    }

    public void loginSucessWithAcc(String acc) {
        String username = null;
        String password = null;
        switch (acc) {
            case "Admin_Mbox":
                username = "admin";
                password = "admin@123";
                break;
            case "Admin_DN":
                username = "mboxAuto";
                password = "admin@123";
                break;
            default:
                System.out.println("Không phải account admin đã config.");
                break;
        }
        iFillLoginAs(username);
        iFillPasswordAs(password);
        iClickOnSubmitButton();
        Assert.assertEquals(driver.getTitle(), "beta.mbox.vn - Tổng quan");
    }
}