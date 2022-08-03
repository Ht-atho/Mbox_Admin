package stepdefinition;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.Keys;
import org.testng.Assert;
import pages.CommonPage;
import pages.HomePage;

import java.util.List;
import java.util.Map;

import static core.PageBase.*;
import static pages.HomePage.waitforPageLoad;

public class CommonSteps {
    CommonPage commonPage = new CommonPage();
    HomePage homePage = new HomePage();

    @When("Tìm kiếm với nhiều keyword")
    public void search(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringMap : list) {
            String value = stringMap.get("textBox");
            String key = stringMap.get("key");
            commonPage.searchBox(value).sendKeys(key);
        }
        commonPage.btnSearch.click();
    }

    //    tìm kiếm vói 1 trường
    @When("Tìm kiếm với keyword và nhấn Enter")
    public void searchEnter(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringMap : list) {
            String box = stringMap.get("textBox");
            String key = stringMap.get("key");
            commonPage.searchBox(box).sendKeys(key + Keys.ENTER);
        }
    }

    @When("Nhập value vào nhiều field")
    public void nhapValueVaoNhieuField(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            waitforPageLoad();
            if (value != null) {
                if (value.contains("today_")) {
                    int datePlus = Integer.parseInt(value.split("_")[1]) - 1;
                    value = todayPlusDate(datePlus);
                    globalVariable.add(value);
                } else if (value.contains("random_")) {
                    int quantity = Integer.parseInt(value.substring(8, value.lastIndexOf("_")));
                    String text = randomKey(quantity);
                    value = value.substring(0, value.lastIndexOf("+")) + text + value.substring(value.lastIndexOf("_") + 1);
                    globalVariable.add(value);
                } else if (value.contains("randomNumber_")) {
                    System.out.println(value.substring(15, value.lastIndexOf("_")));

                    int quantity = Integer.parseInt(value.substring(15, value.lastIndexOf("_")));
                    String text = randomNumber(quantity);
                    value = value.substring(0, value.indexOf("_")) + text + value.substring(value.lastIndexOf("_") + 1);
                    globalVariable.add(value);
                }

                if (label.contains("textarea")) {
                    label = label.split("_")[1];
                    commonPage.textareaWithLabel(label).clear();
                    actions.moveToElement(commonPage.textareaWithLabel(label));
                    commonPage.textareaWithLabel(label).sendKeys(value);
                } else {
                    commonPage.inputWithLabel(label).clear();
                    actions.moveToElement(commonPage.inputWithLabel(label));
                    commonPage.inputWithLabel(label).sendKeys(value);
                }
            }
            else {
                if (label.contains("textarea")) {
                    label = label.split("_")[1];
                    commonPage.textareaWithLabel(label).clear();
                } else {
                    commonPage.inputWithLabel(label).clear();
                }
            }
        }

    }

    @When("Click button {string} bản ghi")
    public void clickBtnEditBanGhi(String action) {
        commonPage.btnEditThongtin(action).click();
    }

    @Then("Hiển thị alert thành công")
    public void verifyAlertSuccess() {
        commonPage.alertSuccess.isDisplayed();
    }

    @Then("Hiển thị alert thông báo lỗi")
    public void verifyAlertSuccess(DataTable dataTable) {
        List<String> list = dataTable.asList(String.class);
        for (String msg : list) {
            Assert.assertEquals(msg, commonPage.alert.getText());
        }
    }

    @When("Refresh the web")
    public void refresh() {
        commonPage.refreshWeb();
    }

    @Then("Verify dữ liệu hiển thị ở trường input")
    public void verifyDataValue(DataTable dataTable) throws InterruptedException {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            String actual ;
            waitforPageLoad();
            Thread.sleep(5000);
            if (label.contains("textarea")){
                label = label.split("_")[1];
                actual = commonPage.textareaWithLabel(label).getAttribute("value");
            }
            else {
                actual = commonPage.inputWithLabel(label).getAttribute("value");
            }
            if (value != null) {
                if (value.contains("valueNumber_")) {
                    int index = Integer.parseInt(value.split("_")[1]) - 1;
                    value = globalVariable.get(index);
                }
            } else {
                value = "";
            }

            Assert.assertEquals(actual, value, "Assert failed. Expect: " + value + " but actual: " + actual);
        }
    }

    @When("Lấy Data từ label")
    public void saveValue(DataTable dataTable) {
        List<String> list = dataTable.asList(String.class);
        for (String label : list) {
            commonPage.getValueAttribute(commonPage.inputWithLabel(label));
        }
    }

    @When("Chọn radio button ở nhiều field")
    public void chonRadioVaoNhieuField(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            if (commonPage.btnRadio(label, value).isSelected()) {
                commonPage.btnRadio(label, value).click();
            }
            commonPage.btnRadio(label, value).click();
        }
    }
    @When("Select option ở nhiều field")
    public void selectVaoNhieuField(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            if (commonPage.selectOption(label, value).isSelected()) {
                commonPage.selectOption(label, value).click();
            }
            commonPage.selectOption(label, value).click();
        }
    }

    @Then("Button radio đã select")
    public void verifyRadioValue(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            waitforPageLoad();
            boolean actual = commonPage.btnRadio(label, value).isSelected();
            Assert.assertTrue(actual, "Assert failed. Expect: true but actual: " + actual);
        }
    }

    @When("Select tab : {string}")
    public void select_tab(String menu) {
        commonPage.tab(menu).click();
    }

    @When("Select sub tab : {string}")
    public void select_sub_tab(String menu) {
        commonPage.subTab(menu).click();

    }

    @Then("Verify attribute của trường input")
    public void verifyAttributeValue(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("attribute");
            String label = stringStringMap.get("label");
            String expect = stringStringMap.get("expect");
            waitforPageLoad();
            actions.moveToElement(commonPage.inputWithLabel(label));
            String actual = commonPage.inputWithLabel(label).getAttribute(value);
            Assert.assertEquals(actual, expect, "Assert failed. Expect: " + expect + " but actual: " + actual);
        }
    }
    @When("Import file với đường dẫn vào label")
    public void importFilr(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringMap : list) {
            String path = System.getProperty("user.dir") +"/src/test/resources/dataTest"+ stringMap.get("path");
            commonPage.inputFile(stringMap.get("name")).sendKeys(path);

        }
    }
    @Then("Option value đã select")
    public void verifySelectValue(DataTable dataTable) {
        List<Map<String, String>> list = dataTable.asMaps(String.class, String.class);
        for (Map<String, String> stringStringMap : list) {
            String value = stringStringMap.get("value");
            String label = stringStringMap.get("label");
            waitforPageLoad();
            boolean actual = Boolean.parseBoolean(commonPage.selectOption(label, value).getAttribute("selected"));
            Assert.assertTrue(actual, "Assert failed. Expect: true but actual: " + actual);
        }
    }
}
