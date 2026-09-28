# HỆ THỐNG QUẢN LÝ TOUR DU LỊCH (Tour Travel Management)

<p>
  <img src="https://img.shields.io/badge/Java-17%2B-orange" alt="Java">
  <img src="https://img.shields.io/badge/Spring%20MVC-brightgreen" alt="Spring MVC">
  <img src="https://img.shields.io/badge/Hibernate-ORM-blue" alt="Hibernate">
  <img src="https://img.shields.io/badge/MySQL-Database-4479A1" alt="MySQL">
  <img src="https://img.shields.io/badge/Tomcat-10-yellow" alt="Tomcat 10">
</p>

## 1. Giới thiệu

Hệ thống Quản lý Tour Du lịch được xây dựng nhằm hỗ trợ đại lý lữ hành quản lý thông tin khách hàng, các tour du lịch và đăng ký tham gia tour.

Hệ thống cho phép:

- Quản lý thông tin khách hàng.
- Quản lý danh sách tour du lịch.
- Đăng ký tour cho khách hàng.
- Tìm kiếm tour theo điểm đến và ngày khởi hành.
- Thống kê chi phí dự kiến của khách hàng tham gia tour.

---

## 2. Công nghệ sử dụng

- Java 17+
- Spring MVC (Không sử dụng Spring Boot)
- Hibernate ORM
- MySQL
- JSP/JSTL
- Apache Tomcat 10
- Bootstrap 5
- Font Awesome
- Maven

---

## 3. Thiết kế cơ sở dữ liệu

### Bảng KHACH_HANG

| Tên cột     | Kiểu dữ liệu              | Mô tả         |
| ----------- | ------------------------- | ------------- |
| maKhachHang | INT (PK, AUTO_INCREMENT)  | Mã khách hàng |
| hoTen       | VARCHAR(100)                | Họ tên        |
| soDienThoai | VARCHAR(10)                   | Số điện thoại |
| email       | VARCHAR(100)                    | Email         |
| diaChi      | VARCHAR(255)                      | Địa chỉ       |

### Bảng TOUR_DU_LICH

| Tên cột      | Kiểu dữ liệu              | Mô tả          |
| ------------ | ------------------------- | -------------- |
| maTour       | INT (PK, AUTO_INCREMENT)  | Mã tour        |
| tenTour      | VARCHAR(150)                | Tên tour       |
| diemKhoiHanh | VARCHAR(100)                  | Điểm khởi hành |
| diemDen      | VARCHAR(100)                    | Điểm đến       |
| giaTour      | BIGINT                           | Giá tour       |
| thoiGian     | INT                                | Số ngày        |

### Bảng DANG_KY_TOUR

| Tên cột        | Kiểu dữ liệu              | Mô tả             |
| -------------- | ------------------------- | ----------------- |
| maDangKy       | INT (PK, AUTO_INCREMENT)  | Mã đăng ký        |
| maKhachHang    | INT (FK)                    | Khách hàng        |
| maTour         | INT (FK)                     | Tour              |
| ngayDangKy     | DATE                           | Ngày đăng ký      |
| ngayKhoiHanh   | DATE                            | Ngày khởi hành    |
| soNguoiThamGia | INT                               | Số người tham gia |

---

## 4. Quan hệ dữ liệu

**KHACH_HANG → DANG_KY_TOUR** (một khách hàng có thể đăng ký nhiều tour):
```java
@OneToMany(mappedBy = "khachHang")
private List<DangKyTour> dangKyTours;
```

**TOUR_DU_LICH → DANG_KY_TOUR** (một tour có thể có nhiều khách hàng đăng ký):
```java
@OneToMany(mappedBy = "tourDuLich")
private List<DangKyTour> dangKyTours;
```

**DANG_KY_TOUR → KHACH_HANG:**
```java
@ManyToOne
@JoinColumn(name = "maKhachHang")
private KhachHang khachHang;
```

**DANG_KY_TOUR → TOUR_DU_LICH:**
```java
@ManyToOne
@JoinColumn(name = "maTour")
private TourDuLich tourDuLich;
```

---

## 5. Dữ liệu mẫu

> Dữ liệu bên dưới là dữ liệu **giả định** để test/demo, không phải thông tin khách hàng thật.

**KHACH_HANG (mẫu):**

| Họ tên       | Số điện thoại |
| ------------ | ------------- |
| Nguyễn Văn A | 0912345678    |
| Trần Thị B   | 0987654321    |
| Lê Văn C     | 0901234567    |
| Phạm Thị D   | 0971111222    |
| Hoàng Văn E  | 0933333444    |

**TOUR_DU_LICH (mẫu):**

| Tên tour       | Điểm đến  | Giá tour |
| -------------- | --------- | -------- |
| Đà Nẵng 3N2Đ   | Đà Nẵng   | 3500000  |
| Nha Trang 4N3Đ | Nha Trang | 4500000  |
| Phú Quốc 3N2Đ  | Phú Quốc  | 5500000  |
| Đà Lạt 2N1Đ    | Đà Lạt    | 2500000  |
| Sapa 3N2Đ      | Sapa      | 3900000  |

---

## 6. Chức năng Đăng ký Tour

**Form đăng ký:** Khách hàng, Tour du lịch, Ngày đăng ký, Ngày khởi hành, Số người tham gia.

**ComboBox Khách hàng** — load từ `KHACH_HANG`:
```jsp
<form:select path="maKhachHang">
    <form:options
        items="${khachHangList}"
        itemValue="maKhachHang"
        itemLabel="hoTen"/>
</form:select>
```

**ComboBox Tour** — load từ `TOUR_DU_LICH`:
```jsp
<form:select path="maTour">
    <form:options
        items="${tourList}"
        itemValue="maTour"
        itemLabel="tenTour"/>
</form:select>
```

### Validation

**Bắt buộc nhập** (tất cả trường):
```java
@NotNull
private Integer maTour;
```

**Ngày khởi hành:** phải sau ngày đăng ký ít nhất 3 ngày.
```java
if (ngayKhoiHanh.isBefore(ngayDangKy.plusDays(3))) {
    errors.rejectValue("ngayKhoiHanh", "error.ngayKhoiHanh");
}
```
| Ngày đăng ký | Ngày khởi hành | Kết quả      |
| ------------ | -------------- | ------------ |
| 01/06/2026   | 05/06/2026     | Hợp lệ       |
| 01/06/2026   | 03/06/2026     | Không hợp lệ |

**Số người tham gia:** `0 < soNguoiThamGia < 20`
```java
@Min(1)
@Max(19)
private Integer soNguoiThamGia;
```
- Hợp lệ: `1`, `5`, `10`, `19`
- Không hợp lệ: `0`, `20`, `25`

---

## 7. Chức năng tìm kiếm & thống kê

**Tìm theo:** Điểm đến, Ngày khởi hành. Ví dụ: Điểm đến `Đà Nẵng`, Ngày khởi hành `15/07/2026`.

**Kết quả hiển thị:** Tên khách hàng, Số điện thoại, Tên tour, Điểm đến, Ngày khởi hành, Số người tham gia, Giá tour, Tổng chi phí dự kiến.

**Công thức:** `Tổng chi phí = soNguoiThamGia × giaTour`
```
5 × 3.500.000 = 17.500.000 VNĐ
```

### Truy vấn JOIN 3 bảng

**SQL:**
```sql
SELECT kh.hoTen, kh.soDienThoai, td.tenTour, td.diemDen,
       dk.ngayKhoiHanh,
       (dk.soNguoiThamGia * td.giaTour) AS tongChiPhi
FROM DANG_KY_TOUR dk
INNER JOIN KHACH_HANG kh ON dk.maKhachHang = kh.maKhachHang
INNER JOIN TOUR_DU_LICH td ON dk.maTour = td.maTour
WHERE td.diemDen LIKE '%?%'
AND dk.ngayKhoiHanh = ?;
```

**HQL:**
```
SELECT dk
FROM DangKyTour dk
JOIN dk.khachHang kh
JOIN dk.tourDuLich td
WHERE td.diemDen LIKE :diemDen
AND dk.ngayKhoiHanh = :ngayKhoiHanh
```

---

## 8. Kiến trúc dự án

```
src/main/java
│
├── controller
│   ├── DangKyTourController
│   └── SearchController
│
├── entity
│   ├── KhachHang
│   ├── TourDuLich
│   └── DangKyTour
│
├── dao
│   ├── KhachHangDAO
│   ├── TourDuLichDAO
│   └── DangKyTourDAO
│
├── service
│   └── DangKyTourService
│
├── validator
│   └── DangKyTourValidator
│
└── config
    ├── WebConfig
    ├── HibernateConfig
    └── AppInitializer
```

---

## 9. Giao diện

Yêu cầu: Bootstrap 5, Font Awesome, Responsive Design.

**Dashboard:** Tổng số khách hàng, Tổng số tour, Tổng số đăng ký.

**Đăng ký tour:** Thêm đăng ký mới, Danh sách đăng ký.

**Tìm kiếm:** Theo điểm đến, Theo ngày khởi hành.

---

## 10. Yêu cầu kỹ thuật

- **Framework:** Spring MVC thuần
- **ORM:** Hibernate SessionFactory
- **Database:** MySQL
- **Server:** Apache Tomcat 10
- **Coding Convention:** PascalCase cho Class, camelCase cho biến, `Controller → Service → DAO → Entity`

---

## Bắt đầu (Getting Started)

### Yêu cầu

- JDK 17+
- MySQL
- Apache Tomcat 10
- IDE: IntelliJ IDEA / Eclipse

### Cài đặt

```bash
git clone https://github.com/nhunguy-swe/tour-travel-management.git
cd tour-travel-management
```

### Cấu hình Database

1. Tạo các bảng `KHACH_HANG`, `TOUR_DU_LICH`, `DANG_KY_TOUR` theo thiết kế ở trên (chạy script SQL nếu có trong thư mục `database/`).
2. Cập nhật thông tin kết nối trong `HibernateConfig.java`.

> ⚠️ Không hard-code mật khẩu database trực tiếp trong code nếu push lên GitHub public — dùng biến môi trường hoặc file cấu hình đã thêm vào `.gitignore`.

### Chạy ứng dụng

```bash
mvn clean install
```

Deploy file `.war` lên **Apache Tomcat 10**, truy cập tại `http://localhost:8080/tour-travel-management/`.

---

## 11. Kết luận

Hệ thống đáp ứng đầy đủ các yêu cầu: Quản lý Khách hàng · Quản lý Tour du lịch · Đăng ký Tour · ComboBox load dữ liệu từ CSDL · Validation ngày khởi hành · Validation số người tham gia · Truy vấn JOIN 3 bảng · Tính tổng chi phí dự kiến · Spring MVC thuần · Hibernate SessionFactory · MySQL · Tomcat 10 · Bootstrap + Font Awesome · Tuân thủ Java Coding Convention

---

## Tác giả

- GitHub: [@nhunguy-swe](https://github.com/nhunguy-swe)

---

## Giấy phép

Dự án này được thực hiện cho mục đích học tập/ôn thi cá nhân.