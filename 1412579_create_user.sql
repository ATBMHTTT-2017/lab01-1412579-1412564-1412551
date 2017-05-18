alter session set "_ORACLE_SCRIPT"=true;

-- USER SQL
CREATE USER tangliang IDENTIFIED BY 1345314  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
grant connect to tangliang;



-- Create user cho Giám đốc
CREATE USER "10000" IDENTIFIED BY 1 ;
CREATE USER "10006" IDENTIFIED BY 1 ;
CREATE USER "10007" IDENTIFIED BY 1 ;
CREATE USER "10008" IDENTIFIED BY 1 ;
CREATE USER "10009" IDENTIFIED BY 1 ;

-- user cho nhân viên
CREATE USER "10016" IDENTIFIED BY 1 ;
CREATE USER "10017" IDENTIFIED BY 1 ;
CREATE USER "10018" IDENTIFIED BY 1 ;
CREATE USER "10019" IDENTIFIED BY 1 ;
CREATE USER "10020" IDENTIFIED BY 1 ;

-- user cho trưởng phòng
CREATE USER "10001" IDENTIFIED BY 1 ;
CREATE USER "10002" IDENTIFIED BY 1 ;
CREATE USER "10003" IDENTIFIED BY 1 ;
CREATE USER "10004" IDENTIFIED BY 1 ;
CREATE USER "10005" IDENTIFIED BY 1 ;

-- user cho trưởng chi nhánh
CREATE USER "10021" IDENTIFIED BY 1 ;
CREATE USER "10022" IDENTIFIED BY 1 ;
CREATE USER "10023" IDENTIFIED BY 1 ;
CREATE USER "10024" IDENTIFIED BY 1 ;
CREATE USER "10025" IDENTIFIED BY 1 ;

-- user cho trưởng dự án
CREATE USER "10010" IDENTIFIED BY 1 ;
CREATE USER "10011" IDENTIFIED BY 1 ;
CREATE USER "10012" IDENTIFIED BY 1 ;
CREATE USER "10013" IDENTIFIED BY 1 ;
CREATE USER "10014" IDENTIFIED BY 1 ;

grant connect to public;

GRANT SELECT ON NHANVIEN TO "10016";
GRANT SELECT ON NHANVIEN TO "10017";
GRANT SELECT ON NHANVIEN TO "10018";
GRANT SELECT ON NHANVIEN TO "10019";
GRANT SELECT ON NHANVIEN TO "10020";

GRANT RESOURCE TO "10016";
GRANT RESOURCE TO "10017";
GRANT RESOURCE TO "10018";
GRANT RESOURCE TO "10019";
GRANT RESOURCE TO "10020";

REVOKE RESOURCE TO "10016";
REVOKE RESOURCE TO "10017";
REVOKE RESOURCE TO "10018";
REVOKE RESOURCE TO "10019";
REVOKE RESOURCE TO "10020";