Feature: Config Ứng Lương

  Background:
    Given "Admin_Mbox" đăng nhập thành công vào Mbox Admin

  @UngLuong_9pay @UL_93
  Scenario: Nhập giá trị hợp lệ vào số tiền ứng tối thiểu, tối đa
    And Truy cập theo menu
      | Cấu hình |
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    When Nhập value vào nhiều field
      | label                 | value   |
      | Số tiền ứng tối thiểu | 500000  |
      | Số tiền ứng tối đa | 2000000 |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    Then Verify dữ liệu hiển thị ở trường input
      | label                 | value   |
      | Số tiền ứng tối thiểu | 500000  |
      | Số tiền ứng tối đa    | 2000000 |

