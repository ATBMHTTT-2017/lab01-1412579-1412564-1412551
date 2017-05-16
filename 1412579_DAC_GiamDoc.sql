--Giám đốc
 CREATE VIEW GiamDoc_XemTatCaDuAn 
    AS SELECT DUAN.MADA, DUAN.TENDA, DUAN.KINHPHI, PHONGBAN.TENPHONG, CHINHANH.TENCN, NHANVIEN.HOTEN AS TruongDA
        FROM PHONGBAN, DUAN, CHINHANH, NHANVIEN 
        WHERE PHONGBAN.MAPHONG = DUAN.PHONGCHUTRI 
            AND PHONGBAN.CHINHANH = CHINHANH.MACN
            AND DUAN.TRUONGDA = NHANVIEN.MANV;


GRANT SELECT ON GiamDoc_XemTatCaDuAn To GiamDoc;