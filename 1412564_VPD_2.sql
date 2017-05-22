-- Trưởng dự án chỉ được phép đọc, ghi thông tin chi tiêu của dự án mình quản lý (VPD).
Create or replace function select_update_ChiTieu (p_schema varchar2, p_obj_schema varchar2)
  Return varchar2
  As
    v_user varchar2(6);
    v_maDA number;
Begin
    v_user := SYS_CONTEXT ('userenv', 'SESSION_USER');
    select maDA INTO v_maDA from DuAn  where TO_CHAR(truongDA) = user;
    return 'DUAN = ' || TO_CHAR(v_maDA);
End;

Begin
  DBMS_RLS.add_policy
  (object_schema   => 'bichtram',
   object_name     => 'ChiTieu',
   policy_name     => 'TruongDA_policy',
   policy_function => 'select_update_ChiTieu',
   statement_types => 'SELECT, UPDATE');
End;

Select * from bichtram.ChiTieu;