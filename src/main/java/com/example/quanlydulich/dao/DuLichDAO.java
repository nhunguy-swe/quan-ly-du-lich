package com.example.quanlydulich.dao;

import com.example.quanlydulich.entity.KhachHang;
import com.example.quanlydulich.entity.TourDuLich;
import com.example.quanlydulich.entity.DangKyTour;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public class DuLichDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<KhachHang> getAllKhachHang() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from KhachHang", KhachHang.class).getResultList();
    }

    public List<TourDuLich> getAllTour() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from TourDuLich", TourDuLich.class).getResultList();
    }

    public KhachHang getKhachHangById(int id) {
        return sessionFactory.getCurrentSession().get(KhachHang.class, id);
    }

    public TourDuLich getTourById(int id) {
        return sessionFactory.getCurrentSession().get(TourDuLich.class, id);
    }

    public void saveDangKy(DangKyTour dangKy) {
        sessionFactory.getCurrentSession().persist(dangKy);
    }

    // Xử lý truy vấn JOIN 3 bảng để Tìm kiếm và Thống kê nâng cao
    public List<DangKyTour> searchDangKy(String diemDen, LocalDate ngayKhoiHanh) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "SELECT dk FROM DangKyTour dk " +
                "JOIN FETCH dk.khachHang " +
                "JOIN FETCH dk.tourDuLich t " +
                "WHERE (:diemDen IS NULL OR t.diemDen LIKE :diemDen) " +
                "AND (:ngayKhoiHanh IS NULL OR dk.ngayKhoiHanh = :ngayKhoiHanh)";

        Query<DangKyTour> query = session.createQuery(hql, DangKyTour.class);
        query.setParameter("diemDen", (diemDen == null || diemDen.isEmpty()) ? null : "%" + diemDen + "%");
        query.setParameter("ngayKhoiHanh", ngayKhoiHanh);

        return query.getResultList();
    }

    // Thêm hàm lưu Khách hàng vào Database
    public void saveKhachHang(KhachHang khachHang) {
        sessionFactory.getCurrentSession().persist(khachHang);
    }

    // Thêm hàm lưu Chuyến đi (Tour) vào Database
    public void saveTour(TourDuLich tour) { // Hãy kiểm tra lại nếu class Entity của bạn đặt tên là Tour hoặc TourDuLich
        sessionFactory.getCurrentSession().persist(tour);
    }

    public List<KhachHang> searchKhachHang(String keyword) {
        String hql = "FROM KhachHang WHERE hoTen LIKE :keyword OR soDienThoai LIKE :keyword";
        return sessionFactory.getCurrentSession()
                .createQuery(hql, KhachHang.class)
                .setParameter("keyword", "%" + keyword + "%")
                .getResultList();
    }

    public List<TourDuLich> searchTour(String keyword) {
        String hql = "FROM TourDuLich WHERE tenTour LIKE :keyword OR diemDen LIKE :keyword";
        return sessionFactory.getCurrentSession()
                .createQuery(hql, TourDuLich.class)
                .setParameter("keyword", "%" + keyword + "%")
                .getResultList();
    }
}
