--schema all are same as car_insurance
--here just make query
--Find all the bank customers having both a loan and a saving account
select customer_name from depositor
intersect 
select customer_name from borrower;

--Find the average account balance at each branch
select avg(balance),branch_name
from saving_account 
group by branch_name;

--Deduct 1% service charge from saving account balance that have both loan 
--and a saving account other wisededuct 2% service charge from  saving account balance

UPDATE saving_account
SET balance =
CASE
  WHEN
       account_number IN
       (SELECT depositor.account_number
       FROM depositor, borrower
       WHERE depositor.customer_name = borrower.customer_name)
  THEN
       balance-((balance*1)/100)
  ELSE
       balance-((balance*2)/100)
END;
UPDATE account
SET balance =
CASE
  WHEN
       account_number IN
       (SELECT depositor.account_number
       FROM depositor, borrower
       WHERE depositor.customer_name = borrower.customer_name)
  THEN
       balance-((balance*1)/100)
  ELSE
       balance-((balance*2)/100)
END;

