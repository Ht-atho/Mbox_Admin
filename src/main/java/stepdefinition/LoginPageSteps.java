package stepdefinition;

import io.cucumber.java.en.Given;
import pages.LoginPage;

public class LoginPageSteps {
    LoginPage loginPage = new LoginPage();

    @Given("{string} đăng nhập thành công vào Mbox Admin")
    public void loginSuccess(String account) {
        loginPage.loginSucessWithAcc(account);
    }


}
