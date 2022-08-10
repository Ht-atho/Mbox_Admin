Feature: AdminDN - Tính công

  @TinhCong @Precondition
  Scenario: Tạo lịch làm việc cho nhân viên
    Given "Admin_Mbox" dang nhap thanh cong vao Mbox Admin
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hanh Đong "Xem chi tiết"
    When Click button "Lịch làm việc" in Doanh nghiep page
    When Click button "Tạo lịch làm việc mới" in Doanh nghiep page
    When Nhap value vao nhieu field
      | label               | value                 |
      | Tên ca làm việc mới | +random_8_ hành chính |
      | Hệ số tính công     | 1                     |
#      | Hiệu lực ca         | today_-30             |
#      | Tên ca làm việc mới | today_30              |
    And Select option ở nhiều field
      | label          | value        |
      | Cách tính công | Theo giờ     |
      | Hình thức tính | Theo hệ số   |
      | Hình thức tính | Theo hệ số   |
      | Lặp ca         | 4 tuần 1 lần |
    And Chọn checkbox ở nhiều field
      | Áp dụng cho tất cả nhân viên |
    And Chọn ngày làm việc của ca
      | Thứ 2 |
      | Thứ 3 |
      | Thứ 4 |
      | Thứ 5 |
      | Thứ 6 |
      | Thứ 7 |
    And Chọn giờ làm việc của ca
      | Giờ bắt đầu | Giờ kết thúc |
      | 8:00        | 17:00        |

    When Click button "Tạo ca làm việc" in Doanh nghiep page




