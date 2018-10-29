create or replace procedure prc_discount_claim(v_orderno in number, v_productcode in varchar) is
    v_orderdate date;
    v_days number(4);
    v_buyprice number(7,2);
    v_minprice number(7,2);
    v_actualprice number(7,2);
    v_discountedprice number(7,2);
begin
  select orderdate into v_orderdate
  from orders
  where ordernumber = v_orderno and (sysdate - orderdate) < 30;

  v_days := round(sysdate - v_orderdate, 0);

  DBMS_OUTPUT.PUT_LINE('Customer made an order on ' || TO_CHAR(v_orderdate, 'DD/MM/YYYY') || '.');
  DBMS_OUTPUT.PUT_LINE('That was ' || v_days || ' days ago.');

  select priceeach into v_actualprice
    from orderdetails
   where ordernumber = v_orderno and productcode = v_productcode;

  select buyprice into v_buyprice
  from products
  where productcode = v_productcode;

  v_minprice := round(v_buyprice * 1.05, 2);
  v_discountedprice := round(v_actualprice *0.95, 2);

  if(v_discountedprice >= v_minprice) then
    update orderdetails
    set priceeach = round(v_discountedprice, 2)
    where ordernumber = v_orderno and productcode = v_productcode;

    DBMS_OUTPUT.PUT_LINE('Paid ' || ROUND(v_actualprice, 2));
    DBMS_OUTPUT.PUT_LINE('New Discounted Price ' || v_discountedprice);

  else
    DBMS_OUTPUT.PUT_LINE('Paid ' || v_actualprice || ' for ' || v_productcode);
    DBMS_OUTPUT.PUT_LINE('Already lowest price. No further discounts.');
  end if;

exception
  when no_data_found then
    DBMS_OUTPUT.PUT_LINE('Unable to process discount request.');
    DBMS_OUTPUT.PUT_LINE('Order not found or already past 30 days.');
end;
/

exec prc_discount_claim(10425, 'S32_2509');