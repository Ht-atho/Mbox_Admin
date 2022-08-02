package stepdefinition;


import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import pages.HomePage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import static core.PageBase.driver;
import static pages.HomePage.waitforPageLoad;

public class HomePageSteps {
    HomePage homePage = new HomePage();

    @When("Truy cập theo menu")
    public void navigateMenu(DataTable dataTable) {
        List<String> list = dataTable.asList(String.class);
        if (list.size() != 1) {
            homePage.clickElement(homePage.subMenu(list.get(0), list.get(1)));
        } else
            switch (list.get(0)) {
                case "Cấu hình":
                    homePage.menuSameStart(list.get(0), "DN").click();
                    break;
//                case "Tổng quan":
//                    homePage.menuSameStart(list.get(0), "mBox");
//                break;
                default:
                    homePage.menu(list.get(0)).click();
                    break;
            }
    }


}
