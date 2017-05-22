Create table NhanVien(
maNV number GENERATED ALWAYS as IDENTITY(START with 9999 INCREMENT by 1),
hoTen varchar2(50) NOT NULL,
diaChi varchar2(100) NOT NULL,
dienThoai number,
email varchar2(100),
maPhong number,
chiNhanh number,
luong number(20,2),
chucVu number(1,0)
);
--Chuc vu 0 là nhân viên, 1 là giám đống

Create table ChiNhanh(
maCN number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
tenCN varchar2(50) NOT NULL,
truongChiNhanh number NOT NULL
);


Create table PhongBan(
maPhong number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
tenPhong varchar2(50) NOT NULL,
truongPhong number NOT NULL,
ngayNhanChuc date,
soNhanVien number,
chiNhanh number NOT NULL
);

Create table  DuAn(
maDA number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
tenDA varchar2(50) NOT NULL,
kinhPhi number(20,2),
phongChuTri number,
truongDA number
);

Create table ChiTieu(
maChiTieu number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
tenChiTieu varchar2(50) NOT NULL,
soTien number(20,2),
duAn number NOT NULL
);


Create table PhanCong(
maNV number,
duAn number,
vaiTro varchar2(20),
phuCap number(20,2)
);

-------------------------------------------------
-- PRIMARY KEY
ALTER TABLE PhanCong
ADD CONSTRAINT PK_PhanCong
PRIMARY KEY(maNV, duAn);

ALTER TABLE ChiNhanh
ADD CONSTRAINT PK_ChiNhanh
PRIMARY KEY(maCN);

ALTER TABLE NhanVien
ADD CONSTRAINT PK_NhanVien
PRIMARY KEY(maNV);

ALTER TABLE PhongBan
ADD CONSTRAINT PK_PhongBan
PRIMARY KEY(maPhong);

ALTER TABLE DuAn
ADD CONSTRAINT PK_DuAn
PRIMARY KEY(maDA);

ALTER TABLE ChiTieu
ADD CONSTRAINT PK_ChiTieu
PRIMARY KEY(maChiTieu);

------------------------------------------------
--FK CHI NHÁNH - NHÂN VIÊN
ALTER TABLE ChiNhanh
ADD CONSTRAINT FK1_ChiNhanh_NhanVien 
FOREIGN KEY(truongChiNhanh) 
REFERENCES NhanVien(maNV);

--FK NHÂN VIÊN - PHÒNG BAN
ALTER TABLE NhanVien
ADD CONSTRAINT FK1_NhanVien_PhongBan 
FOREIGN KEY(maPhong) 
REFERENCES PhongBan(maPhong);

-- FK NHÂN VIÊN - CHI NHÁNH 
ALTER TABLE NhanVien
ADD CONSTRAINT FK2_NhanVien_ChiNhanh 
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN);

-- FK PHÒNG BAN
ALTER TABLE PhongBan
ADD CONSTRAINT FK1_PhongBan_ChiNhanh
FOREIGN KEY(chiNhanh) 
REFERENCES ChiNhanh(maCN);

ALTER TABLE PhongBan
ADD CONSTRAINT FK2_PhongBan_NhanVien 
FOREIGN KEY(truongPhong) 
REFERENCES NhanVien(maNV);

-- FK DỰ DÁN
ALTER TABLE DuAn
ADD CONSTRAINT FK1_DuAn_NhanVien
FOREIGN KEY(truongDA) 
REFERENCES NhanVien(maNV);

ALTER TABLE DuAn
ADD CONSTRAINT FK2_DuAn_PhongBan
FOREIGN KEY(PhongChuTri) 
REFERENCES PhongBan(maPhong);

-- FK CHI TIÊU
ALTER TABLE ChiTieu
ADD CONSTRAINT FK1_ChiTieu_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA);

-- FK PHÂN CÔNG
ALTER TABLE PhanCong
ADD CONSTRAINT FK1_PhanCong_DuAn 
FOREIGN KEY(duAn) 
REFERENCES DuAn(maDA);

ALTER TABLE PhanCong
ADD CONSTRAINT FK2_PhanCong_NhanVien
FOREIGN KEY(maNV) 
REFERENCES NhanVien(maNV);
