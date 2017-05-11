
--reset identity
ALTER TABLE CHINHANH MODIFY(ID Generated as Identity (START WITH 1));

INSERT ALL
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Vũ Minh Trí','Q12, HCM','0973178325','itvmtri@gmail.com', 1, 1, 69696969,1)
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Vũ Thị Minh Trang','Q12, HCM','0909697895','vtmtrang@gmail.com', 2, 2, 9999999,0)
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Đặng Bảo Trang','Quận Thủ Đức, HCM','0167627489','dbtrang@gmail.com', 2, 3, 23698712,0)
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Nguyễn Đang Tích','Q2, HCM','0888999777','ndtich@gmail.com', 3, 3, 19999999,0)
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Trần Thuỳ Bích Trầm','Q12, HCM','0123456789','ttbtram@gmail.com', 4, 4, 9999999,0)
INSERT INTO NHANVIEN(HOTEN, DIACHI, DIENTHOAI, EMAIL, MAPHONG, CHINHANH, LUONG,CHUCVU) VALUES('Hoàng Anh Tú','Q1, HCM','0999999999','hatu@gmail.com', 5, 5, 199999999,0)
SELECT * FROM dual;

INSERT ALL
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('TPHCM',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Hà Nội',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Đà Nẵng',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Vũng Tàu',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Đồng Nai',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Seoul',10002)
INSERT INTO CHINHANH(TENCN,TRUONGCHINHANH) VALUES ('Hong Kong',10002)
SELECT * FROM dual;

INSERT ALL
INSERT INTO PHONGBAN(TENPHONG,TRUONGPHONG,NGAYNHANCHUC,SONHANVIEN,CHINHANH) VALUES ('Giám đốc',10002,TO_DATE('2017/01/01','yyyy/mm/dd'),1,1)
INSERT INTO PHONGBAN(TENPHONG,TRUONGPHONG,NGAYNHANCHUC,SONHANVIEN,CHINHANH) VALUES ('Nhân sự',10002,TO_DATE('2017/01/01','yyyy/mm/dd'),1,2)
INSERT INTO PHONGBAN(TENPHONG,TRUONGPHONG,NGAYNHANCHUC,SONHANVIEN,CHINHANH) VALUES ('Kế toán',10002,TO_DATE('2017/01/01','yyyy/mm/dd'),1,3)
INSERT INTO PHONGBAN(TENPHONG,TRUONGPHONG,NGAYNHANCHUC,SONHANVIEN,CHINHANH) VALUES ('Kế hoạch',10002,TO_DATE('2017/01/01','yyyy/mm/dd'),1,4)
INSERT INTO PHONGBAN(TENPHONG,TRUONGPHONG,NGAYNHANCHUC,SONHANVIEN,CHINHANH) VALUES ('Nghiên cứu',10002,TO_DATE('2017/01/01','yyyy/mm/dd'),1,5)
SELECT * FROM dual;

INSERT ALL
INSERT INTO DUAN(TENDA,KINHPHI,PHONGCHUTRI,TRUONGDA) VALUES ('Tạo đột biến gen ở loài vịt',99999999999,1,10002)
INSERT INTO DUAN(TENDA,KINHPHI,PHONGCHUTRI,TRUONGDA) VALUES ('Tạo đột biến gen ở loài chó',999999342399,2,10002)
INSERT INTO DUAN(TENDA,KINHPHI,PHONGCHUTRI,TRUONGDA) VALUES ('Tạo đột biến gen ở loài khỉ',999923499,3,10002)
INSERT INTO DUAN(TENDA,KINHPHI,PHONGCHUTRI,TRUONGDA) VALUES ('Tạo đột biến gen ở loài dơi',99912312999,4,10002)
INSERT INTO DUAN(TENDA,KINHPHI,PHONGCHUTRI,TRUONGDA) VALUES ('Kết hợp gen của người và alien',9945645654999,5,10002)
SELECT * FROM dual;

INSERT ALL
INSERT INTO PHANCONG values(10012,1,'Nghiên cứu sinh',5000000)
INSERT INTO PHANCONG values(10013,2,'Giáo sư hướng dẫn',5000000)
INSERT INTO PHANCONG values(10014,3,'Tiến sĩ',5000000)
INSERT INTO PHANCONG values(10015,4,'Trưởng dự án',5000000)
INSERT INTO PHANCONG values(10016,5,'Phụ tá kỹ thuật',5000000)
SELECT * FROM dual;

INSERT ALL
INSERT INTO CHITIEU(TENCHITIEU,SOTIEN,DUAN) VALUES('Top 1 thế giới',9999999999,1)
INSERT INTO CHITIEU(TENCHITIEU,SOTIEN,DUAN) VALUES('Top 2 thế giới',5654646,2)
INSERT INTO CHITIEU(TENCHITIEU,SOTIEN,DUAN) VALUES('Top 3 thế giới',543634564,3)
INSERT INTO CHITIEU(TENCHITIEU,SOTIEN,DUAN) VALUES('Top 4 thế giới',45362345,4)
INSERT INTO CHITIEU(TENCHITIEU,SOTIEN,DUAN) VALUES('Top 5 thế giới',100098766,5)
SELECT * FROM dual;