-- Not working

CREATE USER "10016" IDENTIFIED BY 1  
grant connect, resource, dba to "10016";

alter session set "_oracle_script"=true;
drop user "10016" cascade;
drop function nhanVien_SelectAll;
drop function nhanVien_Select;

Create or replace function nhanVien_Select(p_schema
    varchar2, p_obj varchar2)
        Return varchar2
    As
    user number;
Begin
    user := SYS_CONTEXT('userenv', 'SESSION_USER');
    return 'maNV = ' || user ;
End;


Create or replace function nhanVien_Select(p_schema
    varchar2, p_obj varchar2)
        Return varchar2
    As
    user number;
    v_maPhong number;
Begin
    user := SYS_CONTEXT('userenv', 'SESSION_USER');
    --v_maPhong := SYS_CONTEXT('emp_env', 'v_maPhong_NV');
    select maPhong into v_maPhong from nhanvien where maNV = user;
    --return 'maNV = ' || user || ' and maPhong = ' || v_maPhong;
    return 'maPhong = ' || v_maPhong;
End;

Create or replace function nhanVien_Select(p_schema
    varchar2, p_obj varchar2)
        Return varchar2
    As
    user VARCHAR2(100);
    v_maPhong number;
Begin
    user := SYS_CONTEXT('userenv', 'SESSION_USER');
    v_maPhong := SYS_CONTEXT('emp_env', 'v_maPhong_NV');
    return 'maNV = ' || user || ' and maPhong = ' || v_maPhong;
End;

Create or replace function nhanVien_Select(p_schema
    varchar2, p_obj varchar2)
        Return varchar2
    as
    PRAGMA AUTONOMOUS_TRANSACTION;
    user number;
    mphong number;
    temp VARCHAR2(20);
BEGIN
    user:=SYS_CONTEXT('userenv','SESSION_USER');
    SELECT maPhong INTO mphong FROM nhanvien WHERE maNV=user;
    temp := 'maPhong =' || TO_CHAR(mphong);
    RETURN temp;
END;

desc DBA_AUDIT_POLICIES
execute 
begin dbms_rls.add_policy (object_schema => 'tangliang',
    object_name => 'NHANVIEN',
    policy_name => 'nhanVien_Select_Owner_Policy',
    function_schema => 'tangliang',
    policy_function => 'nhanVien_Select',
    sec_relevant_cols => 'LUONG',
    sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
end;

begin dbms_rls.add_policy (object_schema => 'tangliang',
    object_name => 'NHANVIEN',
    policy_name => 'SelectAll_Owner_Policy',
    function_schema => 'tangliang',
    policy_function => 'nhanVien_SelectAll',
    sec_relevant_cols => 'LUONG',
    sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
end;
    
select * from tangliang.nhanvien

Begin dbms_rls.drop_policy
    (object_schema => 'tangliang',
    object_name => 'NHANVIEN',
    policy_name => 'nhanVien_Select_Owner_Policy');
END;

Begin dbms_rls.drop_policy
    (object_schema => 'tangliang',
    object_name => 'NHANVIEN',
    policy_name => 'SelectAll_Owner_Policy');
END;

drop package setMaPhongNV

CREATE OR REPLACE PACKAGE setMaPhongNV IS
    PROCEDURE setMaPhong;
END;

Create or replace package body setMaPhongNV IS
    procedure setMaPhong IS
    v_maPhong_NV number;
    begin
    select MAPHONG into v_maPhong_NV from tangliang.nhanvien
    where manv = SYS_CONTEXT('USERENV', 'SESSION_USER');
    DBMS_SESSION.SET_CONTEXT('emp_env', 'v_maPhong_NV', v_maPhong_NV);
    end;
End;

Create or replace Context emp_env Using setMaPhongNV;

drop trigger trg_getMaPhong

create or replace Trigger trg_getMaPhong After Logon On Database
    Begin
        setMaPhongNV.setMaPhong;
    End;
    
select * from nhanvien

-- Trưởng phòng chỉ được phép đọc thông tin chi tiêu của dự án trong phòng ban mình quản lý. Với những dự án không thuộc phòng ban của mình, các trưởng phòng được phép xem thông tin chi tiêu nhưng không được phép xem số tiền cụ thể (VPD). 
--Worked
CREATE OR REPLACE FUNCTION ChiTieu_TruongPhong (
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 
AS
duan_chitieu number;
user number;
pchutri number;
BEGIN
  user := SYS_CONTEXT('userenv', 'SESSION_USER');
  Select maPhong into pchutri from PhongBan where user = truongPhong;
  if (pchutri < 0) then
  RETURN '';
  ELSE
    BEGIN
    select MADA INTO duan_chitieu from DUAN where phongchutri = pchutri;
    RETURN 'DUAN='|| q'[']' || duan_chitieu || q'[']';
    END;
  END IF;
EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;

BEGIN
DBMS_RLS.add_policy
(object_schema => 'tangliang',
object_name => 'ChiTieu',
policy_name => 'ChiTieu_TruongPhong',
function_schema => 'tangliang',
policy_function => 'ChiTieu_TruongPhong',
statement_types => 'SELECT',
sec_relevant_cols => 'SOTIEN',
sec_relevant_cols_opt=>dbms_rls.ALL_ROWS);
END;

BEGIN
DBMS_RLS.drop_policy
(object_schema => 'tangliang',
object_name => 'chitieu',
policy_name => 'ChiTieu_TruongPhong');
END;




