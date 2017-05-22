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
EXEC SA_POLICY_ADMIN.APPLY_TABLE_POLICY('OLS_DuAn', 'tangliang', 'DUAN', 'READ_CONTROL');
EXEC SA_POLICY_ADMIN.APPLY_TABLE_POLICY('OLS_DuAn', 'tangliang', 'DUAN', 'NO_CONTROL');
EXEC SA_POLICY_ADMIN.REMOVE_TABLE_POLICY('OLS_DuAn', 'tangliang', 'DUAN');

-- Grant quyền cho các trưởng phòng (NS,KT,KH) ở các chi nhánh khác nhau (7 chi nhánh x 3 phòng)
grant select, update, insert on duan to "10001";
grant select, update, insert on duan to "10002";
grant select, update, insert on duan to "10003";
grant select, update, insert on duan to "10004";
grant select, update, insert on duan to "10005";
grant select, update, insert on duan to "10027";
grant select, update, insert on duan to "10028";
grant select, update, insert on duan to "10029";
grant select, update, insert on duan to "10030";
grant select, update, insert on duan to "10031";
grant select, update, insert on duan to "10032";
grant select, update, insert on duan to "10033";
grant select, update, insert on duan to "10034";
grant select, update, insert on duan to "10035";
grant select, update, insert on duan to "10036";
grant select, update, insert on duan to "10037";
grant select, update, insert on duan to "10038";
grant select, update, insert on duan to "10039";
grant select, update, insert on duan to "10040";
grant select, update, insert on duan to "10041";
grant select, update, insert on duan to "10042";
grant select, update, insert on duan to "10043";
grant select, update, insert on duan to "10044";

-- Trưởng phòng được phép đọc dữ liệu dự án của tất cả phòng ban nhưng chỉ được phép ghi dữ liệu dự án thuộc phòng của mình.

--Gán nhãn theo các phòng thuộc các chi nhánh
--chi nhánh HCM
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:HCM')
where phongChuTri = 2;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:HCM')
where phongChuTri = 3;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:HCM')
where phongChuTri = 4;

--chi nhánh HN
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:HN')
where phongChuTri = 6;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:HN')
where phongChuTri = 7;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:HN')
where phongChuTri = 8;

--chi nhánh DN
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:DN')
where phongChuTri = 9;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:DN')
where phongChuTri = 10;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:DN')
where phongChuTri = 11;

--chi nhánh VT
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:VT')
where phongChuTri = 12;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:VT')
where phongChuTri = 13;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:VT')
where phongChuTri = 14;

--chi nhánh DNG
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:DNG')
where phongChuTri = 15;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:DNG')
where phongChuTri = 16;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:DNG')
where phongChuTri = 17;

--chi nhánh SEO
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:SEO')
where phongChuTri = 18;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:SEO')
where phongChuTri = 19;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:SEO')
where phongChuTri = 20;

--chi nhánh HK
update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:NS:HK')
where phongChuTri = 21;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KT:HK')
where phongChuTri = 22;

update tangliang.DUAN
set OLS_Col_DuAn = CHAR_TO_LABEL('OLS_DuAn', 'GH:KH:HK')
where phongChuTri = 23;

-- gán level cho user trưởng phòng của các phòng thuộc chi nhánh
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10002', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10003', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10004', 'BM', 'GH', 'BM', 'BM');

EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10027', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10028', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10029', 'BM', 'GH', 'BM', 'BM');

EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10030', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10031', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10032', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10033', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10034', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10035', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10036', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10037', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10038', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10039', 'BM', 'GH', 'BM', 'BM');

EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10040', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10041', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10042', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10043', 'BM', 'GH', 'BM', 'BM');
EXEC SA_USER_ADMIN.SET_LEVELS ('OLS_DuAn', '10044', 'BM', 'GH', 'BM', 'BM');

--Gán compartment cho user trưởng phòng. 
--(Mỗi thằng trưởng phòng chỉ được đọc các dự án phòng khác, và chỉ được ghi phòng mình)
--Phòng nhân sự
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10002',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10027',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10030',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10033',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10036',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10039',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10042',read_comps => 'NS,KT,KH',write_comps => 'NS',def_comps => 'NS',row_comps => 'NS');
--phòng kế toán
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10003',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10028',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10031',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10034',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10037',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10040',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10043',read_comps => 'NS,KT,KH',write_comps => 'KT',def_comps => 'KT',row_comps => 'KT');
--phòng kế hoạch
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10004',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10029',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10032',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10035',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10038',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10041',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');
EXEC SA_USER_ADMIN.SET_COMPARTMENTS(policy_name => 'OLS_DuAn',user_name => '10044',read_comps => 'NS,KT,KH',write_comps => 'KH',def_comps => 'KH',row_comps => 'KH');

--gán group cho các user
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10002',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HCM',def_groups => 'HCM',row_groups => 'HCM');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10003',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HCM',def_groups => 'HCM',row_groups => 'HCM');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10004',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HCM',def_groups => 'HCM',row_groups => 'HCM');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10027',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HN',def_groups => 'HN',row_groups => 'HN');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10028',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HN',def_groups => 'HN',row_groups => 'HN');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10029',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HN',def_groups => 'HN',row_groups => 'HN');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10030',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DN',def_groups => 'DN',row_groups => 'DN');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10031',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DN',def_groups => 'DN',row_groups => 'DN');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10032',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DN',def_groups => 'DN',row_groups => 'DN');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10033',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'VT',def_groups => 'VT',row_groups => 'VT');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10034',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'VT',def_groups => 'VT',row_groups => 'VT');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10035',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'VT',def_groups => 'VT',row_groups => 'VT');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10036',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DNG',def_groups => 'DNG',row_groups => 'DNG');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10037',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DNG',def_groups => 'DNG',row_groups => 'DNG');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10038',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'DNG',def_groups => 'DNG',row_groups => 'DNG');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10039',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'SEO',def_groups => 'SEO',row_groups => 'SEO');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10040',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'SEO',def_groups => 'SEO',row_groups => 'SEO');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10041',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'SEO',def_groups => 'SEO',row_groups => 'SEO');

exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10042',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HK',def_groups => 'HK',row_groups => 'HK');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10043',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HK',def_groups => 'HK',row_groups => 'HK');
exec sa_user_admin.set_groups(policy_name => 'OLS_DuAn',user_name => '10044',read_groups => 'HCM,HN,DN,VT,DNG,SEO,HK',write_groups => 'HK',def_groups => 'HK',row_groups => 'HK');

--Kiểm tra
select SA_SESSION.MIN_LEVEL('OLS_DuAn') from dual;
select SA_SESSION.MAX_LEVEL('OLS_DuAn') from dual;
select SA_SESSION.COMP_READ('OLS_DuAn') from dual;
select SA_SESSION.COMP_WRITE('OLS_DuAn') from dual;
select SA_SESSION.GROUP_READ('OLS_DuAn') from dual;
select SA_SESSION.GROUP_WRITE('OLS_DuAn') from dual;
select SA_SESSION.LABEL('OLS_DuAn') from dual;
select SA_SESSION.ROW_LABEL('OLS_DuAn') from dual;
select SA_SESSION.SA_USER_NAME('OLS_DuAn') from dual;

