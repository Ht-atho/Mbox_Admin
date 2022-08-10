package stepdefinition;


import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.When;
import pages.HomePage;
import java.util.List;

public class HomePageSteps {
    HomePage homePage = new HomePage();

    @When("Truy cap theo menu")
    public void navigateMenu(DataTable dataTable) {
        List<String> list = dataTable.asList(String.class);
        if (list.size() != 1) {
            homePage.clickElement(homePage.subMenu(list.get(0), list.get(1)));
        } else
            switch (list.get(0)) {
                case "Cấu hình":
                    homePage.menuSameStart(list.get(0), "DN").click();
                    break;
                default:
                    homePage.menu(list.get(0)).click();
                    break;
            }
    }


}
