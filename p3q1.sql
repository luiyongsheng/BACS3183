select max(orderdate) from orders;

update orders
set orderdate = add_months(orderdate, 161),
    requireddate = add_months(requireddate, 161),
    shippeddate = add_months(shippeddate, 161);
    
create or replace procedure prc_last_order(v_cno in number) is
  v_orderdate date;
  v_days number(4); ---9999
  v_months number(4,1); ---999.9
begin
  select max(orderdate) into v_orderdate
  from orders
  where customernumber = v_cno;

  DBMS_OUTPUT.PUT_LINE('Customer: ' || v_cno || ' last made an order on ' || TO_CHAR(v_orderdate, 'DD/MM/YYYY') || '.');
  v_days := ROUND(SYSDATE - v_orderdate, 0);

  if(v_days < 30) then
    DBMS_OUTPUT.PUT_LINE('That was ' || v_days || ' days ago.');
  else
    v_months := months_between(sysdate, v_orderdate);
    DBMS_OUTPUT.PUT_LINE('That was ' || v_months || ' months ago.');
  end if;
end;
/