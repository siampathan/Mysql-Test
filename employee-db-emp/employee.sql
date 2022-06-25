--schema all are same as car_insurance
--here just make query

--Find the names, cities and salaries of all
-- employees who work for PubaliBankLtd
SELECT  employee .person_name , employee.city, works.salary 
FROM employee LEFT JOIN works ON works.person_name = employee.person_name  WHERE  employee.person_name = works.person_name  AND  works.company_name ='PubaliBankLtd';

--Find the total salaries of each company
SELECT company_name, SUM(salary) 
AS total_salary FROM works 
GROUP BY company_name;

