package stepdefinition;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.When;
import pages.CompanyPage;

import java.util.List;
import java.util.Map;

public class CompanySteps {
    CompanyPage companyPage = new CompanyPage();

    @When("Click button {string} in Doanh nghiep page")
    public void clickBtnInCompanyPage(String action) {
        companyPage.a_btnAction(action).click();
    }

}
