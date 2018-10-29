set linesize 120
set pagesize 100
set serveroutput on

begin
  DBMS_OUTPUT.PUT_LINE(LPAD(' Hello', 30, '=') || RPAD(' ', 30, '='));
end;set linesize 120
set pagesize 100
set serveroutput on

begin
  DBMS_OUTPUT.PUT_LINE(LPAD(' Hello', 30, '=') || RPAD(' ', 30, '='));
end;
/

exec;


create or replace procedure prc_show_product_by_id(v_code in varchar) is 
    v_prodcode products.productcode%type;
    v_prodname products.productname%type;
    v_prodvendor products.productvendor%type;
    v_prodqty products.quantityinstock%type;
    v_buyprice products.buyprice%type;

begin
  select productcode, productname, productvendor, quantityinstock, buyprice into
         v_prodcode, v_prodname, v_prodvendor, v_prodqty, v_buyprice
  from products
  where productcode = v_code;

  DBMS_OUTPUT.PUT_LINE(LPAD('=', 100, '='));
  DBMS_OUTPUT.PUT_LINE(CHR(10));
  DBMS_OUTPUT.PUT_LINE('Product supply by vendor : ' || v_prodvendor);
  DBMS_OUTPUT.PUT_LINE(CHR(10));
  DBMS_OUTPUT.PUT_LINE(LPAD('=', 100, '='));

  DBMS_OUTPUT.PUT_LINE(RPAD('Code', 10, ' ') || ' ' || RPAD('Product Name', 10, ' ') ||
                       RPAD('Product Vendor', 20, ' ') || ' ' || RPAD('Quantity', 10, ' ') ||
                       RPAD('Buy Price', 10, ' '));

  DBMS_OUTPUT.PUT_LINE(LPAD('=', 100, '='));

  DBMS_OUTPUT.PUT_LINE(RPAD(v_prodcode, 10, ' ') || ' ' || RPAD(v_prodname, 10, ' ') ||
                       RPAD(v_prodvendor, 20, ' ') || ' ' || RPAD(v_prodqty, 10, ' ') ||
                       RPAD(v_buyprice, 10, ' '));
  DBMS_OUTPUT.PUT_LINE(CHR(10));
  DBMS_OUTPUT.PUT_LINE(LPAD('=', 44, '=') || RPAD('End Of Report', 56, '='));

exception
  when no_data_found then
    DBMS_OUTPUT.PUT_LINE('No Such product code: ' || v_code);
end;
/

exec prc_show_product_by_id('S10_1678')
/

exec;


create or replace procedure prc_show_product_by_id(v_code in varchar) is 
    v_prodcode products.productcode%type;
    v_prodname products.productname%type;
    v_prodvendor products.productvendor%type;
    v_prodqty products.quantityinstock%type;
    v_buyprice products.buyprice%type;

begin
  select productcode, productname, productvendor, quantityinstock, buyprice into
         v_prodcode, v_prodname, v_prodvendor, v_prodqty, v_buyprice
  from products
  where productcode = v_code;

  DBMS_OUTPUT.PUT_LINE(LPAD('=', 100, '='));
  DBMS_OUTPUT.PUT_LINE(CHR(10));
  DBMS_OUTPUT.PUT_LINE('Product supply by vendor : ' || v_prodvendor);
  DBMS_OUTPUT.PUT_LINE(CHR(10));
  DBMS_OUTPUT.PUT_LINE(LPAD('=', 100, '='));


  
end;
/
