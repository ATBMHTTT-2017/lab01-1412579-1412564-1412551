-- Trưởng phòng chỉ được phép đọc thông tin chi tiêu của dự án trong phòng ban mình quản lý. Với những dự án không thuộc phòng ban của mình, các trưởng phòng được phép xem thông tin chi tiêu nhưng không được phép xem số tiền cụ thể (VPD). 
--Worked

--khi return chỉ 1 dự án

--FUNCTION
CREATE OR REPLACE FUNCTION ChiTieu_TruongPhong (
p_schema IN VARCHAR2 DEFAULT NULL,
p_object IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2 
AS
duan_chitieu number;
user number;
pchutri number;
SL number;
counter number;
query varchar2(200);
BEGIN
  user := SYS_CONTEXT('userenv', 'SESSION_USER');
  Select maPhong into pchutri from PhongBan where user = truongPhong;
  if (pchutri < 0) then
  RETURN '';
  ELSE
    BEGIN
    query :='';
    counter :=0;
        begin
            select count(*) INTO SL from DUAN where phongchutri = pchutri;
            for DUAN_LIST in (select MADA from DUAN WHERE phongchutri = pchutri)
            loop
                counter:=counter+1;
                IF(counter=SL) THEN
                query := query || '''' ||DUAN_LIST.MADA || '''';
                ELSE query := query || '''' ||DUAN_LIST.MADA || ''',';
                END IF;
            end loop;
        end;
    return 'DUAN IN (' || TEMP || ')';
    END;
  END IF;
EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;



--ADD POLICY
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




