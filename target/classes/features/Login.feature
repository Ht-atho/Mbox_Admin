Feature: Login

  @Login
  Scenario: Login successfully
    Given "Admin_Mbox" đăng nhập thành công vào Mbox Admin
    When Di chuyển đến menu "Lịch làm việc"
    When Di chuyển đến menu "Giao dịch mBox"
