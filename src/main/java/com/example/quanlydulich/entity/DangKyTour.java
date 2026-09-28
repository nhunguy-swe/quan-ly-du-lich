package com.example.quanlydulich.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "DANG_KY_TOUR")
public class DangKyTour {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maDangKy")
    private int maDangKy;

    @ManyToOne
    @JoinColumn(name = "maKhachHang", nullable = false)
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "maTour", nullable = false)
    private TourDuLich tourDuLich;

    @Column(name = "ngayDangKy")
    private LocalDate ngayDangKy;

    @Column(name = "ngayKhoiHanh")
    private LocalDate ngayKhoiHanh;

    @Column(name = "soNguoiThamGia")
    private int soNguoiThamGia;

    // Getters and Setters
    public int getMaDangKy() { return maDangKy; }
    public void setMaDangKy(int maDangKy) { this.maDangKy = maDangKy; }
    public KhachHang getKhachHang() { return khachHang; }
    public void setKhachHang(KhachHang khachHang) { this.khachHang = khachHang; }
    public TourDuLich getTourDuLich() { return tourDuLich; }
    public void setTourDuLich(TourDuLich tourDuLich) { this.tourDuLich = tourDuLich; }
    public LocalDate getNgayDangKy() { return ngayDangKy; }
    public void setNgayDangKy(LocalDate ngayDangKy) { this.ngayDangKy = ngayDangKy; }
    public LocalDate getNgayKhoiHanh() { return ngayKhoiHanh; }
    public void setNgayKhoiHanh(LocalDate ngayKhoiHanh) { this.ngayKhoiHanh = ngayKhoiHanh; }
    public int getSoNguoiThamGia() { return soNguoiThamGia; }
    public void setSoNguoiThamGia(int soNguoiThamGia) { this.soNguoiThamGia = soNguoiThamGia; }
}
