Feature: Admin Mbox - Config Ứng Lương

  Background:
    Given "Admin_Mbox" dang nhap thanh cong vao Mbox Admin

  @UngLuong_9pay @UL_93
  Scenario: Nhap giá trị hợp lệ vào số tiền ứng tối thiểu, tối đa
    And Truy cap theo menu
      | Cấu hình |
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    When Nhap value vao nhieu field
      | label                 | value   |
      | Số tiền ứng tối thiểu | 500000  |
      | Số tiền ứng tối đa    | 2000000 |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    Then Verify du lieu hien thi o truong input
      | label                 | value   |
      | Số tiền ứng tối thiểu | 500000  |
      | Số tiền ứng tối đa    | 2000000 |

  @UngLuong_9pay @UL_95 @UL_97 @UL_98
  Scenario: Để trống trường số tiền ứng tối thiểu, Số tiền ứng tối đa
    And Truy cap theo menu
      | Cấu hình |
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    When Nhap value vao nhieu field
      | label                 | value |
      | Số tiền ứng tối thiểu |       |
      | Số tiền ứng tối đa    |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    Then Verify du lieu hien thi o truong input
      | label                 | value |
      | Số tiền ứng tối thiểu |       |
      | Số tiền ứng tối đa    |       |

  @UngLuong_9pay @UL_96
  Scenario: Nhap Giá trị ứng tối thiểu nhỏ hơn 10.000
    And Truy cap theo menu
      | Cấu hình |
    And Select tab : "Third Party"
    And Select sub tab : "9Pay"
    And Nhap value vao nhieu field
      | label                 | value |
      | Số tiền ứng tối thiểu | 8000  |
    And Click button "Cập nhật" ban ghi
    And Verify attribute của trường input
      | label                 | attribute | expect |
      | Số tiền ứng tối thiểu | min       | 10000  |
