package stepdefinition;

import io.cucumber.java.en.When;
import pages.CompanyPage;

public class CompanySteps {
    CompanyPage companyPage = new CompanyPage();

    @When("Click button {string} in Doanh nghiep page")
    public void clickBtnInCompanyPage(String action) {
        companyPage.a_btnAction(action).click();
    }
}
