package stepdefinition;

import io.cucumber.java.en.When;
import pages.ListCompanysPage;

public class ListCompanysPageSteps {
    ListCompanysPage listCompanysPage =new ListCompanysPage();
    @When("Click Hanh Đong {string}")
    public void navigateMenu(String action) {
        listCompanysPage.viewDetail(action).click();
    }


}
