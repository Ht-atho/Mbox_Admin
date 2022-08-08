Feature: AdminDN - Tính công

  Background:
    Given "Admin_DN" đăng nhập thành công vào Mbox Admin

  @TinhCong @Precondition
  Scenario: Tạo lịch làm việc cho nhân viên
    And Truy cập theo menu
      | Bảng công |
    Then Chuyển sang page title "beta.mbox.vn - Chấm công"


