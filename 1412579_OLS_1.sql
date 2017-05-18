--Grant role OLS_DuAn_DBA 
GRANT OLS_DuAn_DBA TO tangliang;
-- Package dùng để tạo ra các thành phần của nhãn
GRANT execute ON sa_components TO tangliang;
-- Package dùng để tạo các nhãn
GRANT execute ON sa_label_admin TO tangliang;
-- Package dùng để gán chính sách cho các table/schema
GRANT execute ON sa_policy_admin TO tangliang;
-- Package dùng để gán các label cho user
GRANT execute ON sa_user_admin TO tangliang;

select SYS_CONTEXT('userenv', 'SESSION_USER') from dual;


--LBACSYS tạo POLICY

BEGIN
SA_SYSDBA.create_policy (
policy_name => 'OLS_DuAn',
column_name => 'OLS_Col_DuAn');
END;

BEGIN
SA_SYSDBA.drop_policy (
policy_name => 'OLS_DuAn');
END;

--create level 
EXEC SA_COMPONENTS.CREATE_LEVEL('OLS_DuAn', 4000, 'BMC', 'Bí mật cao');
EXEC SA_COMPONENTS.CREATE_LEVEL('OLS_DuAn', 3000, 'BM', 'Bí mật');
EXEC SA_COMPONENTS.CREATE_LEVEL('OLS_DuAn', 2000, 'GH', 'Giới hạn');
EXEC SA_COMPONENTS.CREATE_LEVEL('OLS_DuAn', 1000, 'TT', 'Thông thường');

--create compartment
EXEC SA_COMPONENTS.CREATE_COMPARTMENT('OLS_DuAn', 3000, 'NS', 'Nhân sự');
EXEC SA_COMPONENTS.CREATE_COMPARTMENT('OLS_DuAn', 2000, 'KT', 'Kế toán');
EXEC SA_COMPONENTS.CREATE_COMPARTMENT('OLS_DuAn', 1000, 'KH', 'Kế hoạch');

--create group
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 1, 'TCT', 'Tổng công ty', NULL);
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 2, 'HCM', 'Hồ Chí Minh', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 3, 'HN', 'Hà Nội', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 8, 'DN', 'Đà Nẵng', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 4, 'VT', 'Vũng Tàu', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 5, 'DNG', 'Đồng Nai', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 6, 'SEO', 'Seoul', 'TCT');
EXEC SA_COMPONENTS.CREATE_GROUP('OLS_DuAn', 7, 'HK', 'Hong Kong', 'TCT');


--create label

EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 210, 'GH:NS:HCM');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 200, 'GH:NS:HN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 190, 'GH:NS:DN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 180, 'GH:NS:VT');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 170, 'GH:NS:DNG');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 160, 'GH:NS:SEO');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 150, 'GH:NS:HK');

EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 140, 'GH:KT:HCM');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 130, 'GH:KT:HN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 120, 'GH:KT:DN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 110, 'GH:KT:VT');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 100, 'GH:KT:DNG');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 90, 'GH:KT:SEO');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 80, 'GH:KT:HK');

EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 70, 'GH:KH:HCM');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 60, 'GH:KH:HN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 50, 'GH:KH:DN');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 40, 'GH:KH:VT');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 30, 'GH:KH:DNG');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 20, 'GH:KH:SEO');
EXEC SA_LABEL_ADMIN.CREATE_LABEL('OLS_DuAn', 10, 'GH:KH:HK');

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:HCM');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:HN');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:DN');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:VT');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:HCM');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:DNG');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:SEO');
END;

BEGIN
sa_label_admin.drop_label
(policy_name => 'OLS_DuAn',
label_value => 'GH:NS:HK');
END;

--gán chính sách cho bảng dự án
EXEC SA_POLICY_ADMIN.APPLY_TABLE_POLICY('OLS_DuAn', 'tangliang', 'DUAN', 'NO_CONTROL');





