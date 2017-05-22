-- Chỉ trưởng phòng, trưởng chi nhánh được cấp quyền thực thi stored procedure cập nhật thông tin phòng ban của mình (DAC).
-- Store cập nhật Phòng ban cho Trưởng chi nhánh --
Create or replace procedure capNhatPhongBan_TruongCN (
maPhong_CN in number, u_tenPhong in varchar2, u_truongPhong in number, u_ngayNC in date, u_soNV in number)
As
  v_count number;
Begin
  select count(*) into v_count from ChiNhanh where truongChiNhanh = USER;
  if (v_count > 0) then
  begin
    update PhongBan
    set tenPhong = u_tenPhong, truongPhong = u_truongPhong, ngayNhanChuc = u_ngayNC, soNhanVien = u_soNV
    where chiNhanh in (select maCN from ChiNhanh where truongChiNhanh = USER) and maPhong = maPhong_CN;
  end;
  end if;
  commit;
End;

Execute bichtram.CapNhatPhongBan_TruongCN(7,'Điều hành',10033,TO_DATE('2017/01/01','yyyy/mm/dd'),5);

-- Store cập nhật Phòng ban cho Trưởng phòng --
Create or replace procedure capNhatPhongBan_TruongPhong (u_tenPhong in varchar2, u_soNV in number)
As
  v_count number;
Begin
  select count(*) into v_count from PhongBan where truongPhong = USER;
  if (v_count > 0) then
  begin
    update PhongBan
    set tenPhong = u_tenPhong, soNhanVien = u_soNV
    where maPhong in (select maPhong from PhongBan where truongPhong = USER);
  end;
  end if;
  commit;
End;

Execute bichtram.CapNhatPhongBan_TruongPhong('Tiếp thị',9);
