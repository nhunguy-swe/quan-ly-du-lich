package com.example.quanlydulich.controller;

import com.example.quanlydulich.entity.DangKyTour;
import com.example.quanlydulich.entity.KhachHang;
import com.example.quanlydulich.entity.TourDuLich;
import com.example.quanlydulich.service.DuLichService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequestMapping("/")
public class DuLichController {

    @Autowired
    private DuLichService duLichService;

    @GetMapping
    public String index(Model model) {
        return "index"; // Đi ngược ra ngoài thư mục webapp để tìm file index.jsp
    }

    // 1. Hiển thị Form Đăng ký Tour và tải danh sách ComboBox động
    @GetMapping("/register-form")
    public String showRegisterForm(Model model) {
        model.addAttribute("danhSachKhachHang", duLichService.getAllKhachHang());
        model.addAttribute("danhSachTour", duLichService.getAllTour());
        return "register-tour";
    }

    // 2. Xử lý lưu thông tin Đăng ký kèm thực hiện Validation dữ liệu theo yêu cầu
    @PostMapping("/save-registration")
    public String saveRegistration(@RequestParam("maKhachHang") int maKhachHang,
                                   @RequestParam("maTour") int maTour,
                                   @RequestParam("ngayDangKy") String ngayDangKyStr,
                                   @RequestParam("ngayKhoiHanh") String ngayKhoiHanhStr,
                                   @RequestParam("soNguoiThamGia") int soNguoi,
                                   Model model) {

        LocalDate ngayDangKy = LocalDate.parse(ngayDangKyStr);
        LocalDate ngayKhoiHanh = LocalDate.parse(ngayKhoiHanhStr);

        // --- VALIDATION LOGIC ---
        String errorMsg = null;
        if (ChronoUnit.DAYS.between(ngayDangKy, ngayKhoiHanh) < 3) {
            errorMsg = "Lỗi: Ngày khởi hành phải sau ngày đăng ký ít nhất 3 ngày!";
        } else if (soNguoi <= 0 || soNguoi >= 20) {
            errorMsg = "Lỗi: Số người tham gia phải là số nguyên dương lớn hơn 0 và nhỏ hơn 20!";
        }

        if (errorMsg != null) {
            model.addAttribute("errorMessage", errorMsg);
            model.addAttribute("danhSachKhachHang", duLichService.getAllKhachHang());
            model.addAttribute("danhSachTour", duLichService.getAllTour());
            return "register-tour"; // Trả lại view kèm thông báo lỗi cụ thể
        }

        // Nếu thông qua hết Validation, tiến hành lưu vào Database
        duLichService.registerTour(maKhachHang, maTour, ngayDangKy, ngayKhoiHanh, soNguoi);
        return "redirect:/search-form?success=true";
    }

    // 3. Form Tìm kiếm & Báo cáo thống kê
    @GetMapping("/search-form")
    public String showSearchForm(@RequestParam(value = "diemDen", required = false) String diemDen,
                                 @RequestParam(value = "ngayKhoiHanh", required = false) String ngayKhoiHanhStr,
                                 Model model) {

        LocalDate ngayKhoiHanh = (ngayKhoiHanhStr != null && !ngayKhoiHanhStr.isEmpty()) ? LocalDate.parse(ngayKhoiHanhStr) : null;

        // Thực hiện JOIN và lấy ra kết quả kèm cột tính tổng tiền
        List<DangKyTour> ketQua = duLichService.searchTours(diemDen, ngayKhoiHanh);

        model.addAttribute("ketQuaTimKiem", ketQua);
        model.addAttribute("diemDenCu", diemDen);
        model.addAttribute("ngayKhoiHanhCu", ngayKhoiHanhStr);
        return "search-tour-register";
    }

    // ==================== QUẢN LÝ KHÁCH HÀNG ====================

    // 1. Hiển thị form thêm khách hàng
    @GetMapping("/khach-hang/add-form")
    public String showAddKhachHangForm(Model model) {
        model.addAttribute("khachHang", new KhachHang()); // Giả sử Class Entity của bạn tên là KhachHang
        return "add-khach-hang"; // Sẽ tạo file add-khach-hang.jsp
    }

    // 2. Xử lý lưu khách hàng vào CSDL
    @PostMapping("/khach-hang/save")
    public String saveKhachHang(@ModelAttribute("khachHang") KhachHang khachHang) {
        duLichService.saveKhachHang(khachHang); // Hãy đảm bảo trong Service của bạn đã có hàm save này
        return "redirect:/register-form"; // Lưu xong quay về form đăng ký tour để xem kết quả
    }


// ==================== QUẢN LÝ CHUYẾN ĐI (TOUR) ====================

    // 3. Hiển thị form thêm chuyến đi
    @GetMapping("/add-form")
    public String showAddTourForm(Model model) {
        model.addAttribute("tour", new TourDuLich()); // Giả sử Class Entity của bạn tên là Tour
        return "add-tour"; // Sẽ tạo file add-tour.jsp
    }

    // 4. Xử lý lưu chuyến đi vào CSDL
    @PostMapping("/save")
    public String saveTour(@ModelAttribute("tour") TourDuLich tour) {
        duLichService.saveTour(tour); // Hãy đảm bảo trong Service của bạn đã có hàm save này
        return "redirect:/register-form"; // Lưu xong quay về form đăng ký tour
    }

    // ==================== TÌM KIẾM KHÁCH HÀNG ====================
    @GetMapping("/khach-hang/search")
    public String searchKhachHang(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<KhachHang> dsKhachHang;
        if (keyword != null && !keyword.trim().isEmpty()) {
            // Gọi service tìm kiếm theo tên hoặc số điện thoại
            dsKhachHang = duLichService.searchKhachHang(keyword);
        } else {
            dsKhachHang = duLichService.getAllKhachHang(); // Mặc định hiển thị tất cả nếu chưa tìm
        }
        model.addAttribute("dsKhachHang", dsKhachHang);
        model.addAttribute("keyword", keyword);
        return "search-khach-hang";
    }

    // ==================== TÌM KIẾM CHUYẾN ĐI (TOUR) ====================
    @GetMapping("/tour/search")
    public String searchTour(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<TourDuLich> dsTour;
        if (keyword != null && !keyword.trim().isEmpty()) {
            // Gọi service tìm kiếm theo tên tour hoặc điểm đến
            dsTour = duLichService.searchTour(keyword);
        } else {
            dsTour = duLichService.getAllTour();
        }
        model.addAttribute("dsTour", dsTour);
        model.addAttribute("keyword", keyword);
        return "search-tour";
    }
}
