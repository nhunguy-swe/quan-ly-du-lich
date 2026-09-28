package com.example.quanlydulich.entity;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "TOUR_DU_LICH")
public class TourDuLich {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maTour")
    private int maTour;

    @Column(name = "tenTour")
    private String tenTour;

    @Column(name = "diemKhoiHanh")
    private String diemKhoiHanh;

    @Column(name = "diemDen")
    private String diemDen;

    @Column(name = "giaTour")
    private double giaTour;

    @Column(name = "thoiGian")
    private int thoiGian;

    @OneToMany(mappedBy = "tourDuLich", fetch = FetchType.LAZY)
    private List<DangKyTour> danhSachDangKy;

    // Getters and Setters
    public int getMaTour() { return maTour; }
    public void setMaTour(int maTour) { this.maTour = maTour; }
    public String getTenTour() { return tenTour; }
    public void setTenTour(String tenTour) { this.tenTour = tenTour; }
    public String getDiemKhoiHanh() { return diemKhoiHanh; }
    public void setDiemKhoiHanh(String diemKhoiHanh) { this.diemKhoiHanh = diemKhoiHanh; }
    public String getDiemDen() { return diemDen; }
    public void setDiemDen(String diemDen) { this.diemDen = diemDen; }
    public double getGiaTour() { return giaTour; }
    public void setGiaTour(double giaTour) { this.giaTour = giaTour; }
    public int getThoiGian() { return thoiGian; }
    public void setThoiGian(int thoiGian) { this.thoiGian = thoiGian; }
}
