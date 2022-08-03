Feature: Admin Mbox - Config Ứng Lương

  Background:
    Given "Admin_Mbox" đăng nhập thành công vào Mbox Admin

  @UngLuong @UL_74
  Scenario Outline: Admin để trống mức lương tối đa/ nhân sự/ tháng
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page
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

  @UngLuong @UL_75
  Scenario: Admin  mức lương tối đa/ nhân sự/ tháng = 0
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page
    When Nhập value vào nhiều field
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                        | value |
      | Mức ứng tối đa/nhân sự/tháng | 0.00  |

  @UngLuong @UL_76
  Scenario: Nhập các giá trị hợp lệ của các trường phí giao dịch
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page
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

  @UngLuong @UL_77
  Scenario: Nhập Phí/ Giao dịch tối thiểu là 0 hoặc bỏ trống
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page
    When Nhập value vào nhiều field
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0.00  |

  @UngLuong @UL_78
  Scenario: Nhập phí/giao dịch (%) là 0
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    When Click Hành Động "Xem chi tiết"
    When Click button "Chỉnh sửa" in Doanh nghiep page
    When Nhập value vào nhiều field
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0     |
    When Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Verify dữ liệu hiển thị ở trường input
      | label                      | value |
      | Phí/Giao dịch tối thiểu(đ) | 0.00  |

  @UngLuong @UL_79
  Scenario: Chọn phí giao dịch tối thiểu > phí giao dịch tối đa
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
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

  @UngLuong @UL_80
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

  @UngLuong @UL_81
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

  @UngLuong @UL_81
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

  @UngLuong @UL_82
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

  @UngLuong @UL_83
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

  @UngLuong @UL_84 @UL_85 @UL_86 @UL_87
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

  @UngLuong @UL_88
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
      | label                     | value         |
      | Tỷ lệ ứng trước lương (%) | valueNumber_1 |

  @UngLuong @UL_89
  Scenario Outline: Bỏ trống hoặc nhập tỷ lệ ứng trước lương bằng 0
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
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
      | date | value         |
      | 0    | valueNumber_1 |
      |      |               |

  @UngLuong @UL_90
  Scenario: Chọn tạm khóa ứng lương
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Chọn radio button ở nhiều field
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label        | value           |
      | Khóa tạm ứng | Có khóa tạm ứng |

  @UngLuong @UL_91
  Scenario: Chọn tạm khóa ứng lương
    And Truy cập theo menu
      | Doanh nghiệp |
      | Danh sách    |
    When Tìm kiếm với keyword và nhấn Enter
      | textBox          | key     |
      | Tên doanh nghiệp | Auto_DN |
    And Click Hành Động "Xem chi tiết"
    And Click button "Chỉnh sửa" in Doanh nghiep page
    And Chọn radio button ở nhiều field
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |
    And Click button "Cập nhật" bản ghi
    Then Hiển thị alert thành công
    When Refresh the web
    Then Button radio đã select
      | label        | value              |
      | Khóa tạm ứng | Không khóa tạm ứng |
