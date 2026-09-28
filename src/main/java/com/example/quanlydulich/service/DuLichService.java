package com.example.quanlydulich.service;

import com.example.quanlydulich.dao.DuLichDAO;
import com.example.quanlydulich.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class DuLichService {

    @Autowired
    private DuLichDAO duLichDAO;

    public List<KhachHang> getAllKhachHang() { return duLichDAO.getAllKhachHang(); }
    public List<TourDuLich> getAllTour() { return duLichDAO.getAllTour(); }

    public void registerTour(int maKhachHang, int maTour, LocalDate ngayDangKy, LocalDate ngayKhoiHanh, int soNguoi) {
        DangKyTour dk = new DangKyTour();
        dk.setKhachHang(duLichDAO.getKhachHangById(maKhachHang));
        dk.setTourDuLich(duLichDAO.getTourById(maTour));
        dk.setNgayDangKy(ngayDangKy);
        dk.setNgayKhoiHanh(ngayKhoiHanh);
        dk.setSoNguoiThamGia(soNguoi);
        duLichDAO.saveDangKy(dk);
    }

    public List<DangKyTour> searchTours(String diemDen, LocalDate ngayKhoiHanh) {
        return duLichDAO.searchDangKy(diemDen, ngayKhoiHanh);
    }

    // Thêm hàm dịch vụ lưu Khách hàng (Nhớ có @Transactional nếu đầu lớp chưa khai báo)
    public void saveKhachHang(KhachHang khachHang) {
        duLichDAO.saveKhachHang(khachHang); // Gọi sang hàm vừa viết ở DAO
    }

    // Thêm hàm dịch vụ lưu Chuyến đi
    public void saveTour(TourDuLich tour) { // Kiểm tra lại tên kiểu dữ liệu Tour hay TourDuLich cho khớp Entity của bạn
        duLichDAO.saveTour(tour); // Gọi sang hàm vừa viết ở DAO
    }

    public List<KhachHang> searchKhachHang(String keyword) {
        return duLichDAO.searchKhachHang(keyword);
    }

    public List<TourDuLich> searchTour(String keyword) {
        return duLichDAO.searchTour(keyword);
    }
}