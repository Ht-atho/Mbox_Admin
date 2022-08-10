Feature: AdminDN - Tính công

  Background:
    Given "Admin_DN" dang nhap thanh cong vao Mbox Admin

  @TinhCong @Precondition
  Scenario: Tạo lịch làm việc cho nhân viên
    And Truy cap theo menu
      | Bảng công |
    Then Chuyển sang page title "beta.mbox.vn - Chấm công"


