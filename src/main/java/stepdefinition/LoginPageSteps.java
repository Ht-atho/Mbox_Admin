package stepdefinition;

import io.cucumber.java.en.Given;
import pages.LoginPage;

public class LoginPageSteps {
    LoginPage loginPage = new LoginPage();

    @Given("{string} dang nhap thanh cong vao Mbox Admin")
    public void loginSuccess(String account) {
        loginPage.loginSucessWithAcc(account);
    }


}
