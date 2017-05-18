--Create Role với chi tiết từ DAC (thêm bớt sau nếu có thể)
CREATE ROLE TruongPhong IDENTIFIED BY NeuCan; 
CREATE ROLE GiamDoc IDENTIFIED BY NeuCan; 
CREATE ROLE TruongChiNhanh IDENTIFIED BY NeuCan; 
CREATE ROLE NhanVien IDENTIFIED BY NeuCan; 
CREATE ROLE TruongDuAn IDENTIFIED BY NeuCan; 

--Grant các quyền cho Role
--Trưởng phòng
GRANT INSERT, UPDATE ON DUAN TO TruongPhong;
GRANT EXECUTE ON capNhatPhongBan TO TruongPhong;

GRANT SELECT ON DUAN TO GiamDoc
GRANT SELECT ON PHONGBAN TO GiamDoc
GRANT SELECT ON CHINHANH TO GiamDoc
GRANT SELECT ON CHITIEU TO GiamDoc