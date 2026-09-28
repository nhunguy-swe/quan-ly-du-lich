package com.example.quanlydulich.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "KHACH_HANG")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maKhachHang")
    private int maKhachHang;

    @Column(name = "hoTen")
    private String hoTen;

    @Column(name = "soDienThoai")
    private String soDienThoai;

    @Column(name = "email")
    private String email;

    @Column(name = "diaChi")
    private String diaChi;

    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<DangKyTour> danhSachDangKy;

    // Getters and Setters
    public int getMaKhachHang() { return maKhachHang; }
    public void setMaKhachHang(int maKhachHang) { this.maKhachHang = maKhachHang; }
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    public String getEmail() { return email; }
    public void setEmail(String email ) { this.email = email; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
}