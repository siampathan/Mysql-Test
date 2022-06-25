--schema all are same as car_insurance
--here just make query

--Find the company that has the most employees
SELECT company_name, COUNT(company_name)  emp_count 
FROM works 
GROUP BY company_name
ORDER BY emp_count DESC LIMIT 1;

--Find the average salaries of each company
select company_name, avg(salary) from works group by company_name;

--find all employees who live in Dhaka city, but their company is not in Dhaka
select employee_name from company c,employee e,works w
where e.employee_id= w.employee_id AND c.company_name=w.company_name AND e.city="Dhaka" and c.city!="Dhaka";

