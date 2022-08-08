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
        try {
            companyPage.a_btnAction(action).click();
        }
        catch (Exception e ){
            companyPage.button_btnAction(action).click();
        }
    }
    @When("Chọn ngày làm việc của ca")
    public void choCheckboxNgayCuaCa(DataTable dataTable) {
        List< String> list = dataTable.asList( String.class);
        for (String value : list) {
            if( value != "Chủ Nhật") {
                int day = Integer.parseInt(value.split(" ")[1]);
                companyPage.dayOfWeek().get(day - 2).click();
            }
            else companyPage.dayOfWeek().get(companyPage.dayOfWeek().size()-1).click();
        }
    }
    @When("Chọn giờ làm việc của ca")
    public void chonGioCuaCa(DataTable dataTable) {
        Map<String, String> data = dataTable.asMap(String.class, String.class);
            String start = data.get("Giờ bắt đầu");
            String end = data.get("Giờ kết thúc");
            companyPage.timeWork("start_time").sendKeys(start);
        companyPage.timeWork("end_time").sendKeys(start);
    }

}
