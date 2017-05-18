GRANT access_locations_dba TO tangliang;
-- Package dùng để tạo ra các thành phần của nhãn
GRANT execute ON sa_components TO tangliang;
-- Package dùng để tạo các nhãn
GRANT execute ON sa_label_admin TO tangliang;
-- Package dùng để gán chính sách cho các table/schema
GRANT execute ON sa_policy_admin TO tangliang;

GRANT access_locations_dba TO tangliang;
-- Package dùng để gán các label cho user
GRANT execute ON sa_user_admin TO tangliang;

select SYS_CONTEXT('userenv', 'SESSION_USER') from dual;

BEGIN
SA_SYSDBA.CREATE_POLICY (
policy_name => 'Access_DuAn',
column_name => 'OLS_DuAn');
END;

