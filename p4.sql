set linesize 120
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


  
end;
/