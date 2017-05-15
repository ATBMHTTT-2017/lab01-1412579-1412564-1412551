
drop function nhanVien_SelectAll;
drop function nhanVien_Select;

Create or replace function nhanVien_SelectAll(p_schema
    varchar2, p_obj varchar2)
        Return varchar2
    As
    user VARCHAR2(100);
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
    select maPhong into v_maPhong from nhanvien where maNv = user;
    return 'maNV = ' || user || ' and maPhong = ' || v_maPhong;
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

