set linesize 120
set pagesize 100
set serveroutput on

CREATE OR REPLACE PROCEDURE prc_hello IS
BEGIN
 DBMS_OUTPUT.PUT_LINE('Good Day!');
END;
/

exec prc_hello 

CREATE OR REPLACE PROCEDURE prc_hello2 (v_salutation IN VARCHAR, v_name IN VARCHAR) IS
BEGIN
 DBMS_OUTPUT.PUT_LINE('Good Day! ' || v_salutation || ' ' || v_name || ' !');
END;
/

exec prc_hello2('Mr.', 'Heng JH')

CREATE OR REPLACE PROCEDURE prc_hello3 (v_salutation IN VARCHAR, v_name IN VARCHAR) IS
 v_day VARCHAR(10);
 V_today DATE;

BEGIN
 v_day := TO_CHAR(SYSDATE, 'DAY');
 v_today := SYSDATE;

 DBMS_OUTPUT.PUT_LINE('Today is ' || v_today || '(' || v_day || ')');
 DBMS_OUTPUT.PUT_LINE('Good Day! ' || v_salutation || ' ' || v_name || ' !');
END;
/

exec prc_hello3('Mr.', 'Heng JH')


CREATE OR REPLACE FUNCTION fun_getAge(v_dob IN DATE) RETURN NUMBER IS
BEGIN
    RETURN EXTRACT (YEAR FROM (SYSDATE - v_dob) YEAR TO MONTH);
END;
/

CREATE OR REPLACE PROCEDURE prc_hello4 (v_salutation IN VARCHAR, v_name IN VARCHAR, v_dob IN DATE) IS
 v_day VARCHAR(10);
 V_today DATE;

BEGIN
 v_day := TO_CHAR(SYSDATE, 'DAY');
 v_today := SYSDATE;

 DBMS_OUTPUT.PUT_LINE('Today is ' || v_today || '(' || v_day || ')');
 DBMS_OUTPUT.PUT_LINE('Good Day! ' || v_salutation || ' ' || v_name || ' !');
 DBMS_OUTPUT.PUT_LINE('Today, you are  ' || fun_getAge(v_dob) || ' years old!');
END;
/
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY';
exec prc_hello4('Mr.', 'Heng JH', '07-07-1997')
