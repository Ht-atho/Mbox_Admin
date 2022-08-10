Feature: Admin Mbox - Config Ứng Lương

  Background:
    Given "Admin_Mbox" dang nhap thanh cong vao Mbox Admin
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hanh Đong "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page

  @UngLuong @DN_02
  Scenario: Cập nhật tên doanh nghiệp mới
    When Nhap value vao nhieu field
      | label            | value      |
      | Tên doanh nghiệp | +random_8_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label            | value         |
      | Tên doanh nghiệp | valueNumber_1 |
    When Nhap value vao nhieu field
      | label            | value   |
      | Tên doanh nghiệp | Auto_DN |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong

  @UngLuong @DN_03
  Scenario: Cập nhật tên viết tắt mới
    When Nhap value vao nhieu field
      | label        | value      |
      | Tên viết tắt | +random_3_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label        | value         |
      | Tên viết tắt | valueNumber_1 |


  @UngLuong @DN_04
  Scenario: Cập nhật chỉnh sửa email đúng định dạng
    When Nhap value vao nhieu field
      | label | value                |
      | Email | +random_8_@gmail.com |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label | value         |
      | Email | valueNumber_1 |

  @UngLuong @DN_05
  Scenario: Cập nhật chỉnh sửa email sai định dạng
    When Nhap value vao nhieu field
      | label | value           |
      | Email | +random_8_@.com |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Trường email có định dạng không hợp lệ. |

  @UngLuong @DN_06 #failed
  Scenario: Cập nhật chỉnh sửa email đã tồn tại trong database
    When Nhap value vao nhieu field
      | label | value              |
      | Email | tuanvm@techlead.vn |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Trường email có định dạng không hợp lệ. |

  @UngLuong @DN_07
  Scenario: Cập nhật chỉnh sửa số điện thoại đúng định dạng
    When Nhap value vao nhieu field
      | label       | value             |
      | Điện thoại* | 0_randomNumber_9_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label       | value         |
      | Điện thoại* | valueNumber_1 |

  @UngLuong @DN_08 #failed
  Scenario: Cập nhật chỉnh sửa sđt đã tồn tại trong database
    When Nhap value vao nhieu field
      | label       | value             |
      | Điện thoại* | _randomNumber_10_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Số điện thoại đã được sử dụng |

  @UngLuong @DN_09 #failed
  Scenario: Cập nhật chỉnh sửa số điện thoại không đúng định dạng
    When Nhap value vao nhieu field
      | label       | value             |
      | Điện thoại* | _randomNumber_10_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Trường tel có định dạng không hợp lệ. |

  @UngLuong @DN_10
  Scenario: Cập nhật chỉnh sửa hotline đúng định dạng
    When Nhap value vao nhieu field
      | label   | value             |
      | Hotline | 0_randomNumber_9_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value         |
      | Hotline | valueNumber_1 |

  @UngLuong @DN_11 #failed
  Scenario: Cập nhật hotline không đúng định dạng
    When Nhap value vao nhieu field
      | label   | value             |
      | Hotline | 9_randomNumber_9_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Trường số điện thoại hotline có định dạng không hợp lệ. |

  @UngLuong @DN_12 #failed
  Scenario: Cập nhật chỉnh sửa sđt hotline đã tồn tại trong database
    When Nhap value vao nhieu field
      | label   | value      |
      | Hotline | 0987654321 |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value         |
      | Hotline | valueNumber_1 |

  @UngLuong @DN_13
  Scenario: Cập nhật fax thành công
    When Nhap value vao nhieu field
      | label | value             |
      | Fax   | 0_randomNumber_9_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label | value         |
      | Fax   | valueNumber_1 |

  @UngLuong @DN_14
  Scenario: Cập nhật địa chỉ thành công
    When Nhap value vao nhieu field
      | label   | value                                    |
      | Địa chỉ | Số 10, Đường x, Phường y, Quan Z, Hà Nội |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value                                    |
      | Địa chỉ | Số 10, Đường x, Phường y, Quan Z, Hà Nội |

  @UngLuong @DN_15
  Scenario: Cập nhật mã số thuế thành công
    When Nhap value vao nhieu field
      | label      | value                 |
      | Mã số thuế | 8_randomNumber_8_-456 |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label      | value         |
      | Mã số thuế | valueNumber_1 |

  @UngLuong @DN_16
  Scenario: Cập nhật mô tả thành công
    When Nhap value vao nhieu field
      | label          | value       |
      | textarea_Mô tả | +random_36_ |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label          | value         |
      | textarea_Mô tả | valueNumber_1 |

  @UngLuong @DN_18
  Scenario: Cập nhật Logo không đúng định dạng hình ảnh
    When Import file với đường dẫn vào label
      | name | path                              |
      | logo | /configDoanhNghiep_DN_18/Logo.pdf |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Trường logo phải là một tap tin có định dạng: jpeg, jpg, png, gif. |

  @UngLuong @DN_20
  Scenario: Chọn tạm khóa ứng lương
    And Chọn radio button ở nhiều field
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Button radio đã select
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |

  @UngLuong @DN_21
  Scenario: Chọn tạm khóa ứng lương
    And Chọn radio button ở nhiều field
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Button radio đã select
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |

  @UngLuong @DN_22
  Scenario: Cập nhật chọn 'Bat chấm công trên app'
    And Chọn radio button ở nhiều field
      | label                        | value |
      | Chức năng chấm công trên App | Bat   |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Button radio đã select
      | label                        | value |
      | Chức năng chấm công trên App | Bat   |

  @UngLuong @DN_23
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Chọn radio button ở nhiều field
      | label                        | value |
      | Chức năng chấm công trên App | Tắt   |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Button radio đã select
      | label                        | value |
      | Chức năng chấm công trên App | Tắt   |

  @UngLuong @DN_24
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Select option ở nhiều field
      | label      | value          |
      | Trạng thái | Đang hoạt động |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Option value đã select
      | label      | value          |
      | Trạng thái | Đang hoạt động |

  @UngLuong @DN_25
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Select option ở nhiều field
      | label      | value          |
      | Trạng thái | Chưa hoạt động |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Option value đã select
      | label      | value          |
      | Trạng thái | Chưa hoạt động |

  @UngLuong @DN_26
  Scenario: Cập nhật % phí giao dịch
    When Nhap value vao nhieu field
      | label             | value |
      | Phí/Giao dịch (%) | 15    |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) | 15    |

  @UngLuong @DN_27
  Scenario: Cập nhật % phí giao dịch không hợp lệ
    When Nhap value vao nhieu field
      | label             | value                                    |
      | Phí/Giao dịch (%) | specia!@#$%^&*()_+-=.?><"\|"\|\~!`[];':" |
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) |       |

  @UngLuong @DN_28
  Scenario: Cập nhật % phí giao dịch là 0
    When Nhap value vao nhieu field
      | label             | value |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_29
  Scenario: Cập nhật % phí giao dịch là 100%
    When Nhap value vao nhieu field
      | label             | value |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_30
  Scenario: Cập nhật % phí giao dịch > 100%
    When Nhap value vao nhieu field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | 165   |
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_31
  Scenario: Cập nhật phí giao dịch tối thiểu thành công
    And Nhap value vao nhieu field
      | label                      | value   |
      | Phí/Giao dịch tối thiểu(đ) | 1000000 |
      | Phí/Giao dịch tối đa(đ)    | 9000000 |

    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 1000000.00 |

  @UngLuong @DN_32
  Scenario: Cập nhật phí giao dịch tối thiểu không hợp lệ
    And Nhap value vao nhieu field
      | label                      | value                                    |
      | Phí/Giao dịch tối thiểu(đ) | specia!@#$%^&*()_+-=.?><"\|"\|\~!`[];':" |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) |       |

  @UngLuong @DN_33
  Scenario: Cập nhật phí giao dịch tối đa
    And Nhap value vao nhieu field
      | label                   | value   |
      | Phí/Giao dịch tối đa(đ) | 8000000 |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                   | value      |
      | Phí/Giao dịch tối đa(đ) | 8000000.00 |

  @UngLuong @DN_34
  Scenario: Cập nhật phí giao dịch tối đa không hợp lệ
    And Nhap value vao nhieu field
      | label                   | value                                    |
      | Phí/Giao dịch tối đa(đ) | specia!@#$%^&*()_+-=.?><"\|"\|\~!`[];':" |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) |       |

  @UngLuong @DN_35
  Scenario: Cập nhật phí giao dịch tối đa > phí giao dịch tối thiểu
    And Nhap value vao nhieu field
      | label                      | value   |
      | Phí/Giao dịch tối thiểu(đ) | 2300000 |
      | Phí/Giao dịch tối đa(đ)    | 9800000 |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 2300000.00 |
      | Phí/Giao dịch tối đa(đ)    | 9800000.00 |

  @UngLuong @DN_36
  Scenario: Cập nhật phí giao dịch tối thiểu > phí giao dịch tối đa
    And Lấy Data từ label
      | Phí/Giao dịch tối thiểu(đ) |
      | Phí/Giao dịch tối đa(đ)    |
    And Nhap value vao nhieu field
      | label                      | value       |
      | Phí/Giao dịch tối thiểu(đ) | 10000000.00 |
      | Phí/Giao dịch tối đa(đ)    | 9000000.00  |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thong bao loi
      | Phí/Giao dịch tối thiểu phải nhỏ hơn hoặc bằng phí/giao dịch tối đa |
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                      | value         |
      | Phí/Giao dịch tối thiểu(đ) | valueNumber_1 |
      | Phí/Giao dịch tối đa(đ)    | valueNumber_2 |

  @UngLuong @DN_37
  Scenario: Cập nhật phí giao dịch tối đa = phí giao dịch tối thiểu
    And Nhap value vao nhieu field
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 5000000 |
      | Phí/Giao dịch tối đa(đ)    | 5000000 |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 5000000.00 |
      | Phí/Giao dịch tối đa(đ)    | 5000000.00 |

  @UngLuong @DN_39 @DN_41
  Scenario Outline: Bỏ trống hoặc nhap tỷ lệ ứng trước lương bằng 0
    And Nhap value vao nhieu field
      | label                     | value  |
      | Tỷ lệ ứng trước lương (%) | <date> |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value   |
      | Tỷ lệ ứng trước lương (%) | <value> |

    Examples:
      | date | value |
      | 0    | 0     |
      |      |       |

  @UngLuong @DN_40
  Scenario: Cập nhật % tỷ lệ ứng trước lương là 100%
    And Nhap value vao nhieu field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |

  @UngLuong @DN_42
  Scenario: Cập nhật để trống % tỷ lệ ứng trước lương
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 165   |
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |

  @UngLuong @DN_43
  Scenario: Cập nhật % tỷ lệ ứng trước lương không hợp lệ

    When Nhap value vao nhieu field
      | label                     | value                                    |
      | Tỷ lệ ứng trước lương (%) | specia!@#$%^&*()_+-=?><"\|"\|\~!`[];':" |
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) |       |

  @UngLuong @DN_44
  Scenario Outline: Cập nhật mức ứng tối đa/nhân sự/ tháng hợp lệ

    When Nhap value vao nhieu field
      | label   | value    |
      | <label> | 10000000 |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value       |
      | <label> | 10000000.00 |

    Examples:
      | label                        |
      | Mức ứng tối đa/nhân sự/tháng |


  @UngLuong @DN_45
  Scenario: Admin Mức ứng tối đa/nhân sự/tháng = 0

    When Nhap value vao nhieu field
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0     |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0.00  |

  @UngLuong @DN_46
  Scenario: Cập nhật Mức ứng tối đa/nhân sự/tháng không hợp lệ

    When Nhap value vao nhieu field
      | label                        | value                                    |
      | Mức ứng tối đa/nhân sự/tháng | specia!@#$%^&*()_+-=?><"\|"\|\~!`[];':" |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng |       |

  @UngLuong @DN_47
  Scenario Outline: Admin để trống Mức ứng tối đa/nhân sự/tháng

    When Nhap value vao nhieu field
      | label   | value |
      | <label> |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value |
      | <label> |       |

    Examples:
      | label                        |
      | Mức ứng tối đa/nhân sự/tháng |

  @UngLuong @DN_48
  Scenario Outline: Cập nhật Ngày công chuẩn mỗi tháng hợp lệ

    When Nhap value vao nhieu field
      | label   | value |
      | <label> | 25    |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value |
      | <label> | 25    |

    Examples:
      | label                     |
      | Ngày công chuẩn mỗi tháng |

  @UngLuong @DN_49
  Scenario: Cập nhật Ngày công chuẩn mỗi tháng không hợp lệ

    When Nhap value vao nhieu field
      | label                     | value                                    |
      | Ngày công chuẩn mỗi tháng | specia!@#$%^&*()_+-=?><"\|"\|\~!`[];':" |
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Ngày công chuẩn mỗi tháng |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Ngày công chuẩn mỗi tháng |       |

  @UngLuong @DN_50
  Scenario: Cập nhật Ngày công chuẩn mỗi tháng > 31 ngày

    When Nhap value vao nhieu field
      | label                     | value |
      | Ngày công chuẩn mỗi tháng | 40    |
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Ngày công chuẩn mỗi tháng | 31    |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Ngày công chuẩn mỗi tháng | 31    |

  @UngLuong @DN_51
  Scenario: Cập nhật Ngày công chuẩn mỗi tháng không hợp lệ

    When Nhap value vao nhieu field
      | label                     | value |
      | Ngày công chuẩn mỗi tháng |       |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                     | value |
      | Ngày công chuẩn mỗi tháng |       |

  @UngLuong @DN_52
  Scenario Outline: Cập nhật ngày chốt lương hợp lệ
    When Select option ở nhiều field
      | label   | value |
      | <label> | <day> |
    When Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label   | value |
      | <label> | <day> |
    Examples:
      | label           | day |
      | Ngày chốt lương | 15  |

  @UngLuong @DN_56
  Scenario Outline: Cập nhật ngày khóa ứng lương hợp lệ
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label               | value  |
      | Ngày khóa ứng lương | <date> |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label               | value   |
      | Ngày khóa ứng lương | <value> |

    Examples:
      | date      | value         |
      | today_-10 | valueNumber_1 |

  @UngLuong @DN_58
  Scenario Outline: Cập nhật ngày khóa ứng lương hợp lệ
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label               | value  |
      | Ngày khóa ứng lương | <date> |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label               | value   |
      | Ngày khóa ứng lương | <value> |

    Examples:
      | date     | value         |
      | today_10 | valueNumber_1 |

  @UngLuong @DN_59
  Scenario Outline: Cập nhật ngày khóa ứng lương hợp lệ
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label               | value  |
      | Ngày khóa ứng lương | <date> |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label               | value   |
      | Ngày khóa ứng lương | <value> |

    Examples:
      | date   | value         |
      | today_0 | valueNumber_1 |

  @UngLuong @DN_60
  Scenario Outline: Cập nhật ngày khóa ứng lương là ngày trong quá khứ
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label               | value  |
      | Ngày khóa ứng lương | <date> |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label               | value   |
      | Ngày khóa ứng lương | <value> |

    Examples:
      | date      | value         |
      | today_-15 | valueNumber_1 |

  @UngLuong @DN_61
  Scenario: Cập nhật để trống ngày khóa ứng lương
    And Truy cap theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tim kiem voi keyword va nhan Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hanh Đong "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhap value vao nhieu field
      | label               | value |
      | Ngày khóa ứng lương |       |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label               | value |
      | Ngày khóa ứng lương |       |

  @UngLuong @DN_62
  Scenario: Cập nhật để trống ngày khóa ứng lương
    And Chọn radio button ở nhiều field
      | label                        | value              |
      | Khóa tạm ứng                 | Không khóa tạm ứng |
      | Chức năng chấm công trên App | Bat                |
    And Select option ở nhiều field
      | label           | value          |
      | Trạng thái      | Đang hoạt động |
      | Ngày chốt lương | 26             |
    And Nhap value vao nhieu field
      | label                        | value                                    |
      | Tên doanh nghiệp             | +random_8_                               |
      | Tên viết tắt                 | +random_3_                               |
      | Email                        | +random_8_@gmail.com                     |
      | Điện thoại*                  | 0_randomNumber_9_                        |
      | Hotline                      | 0_randomNumber_9_                        |
      | Fax                          | 0_randomNumber_9_                        |
      | Địa chỉ                      | Số 10, Đường x, Phường y, Quan Z, Hà Nội |
      | Mã số thuế                   | 8_randomNumber_8_-852                    |
      | textarea_Mô tả               | +random_36_                              |
      | Phí/Giao dịch (%)            | 15                                       |
      | Phí/Giao dịch tối thiểu(đ)   | 2300000                                  |
      | Phí/Giao dịch tối đa(đ)      | 9800000                                  |
      | Tỷ lệ ứng trước lương (%)    | 45                                       |
      | Mức ứng tối đa/nhân sự/tháng | 10000000                                 |
      | Ngày khóa ứng lương          | today_-10                                |
      | Ngày công chuẩn mỗi tháng    | 22                                       |

    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    When Refresh the web
    Then Verify du lieu hien thi o truong input
      | label                        | value                                    |
      | Tên doanh nghiệp             | valueNumber_1                            |
      | Tên viết tắt                 | valueNumber_2                            |
      | Email                        | valueNumber_3                            |
      | Điện thoại*                  | valueNumber_4                            |
      | Hotline                      | valueNumber_5                            |
      | Fax                          | valueNumber_6                            |
      | Địa chỉ                      | Số 10, Đường x, Phường y, Quan Z, Hà Nội |
      | Mã số thuế                   | valueNumber_7                            |
      | textarea_Mô tả               | valueNumber_8                            |
      | Phí/Giao dịch (%)            | 15                                       |
      | Phí/Giao dịch tối thiểu(đ)   | 2300000.00                               |
      | Phí/Giao dịch tối đa(đ)      | 9800000.00                               |
      | Tỷ lệ ứng trước lương (%)    | 45                                       |
      | Mức ứng tối đa/nhân sự/tháng | 10000000.00                              |
      | Ngày công chuẩn mỗi tháng    | 22                                       |
      | Ngày khóa ứng lương          | valueNumber_9                            |
    Then Option value đã select
      | label           | value          |
      | Trạng thái      | Đang hoạt động |
      | Ngày chốt lương | 26             |
    Then Button radio đã select
      | label                        | value              |
      | Khóa tạm ứng                 | Không khóa tạm ứng |
      | Chức năng chấm công trên App | Bat                |
    And Nhap value vao nhieu field
      | label            | value   |
      | Tên doanh nghiệp | Auto_DN |
    And Click button "Cập nhật" ban ghi
    Then Hien thi alert thanh cong
    

