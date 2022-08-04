Feature: Admin Mbox - Config Ứng Lương

  Background:
    Given "Admin_Mbox" đăng nhập thành công vào Mbox Admin
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page

  @UngLuong @DN_02
  Scenario: Cập nhật tên doanh nghiệp mới
    When Nhập value vào nhiều field
      | label            | value      |
      | Tên doanh nghiệp | +random_8_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label            | value         |
      | Tên doanh nghiệp | valueNumber_1 |
    When Nhập value vào nhiều field
      | label            | value   |
      | Tên doanh nghiệp | Auto_DN |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công

  @UngLuong @DN_03
  Scenario: Cập nhật tên viết tắt mới
    When Nhập value vào nhiều field
      | label        | value      |
      | Tên viết tắt | +random_3_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label        | value         |
      | Tên viết tắt | valueNumber_1 |


  @UngLuong @DN_04
  Scenario: Cập nhật chỉnh sửa email đúng định dạng
    When Nhập value vào nhiều field
      | label | value                |
      | Email | +random_8_@gmail.com |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label | value         |
      | Email | valueNumber_1 |

  @UngLuong @DN_05
  Scenario: Cập nhật chỉnh sửa email sai định dạng
    When Nhập value vào nhiều field
      | label | value           |
      | Email | +random_8_@.com |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thông báo lỗi
      | Trường email có định dạng không hợp lệ. |

#  @UngLuong @DN_06
#  Scenario: Cập nhật chỉnh sửa email đã tồn tại trong database
#    When Nhập value vào nhiều field
#      | label | value              |
#      | Email | tuanvm@techlead.vn |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thông báo lỗi
#      | Trường email có định dạng không hợp lệ. |

  @UngLuong @DN_07
  Scenario: Cập nhật chỉnh sửa số điện thoại đúng định dạng
    When Nhập value vào nhiều field
      | label       | value             |
      | Điện thoại* | 0_randomNumber_9_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label       | value         |
      | Điện thoại* | valueNumber_1 |

#  @UngLuong @DN_08
#  Scenario: Cập nhật chỉnh sửa sđt đã tồn tại trong database
#    When Nhập value vào nhiều field
#      | label       | value             |
#      | Điện thoại* | _randomNumber_10_ |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thông báo lỗi
#      | Số điện thoại đã được sử dụng |
#
#  @UngLuong @DN_09
#  Scenario: Cập nhật chỉnh sửa số điện thoại không đúng định dạng
#    When Nhập value vào nhiều field
#      | label       | value             |
#      | Điện thoại* | _randomNumber_10_ |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thông báo lỗi
#      | Trường tel có định dạng không hợp lệ. |

  @UngLuong @DN_10
  Scenario: Cập nhật chỉnh sửa hotline đúng định dạng
    When Nhập value vào nhiều field
      | label   | value             |
      | Hotline | 0_randomNumber_9_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value         |
      | Hotline | valueNumber_1 |

#  @UngLuong @DN_11
#  Scenario: Cập nhật hotline không đúng định dạng
#    When Nhập value vào nhiều field
#      | label   | value             |
#      | Hotline | 9_randomNumber_9_ |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thông báo lỗi
#      | Trường số điện thoại hotline có định dạng không hợp lệ. |

#  @UngLuong @DN_12
#  Scenario: Cập nhật chỉnh sửa sđt hotline đã tồn tại trong database
#    When Nhập value vào nhiều field
#      | label   | value      |
#      | Hotline | 0987654321 |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thành công
#    When Refresh the web
#    Then Verify dữ liệu hiển thị ở trường input
#      | label   | value         |
#      | Hotline | valueNumber_1 |

  @UngLuong @DN_13
  Scenario: Cập nhật fax thành công
    When Nhập value vào nhiều field
      | label | value             |
      | Fax   | 0_randomNumber_9_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label | value         |
      | Fax   | valueNumber_1 |

  @UngLuong @DN_14
  Scenario: Cập nhật địa chỉ thành công
    When Nhập value vào nhiều field
      | label   | value                                    |
      | Địa chỉ | Số 10, Đường x, Phường y, Quận Z, Hà Nội |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value                                    |
      | Địa chỉ | Số 10, Đường x, Phường y, Quận Z, Hà Nội |

  @UngLuong @DN_15
  Scenario: Cập nhật mã số thuế thành công
    When Nhập value vào nhiều field
      | label      | value                 |
      | Mã số thuế | 8_randomNumber_8_-456 |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label      | value         |
      | Mã số thuế | valueNumber_1 |

  @UngLuong @DN_16
  Scenario: Cập nhật mô tả thành công
    When Nhập value vào nhiều field
      | label          | value       |
      | textarea_Mô tả | +random_36_ |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label          | value         |
      | textarea_Mô tả | valueNumber_1 |

  @UngLuong @DN_18
  Scenario: Cập nhật Logo không đúng định dạng hình ảnh
    When Import file với đường dẫn vào label
      | name | path                              |
      | logo | /configDoanhNghiep_DN_18/Logo.pdf |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thông báo lỗi
      | Trường logo phải là một tập tin có định dạng: jpeg, jpg, png, gif. |

  @UngLuong @DN_20
  Scenario: Chọn tạm khóa ứng lương
    And Chọn radio button ở nhiều field
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |

  @UngLuong @DN_21
  Scenario: Chọn tạm khóa ứng lương
    And Chọn radio button ở nhiều field
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |

  @UngLuong @DN_22
  Scenario: Cập nhật chọn 'Bật chấm công trên app'
    And Chọn radio button ở nhiều field
      | label                        | value |
      | Chức năng chấm công trên App | Bật   |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label                        | value |
      | Chức năng chấm công trên App | Bật   |

  @UngLuong @DN_23
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Chọn radio button ở nhiều field
      | label                        | value |
      | Chức năng chấm công trên App | Tắt   |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label                        | value |
      | Chức năng chấm công trên App | Tắt   |

  @UngLuong @DN_24
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Select option ở nhiều field
      | label      | value          |
      | Trạng thái | Đang hoạt động |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Option value đã select
      | label      | value          |
      | Trạng thái | Đang hoạt động |

  @UngLuong @DN_25
  Scenario: Cập nhật chọn 'Tắt chấm công trên app'
    And Select option ở nhiều field
      | label      | value          |
      | Trạng thái | Chưa hoạt động |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Option value đã select
      | label      | value          |
      | Trạng thái | Chưa hoạt động |

  @UngLuong @DN_26
  Scenario: Cập nhật % phí giao dịch
    When Nhập value vào nhiều field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | 15    |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000.00  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000.00 |
      | Phí/Giao dịch (%) | 15    |

  @UngLuong @DN_27
  Scenario: Cập nhật % phí giao dịch không hợp lệ
    When Nhập value vào nhiều field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | -hg   |
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) |       |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) |       |

  @UngLuong @DN_28
  Scenario: Cập nhật % phí giao dịch là 0
    When Nhập value vào nhiều field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_29
  Scenario: Cập nhật % phí giao dịch là 100%
    When Nhập value vào nhiều field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_30
  Scenario: Cập nhật % phí giao dịch > 100%
    When Nhập value vào nhiều field
      | label             | value |
#      | Phí/Giao dịch tối thiểu(đ) | 500000  |
#      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%) | 165   |
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) | 100   |

  @UngLuong @DN_31
  Scenario: Cập nhật phí giao dịch tối thiểu thành công
    And Nhập value vào nhiều field
      | label                      | value   |
      | Phí/Giao dịch tối thiểu(đ) | 1000000 |
      | Phí/Giao dịch tối đa(đ)    | 9000000 |

    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 1000000.00 |

  @UngLuong @DN_32
  Scenario: Cập nhật phí giao dịch tối thiểu không hợp lệ
    And Nhập value vào nhiều field
      | label                      | value  |
      | Phí/Giao dịch tối thiểu(đ) | -/*+hk |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) |       |

  @UngLuong @DN_33
  Scenario: Cập nhật phí giao dịch tối đa
    And Nhập value vào nhiều field
      | label                   | value   |
      | Phí/Giao dịch tối đa(đ) | 8000000 |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                   | value      |
      | Phí/Giao dịch tối đa(đ) | 8000000.00 |

  @UngLuong @DN_34
  Scenario: Cập nhật phí giao dịch tối đa không hợp lệ
    And Nhập value vào nhiều field
      | label                   | value  |
      | Phí/Giao dịch tối đa(đ) | -/*+hk |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) |       |

  @UngLuong @DN_35
  Scenario: Cập nhật phí giao dịch tối đa > phí giao dịch tối thiểu
    And Nhập value vào nhiều field
      | label                      | value   |
      | Phí/Giao dịch tối thiểu(đ) | 2300000 |
      | Phí/Giao dịch tối đa(đ)    | 9800000 |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 2300000.00 |
      | Phí/Giao dịch tối đa(đ)    | 9800000.00 |

  @UngLuong @DN_36
  Scenario: Cập nhật phí giao dịch tối thiểu > phí giao dịch tối đa
    And Lấy Data từ label
      | Phí/Giao dịch tối thiểu(đ) |
      | Phí/Giao dịch tối đa(đ)    |
    And Nhập value vào nhiều field
      | label                      | value       |
      | Phí/Giao dịch tối thiểu(đ) | 10000000.00 |
      | Phí/Giao dịch tối đa(đ)    | 9000000.00  |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thông báo lỗi
      | Phí/Giao dịch tối thiểu phải nhỏ hơn hoặc bằng phí/giao dịch tối đa |
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value         |
      | Phí/Giao dịch tối thiểu(đ) | valueNumber_1 |
      | Phí/Giao dịch tối đa(đ)    | valueNumber_2 |

  @UngLuong @DN_37
  Scenario: Cập nhật phí giao dịch tối đa = phí giao dịch tối thiểu
    And Nhập value vào nhiều field
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 5000000.00 |
      | Phí/Giao dịch tối đa(đ)    | 5000000.00 |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 5000000.00 |
      | Phí/Giao dịch tối đa(đ)    | 5000000.00 |

  @UngLuong @DN_39 @DN_41
  Scenario Outline: Bỏ trống hoặc nhập tỷ lệ ứng trước lương bằng 0
    And Nhập value vào nhiều field
      | label                     | value  |
      | Tỷ lệ ứng trước lương (%) | <date> |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value   |
      | Tỷ lệ ứng trước lương (%) | <value> |

    Examples:
      | date | value |
      | 0    | 0     |
      |      |       |

  @UngLuong @DN_40
  Scenario: Cập nhật % tỷ lệ ứng trước lương là 100%
    And Nhập value vào nhiều field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |

  @UngLuong @DN_42
  Scenario: Cập nhật để trống % tỷ lệ ứng trước lương
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 165   |
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 100   |

  @UngLuong @DN_43
  Scenario: Cập nhật % tỷ lệ ứng trước lương không hợp lệ

    When Nhập value vào nhiều field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | -hg   |
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) |       |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) |       |

  @UngLuong @DN_44
  Scenario Outline: Cập nhật mức ứng tối đa/nhân sự/ tháng hợp lệ

    When Nhập value vào nhiều field
      | label   | value    |
      | <label> | 10000000 |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value       |
      | <label> | 10000000.00 |

    Examples:
      | label                        |
      | Mức ứng tối đa/nhân sự/tháng |


  @UngLuong @DN_45
  Scenario: Admin Mức ứng tối đa/nhân sự/tháng = 0

    When Nhập value vào nhiều field
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0.00  |

#  @UngLuong @DN_46
#  Scenario: Cập nhật Mức ứng tối đa/nhân sự/tháng không hợp lệ
#
#    When Nhập value vào nhiều field
#      | label                        | value |
#      | Mức ứng tối đa/nhân sự/tháng | -hg   |
#    When Click button "Cập nhật" bản ghi
#    Then Hiển thị alert thành công
#    When Refresh the web
#    Then Verify dữ liệu hiển thị ở trường input
#      | label                        | value |
#      | Mức ứng tối đa/nhân sự/tháng |       |

  @UngLuong @DN_47
  Scenario Outline: Admin để trống Mức ứng tối đa/nhân sự/tháng

    When Nhập value vào nhiều field
      | label   | value |
      | <label> |       |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value |
      | <label> |       |

    Examples:
      | label                        |
      | Mức ứng tối đa/nhân sự/tháng |

  @UngLuong @DN_48
  Scenario Outline: Cập nhật ngày công chuẩn hợp lệ

    When Nhập value vào nhiều field
      | label   | value |
      | <label> | 25    |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value |
      | <label> | 25    |

    Examples:
      | label           |
      | Ngày công chuẩn |

  @UngLuong @DN_49
  Scenario: Cập nhật ngày công chuẩn không hợp lệ

    When Nhập value vào nhiều field
      | label           | value |
      | Ngày công chuẩn | -hg   |
    Then Verify dữ liệu hiển thị ở trường input
      | label           | value |
      | Ngày công chuẩn |       |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label           | value |
      | Ngày công chuẩn |       |

  @UngLuong @DN_50
  Scenario: Cập nhật ngày công chuẩn > 31 ngày

    When Nhập value vào nhiều field
      | label           | value |
      | Ngày công chuẩn | 40    |
    Then Verify dữ liệu hiển thị ở trường input
      | label           | value |
      | Ngày công chuẩn | 31    |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label           | value |
      | Ngày công chuẩn | 31    |

  @UngLuong @DN_49
  Scenario: Cập nhật ngày công chuẩn không hợp lệ

    When Nhập value vào nhiều field
      | label           | value |
      | Ngày công chuẩn |       |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label           | value |
      | Ngày công chuẩn |       |

  @UngLuong @DN_52 @DN_53
  Scenario: Cập nhật ngày công chuẩn = 1 - Cập nhật ngày công chuẩn = 31

    When Nhập value vào nhiều field
      | label   | value |
      | <label> | <day> |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label   | value |
      | <label> | <day> |

    Examples:
      | label           | day |
      | Ngày công chuẩn | 1   |
      | Ngày công chuẩn | 31  |

  @UngLuong @DN_76
  Scenario: Nhập các giá trị hợp lệ của các trường phí giao dịch

    When Nhập value vào nhiều field
      | label                      | value   |
      | Phí/Giao dịch tối thiểu(đ) | 500000  |
      | Phí/Giao dịch tối đa(đ)    | 9000000 |
      | Phí/Giao dịch (%)          | 15      |

    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value      |
      | Phí/Giao dịch tối thiểu(đ) | 500000.00  |
      | Phí/Giao dịch tối đa(đ)    | 9000000.00 |
      | Phí/Giao dịch (%)          | 15         |

  @UngLuong @DN_77
  Scenario: Nhập Phí/ Giao dịch tối thiểu là 0 hoặc bỏ trống

    When Nhập value vào nhiều field
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0.00  |

  @UngLuong @DN_78
  Scenario: Nhập phí/giao dịch (%) là 0

    When Nhập value vào nhiều field
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0.00  |


  @UngLuong @DN_80
  Scenario: Nhập phí/giao dịch (%) và phí giao dịch tối thiểu là 0
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
#    And Lấy Data từ label
#      | Phí/Giao dịch tối thiểu(đ) |
#      | Phí/Giao dịch tối đa(đ)    |
    And Nhập value vào nhiều field
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0     |
      | Phí/Giao dịch (%)          | 0     |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0.00  |
      | Phí/Giao dịch (%)          | 0     |

  @UngLuong @DN_81
  Scenario: Bỏ trống phí giao dịch (%)
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label             | value |
      | Phí/Giao dịch (%) |       |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label             | value |
      | Phí/Giao dịch (%) |       |

  @UngLuong @DN_81
  Scenario: Bỏ trống phí giao dịch (%)
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) | 0     |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) | 0.00  |

  @UngLuong @DN_82
  Scenario: Nhập phí tối đa bằng 0
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) | 0     |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) | 0.00  |

  @UngLuong @DN_83
  Scenario: Bỏ trống phí giao dịch tối đa
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) |       |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                   | value |
      | Phí/Giao dịch tối đa(đ) |       |

  @UngLuong @DN_84 @DN_85 @DN_86 @DN_87
  Scenario Outline: Chọn ngày khóa ứng lương - ngày tương lai - ngày quá khứ -ngày hiện tại -  bỏ trống
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label               | value  |
      | Ngày khóa ứng lương | <date> |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label               | value   |
      | Ngày khóa ứng lương | <value> |

    Examples:
      | date      | value         |
      | today_10  | valueNumber_1 |
      | today_-10 | valueNumber_1 |
      | today_0   | valueNumber_1 |
      |           |               |

  @UngLuong @DN_88
  Scenario: Nhập tỷ lệ ứng lương trước là một giá trị bất kỳ
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Nhập value vào nhiều field
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 16.23 |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                     | value |
      | Tỷ lệ ứng trước lương (%) | 16.23 |






