--schema all are same as car_insurance
--here just make query
-- Find all customers who have an account but no loan at the bank

select customer_name from depositor
except
select customer_name from borrower;

--Delete all loan ammount between 5000/- and 15000/-
DELETE   FROM loan  WHERE amount BETWEEN 5000 AND 15000;