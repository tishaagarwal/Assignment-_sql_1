SELECT * FROM RANKS;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENTS;

create table departments(
  	deptid serial primary key, -- GENERATED ALWAYS AS IDENTITY
 	deptname text not null
 );

create table ranks(
	rankid serial primary key,
 	rankdesc text not null,
 	level int
 );

 create table employee(
 	id serial not null,
 	empid int primary key not null,
 	fname text not null,
 	lname text not null,
 	gender varchar(1) check (gender in('M','F','O')),
 	dob date not null,
 	doj date not null,
 	email varchar,
 	salary int not null,
 	reportsto int,
 	deptid serial references departments(deptid),
 	rankid serial references ranks(rankid),
 	createdat Timestamp not null default current_date,
 	updatedat Timestamp not null default current_date,
 	client_reqid varchar not null
 );

 insert into departments(deptname) values ('IT'),('Accounts'),('Marketing'),('HR'),('Administration'),('Research'),('Sales'),('Support'),
 ('Operational'),('Consultant');

 insert into ranks(rankdesc , level) values ('CEO',1),('Vice President',2),('President',3),('Assistant Vice President',4),
 ('Chief Operating Officer',5),('Chief Financial Officer',6),('Chief Marketing Officer',7),('Supervisors',8),('Members',9);

select * from ranks;

insert into employee (empid, fname,lname, gender, dob, doj, email, salary, reportsto, deptid, rankid, client_reqid)
values (1001,'Mary','Amelia','F','1970-01-02','2013-07-24','maryameila@yahoo.com',60000,2,4,3,'Client1'),
  (1002,'John','Oliver','M','1974-03-12','2015-10-12','johnoliver@yahoo.com',55000,3,4,4,'Client2'),
  (1003,'Robert','Thomas','M','1974-11-05','2015-11-06','robertthomas@yahoo.com',58000,4,2,3,'Client3'),
  (1004,'Sarah','Isla','F','1980-01-02','2018-04-13','sarahisla@yahoo.com',45000,4,5,7,'Client4'),
  (1005,'Ann','Poppy','F','1973-09-15','2014-11-30','annpoppy@yahoo.com',61000,2,6,3,'Client5'),
  (1006, 'Michael', 'Jordan', 'M', '1975-08-23', '2016-02-28', 'michaeljordan@yahoo.com', 70000,1, 1, 2, 'Client6'),
  (1007, 'Emily', 'Smith', 'F', '1982-04-17', '2019-08-15', 'emilysmith@yahoo.com', 52000,4, 4, 2, 'Client7'),
  (1008, 'David', 'Williams', 'M', '1978-12-08', '2017-06-10', 'davidwilliams@yahoo.com', 63000,4, 3, 4, 'Client8'),
  (1009, 'Emma', 'Johnson', 'F', '1985-06-30', '2020-03-22', 'emmajohnson@yahoo.com', 48000, 8,5, 9, 'Client9'),
  (1010, 'Christopher', 'Clark', 'M', '1983-11-12', '2019-01-05', 'christopherclark@yahoo.com', 59000,6, 6, 3, 'Client10'),
  (1011, 'Sophia', 'Harris', 'F', '1976-07-18', '2014-09-28', 'sophiaharris@yahoo.com', 66000,5, 3, 7, 'Client11'),
  (1012, 'Daniel', 'Taylor', 'M', '1981-02-04', '2016-11-14', 'danieltaylor@yahoo.com', 51000,6, 4, 2, 'Client12'),
  (1013, 'Olivia', 'Miller', 'F', '1979-05-21', '2015-07-08', 'oliviamiller@yahoo.com', 69000,4, 1, 2, 'Client13'),
  (1014, 'Andrew', 'Brown', 'M', '1984-09-03', '2018-12-01', 'andrewbrown@yahoo.com', 54000, 5,2, 6, 'Client14'),
  (1015, 'Ava', 'Davis', 'F', '1977-03-14', '2013-04-25', 'avadavis@yahoo.com', 60000,4, 5, 6, 'Client15'),
  (1016, 'William', 'Moore', 'M', '1972-01-30', '2014-05-17', 'williammoore@yahoo.com', 62000,3, 3, 2, 'Client16'),
  (1017, 'Isabella', 'White', 'F', '1986-08-11', '2021-02-09', 'isabellawhite@yahoo.com', 47000,6, 4, 7, 'Client17'),
  (1018, 'Joseph', 'Anderson', 'M', '1980-04-25', '2017-10-20', 'josephanderson@yahoo.com', 58000,3, 5, 4, 'Client18'),
  (1019, 'Mia', 'Martin', 'F', '1974-12-19', '2016-06-05', 'miamartin@yahoo.com', 65000,2, 3, 6, 'Client19'),
  (1020, 'James', 'Thompson', 'M', '1987-02-14', '2019-11-30', 'jamesthompson@yahoo.com', 50000,3, 2, 7, 'Client20'),
  (1021, 'Ella', 'Wilson', 'F', '1983-06-08', '2018-03-12', 'ellawilson@yahoo.com', 56000,4, 3, 5, 'Client21'),
  (1022, 'Alexander', 'Hill', 'M', '1979-09-27', '2015-12-18', 'alexanderhill@yahoo.com', 67000,1, 1, 1, 'Client22'),
  (1023, 'Grace', 'Ward', 'F', '1975-11-03', '2016-09-02', 'graceward@yahoo.com', 49000,6, 2, 1, 'Client23'),
  (1024, 'Nicholas', 'Baker', 'M', '1986-03-19', '2020-07-25', 'nicholasbaker@yahoo.com', 64000,4, 3, 9, 'Client24'),
  (1025, 'Aiden', 'Carter', 'M', '1981-07-14', '2017-04-09', 'aidencarter@yahoo.com', 53000,5, 4, 7, 'Client25');

-- get all fields of all employees,
select * from employee;

--  get name and age of all employees
select fname ||' '|| lname as name, date_part('year',current_date) - date_part('year',dob) as age
from employee

select * from departments;

-- get name, dob and doj of all employees from “IT” department,
select e.fname ||' '|| e.lname as name, date_part('year',current_date) - date_part('year',e.dob) as age, date_part('year',current_date) - date_part('year',e.doj) as dojage
from employee e join departments d 
ON e.deptid = d.deptid
where d.deptname = 'IT'

-- update the dob, salary of an employee for a specific employee ID, 
Update employee
set dob = '1990-03-12', salary = 50000 
where empid = 1023

-- Add a few employees in “IT” division at a rank of “Vice President”
insert into employee (empid, fname,lname, gender, dob, doj, email, salary, reportsto, deptid, rankid, client_reqid)
values (1026,'Leela','Chavan','F','1992-09-16','2014-12-10','leelachavan@yahoo.com',78000,3,1,2,'Client26');

-- Update Salary of employee “Ranveer” to 100000,
update employee
set salary = 100000 where fname = 'Daniel'

-- Update DoJ of employee “Salman” to 21 Apr 2021
update employee
set doj = '2021-04-21' where fname = 'Sarah';

-- Delete a record for employee “Rahul”
delete from employee where fname ='Leela';

-- Add a new division “Administration”
Insert into departments(deptname) values ('Administration');

-- Add a new rank “Trainee” below “Member” 
insert into ranks(rankdesc , level) values ('Trainee',10);

-- Update salary of all employees by 10% 
update employee
set salary = salary + salary * 0.1;

-- Update salary of all employees who have spent more than 5 years by 5% over and above 10% raised earlier, 
update employee
set salary = 
case
   when date_part('year',current_date) - date_part('year',doj) between 5 and 10 then salary + (salary * 0.05)
   when date_part('year',current_date) - date_part('year',doj) > 10 then salary + (salary * 0.10)
   else salary
end;

-- get a count of employees within an organization, 
select count(empid) from employee;

-- get a count of employees younger than 25 years, 
select count(empid) from employee 
where date_part('year',current_date) - date_part('year',dob) < 26 

-- get a count of employees older than 45 years, 
select count(empid) from employee 
where date_part('year',current_date) - date_part('year',dob) > 45 

-- get a count of employees between age 25 and 45 years,
select count(empid) from employee 
where date_part('year',current_date) - date_part('year',dob) between 25 and 45

-- get a list of employees (name, age in years, doj, division and rank) eligible for gratuity 
-- -- ie. who have spent 5 years or more within an organization, 
select e.fname || ' ' || e.lname as name , date_part('year',current_date) - date_part('year',e.dob) as age, date_part('year',current_date) - date_part('year',e.doj) as dojage,
d.deptname, r.rankdesc from employee e join departments d 
on e.deptid = d.deptid 
join ranks r
on e.rankid = r.rankid
where date_part('year',current_date) - date_part('year',e.doj) >= 5;

-- get a list of young millionaires below age of 30 and annual salary more than 10L. 
select * from employee 
where (salary * 12) > 1000000 and date_part('year',current_date) - date_part('year',dob) < 30;

-- Add new fields: 
-- within all tables: 
-- “createdat” -- timestamp default value “now”, 
-- “createdby” -- varchar employee ID, 
-- “lastupdatedat” -- timestamp default value “now”, 
-- “lastupdatedby” -- varchar employee ID. 
ALTER TABLE EMPLOYEE
add createdby int,
add lastupdatedby int;

ALTER TABLE departments
add createdat Timestamp default now(),
add createdby int,
add updatedat Timestamp default now(),
add lastupdatedby int;

ALTER TABLE ranks
add createdat Timestamp default now(),
add createdby int,
add updatedat Timestamp default now(),
add lastupdatedby int;

-- Add a new table 
-- “salhistory”: “id” (auto generated), 
-- “empid” foreign key to “employee” table, 
-- “salary” - integer, 
-- “effective_from”: date, 
-- “effective_to”: date. 
-- Add relevant records in “salhistory” table. 

CREATE TABLE salhistory (
  id SERIAL PRIMARY KEY,
  empid INT REFERENCES employee(empid),
  salary INT,
  effective_from DATE,
  effective_to DATE
);

INSERT INTO salhistory (empid, salary, effective_from, effective_to)
VALUES 
  (1001, 60000, '2013-07-24', '2015-10-11'),
  (1002, 55000, '2015-10-12', '2019-08-14'),
  (1003, 58000, '2015-11-06', '2015-11-05'),
  (1004, 45000, '2018-04-13', '2018-04-12'),
  (1005, 61000, '2014-11-30', '2014-11-29'),
  (1006, 70000, '2016-02-28', '2016-02-27'),
  (1007, 52000, '2019-08-15', '2019-08-14'),
  (1008, 63000, '2017-06-10', '2017-06-09'),
  (1009, 48000, '2020-03-22', '2020-03-21'),
  (1010, 59000, '2019-01-05', '2019-01-04'),
  (1011, 66000, '2014-09-28', '2014-09-27'),
  (1012, 51000, '2016-11-14', '2016-11-13'),
  (1013, 69000, '2015-07-08', '2015-07-07'),
  (1014, 54000, '2018-12-01', '2018-11-30'),
  (1015, 60000, '2013-04-25', '2013-04-24'),
  (1016, 62000, '2014-05-17', '2014-05-16'),
  (1017, 47000, '2021-02-09', '2021-02-08'),
  (1018, 58000, '2017-10-20', '2017-10-19'),
  (1019, 65000, '2016-06-05', '2016-06-04'),
  (1020, 50000, '2019-11-30', '2019-11-29'),
  (1021, 56000, '2018-03-12', '2018-03-11'),
  (1022, 67000, '2015-12-18', '2015-12-17'),
  (1023, 49000, '2016-09-02', '2016-09-01'),
  (1024, 64000, '2020-07-25', '2020-07-24'),
  (1025, 53000, '2017-04-09', '2017-04-08');

-- get a list of employees -- empid, salary, effective period in days for “IT” division, rank description 
SELECT 
  e.empid,
  sh.salary,
  sh.effective_from,
  sh.effective_to,
  e.deptid,
  r.rankdesc
FROM 
  employee e
JOIN 
  salhistory sh ON e.empid = sh.empid
JOIN 
  ranks r ON e.rankid = r.rankid
JOIN 
  departments d ON d.deptid = e.deptid
WHERE 
  d.deptname = 'IT';

-- get a two column output: first column is name of a division and second column is 
-- count of employees within that division such that division having highest number of 
-- employees is on the top and division with lowest number of employees is at the 
-- bottom of the list
select  d.deptname, count(e.empid) 
from employee e 
JOIN departments d 
ON d.deptid = e.deptid
GROUP BY d.deptname
order by count(e.empid) DESC

-- Write a single SQL query to provide a standard increment to all employees based on 
-- number of years spent at the company: 10% for all employees who have spent more 
-- than 4 years, 6% for all employees who have spent more than 2 years, 4% for rest of 
-- the employees.
update employee
set salary = 
case
   when date_part('year',current_date) - date_part('year',doj) between 2 and 4 then salary + (salary * 0.05)
   when date_part('year',current_date) - date_part('year',doj) > 4 then salary + (salary * 0.10)
   else salary + (salary * 0.04)
end;

-- Find salary budget of each division -- first column shall be name of the division and 
-- second column shall be total salary for employees within the division such that 
-- division with lowest salary budget is at the bottom and division with the highest salary 
-- budget is at the top.
select d.deptname, (e.salary * 12) as salary 
from employee e
JOIN departments d 
ON d.deptid = e.deptid
order by salary DESC

-- Find average annual salary for each division -- first column is name of the name of 
-- division and second column is average salary rounded to 2 decimal points 
select d.deptname, ROUND(AVG(e.salary*12),2) as salary 
from employee e
JOIN departments d 
ON d.deptid = e.deptid
group by d.deptname
order by salary DESC

-- Find max salary from each division -- first column is the name of division and second 
-- column is maximum salary of the respective division 
select d.deptname, max(e.salary*12) as maximum_salary
from employee e
JOIN departments d 
ON d.deptid = e.deptid
group by d.deptname

-- Find age distribution within an organization -- first column is the age range (e.g. 
-- below 20, 20-40, 40-50, 50-60, above 60) and second column is number of 
-- employees within the range. 
SELECT
  CASE
    WHEN age < 20 THEN 'Below 20'
    WHEN age BETWEEN 20 AND 40 THEN '20-40'
    WHEN age BETWEEN 41 AND 50 THEN '40-50'
    WHEN age BETWEEN 51 AND 60 THEN '50-60'
    ELSE 'Above 60'
  END AS age_range,
  COUNT(*) AS employee_count
FROM (
  SELECT 
    empid,
    EXTRACT(YEAR FROM AGE(current_date, dob)) AS age
  FROM employee
) AS age_data
GROUP BY age_range
ORDER BY age_range;

-- get a two column output -- name of employee and name of reporting officer such that 
-- name of the employee with highest level of rank is on the top. Whenever, rank is 
-- identical, sort in alphabetical order 
SELECT 
  e.fname AS employee_name,
  s.fname AS reporting_officer,
  r.rankdesc,
  r.level
FROM 
  employee e
JOIN 
  employee s ON e.reportsto = s.empid
JOIN 
  ranks r ON e.rankid = r.rankid
ORDER BY 
  r.level DESC;

-- Find out total salary of all direct and indirect employees under a given employee ID
WITH RECURSIVE EmployeeHierarchy AS (
  SELECT empid, reportsto, salary
  FROM employee
  WHERE empid = 1004

  UNION ALL

  SELECT e.empid, e.reportsto, e.salary
  FROM employee e
  JOIN EmployeeHierarchy eh ON e.reportsto = eh.empid
)
SELECT SUM(salary) AS total_salary
FROM EmployeeHierarchy;

-- For a given employee ID, find the income tax payable based on the annual salary 
-- slabs: less 5L: nil, 5L - 10L: 10%, 10L - 20L: 20%, 20L and above: 30%, plus 
-- surcharge tax of 5% for those earning above 1Cr. Input parameter shall be employee 
-- ID and return value shall be tax amount. 
CREATE OR REPLACE FUNCTION (emp_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE 
  income_tax INT;
BEGIN
income_tax_payable
  SELECT
    CASE
      WHEN (salary * 12) < 500000 THEN 0
      WHEN (salary * 12) BETWEEN 500000 AND 1000000 THEN (salary * 12) * 0.1
      WHEN (salary * 12) BETWEEN 1000000 AND 2000000 THEN (salary * 12) * 0.2
      WHEN (salary * 12) BETWEEN 2000000 AND 10000000 THEN (salary * 12) * 0.3 
      WHEN (salary * 12) > 10000000 THEN (salary * 12) * 0.35
    END
  INTO income_tax
  FROM employee
  WHERE empid = emp_id;

  RETURN income_tax;
END;
$$;

select income_tax_payable(1024)

-- Write a view which returns employee ID, name of employee, gender (Male for M, 
-- Female for F and O for Others), Annual salary, Income tax payable. 
create view employee_table as
select 
 empid, 
 fname,
 case 
    when gender = 'M' then 'Male'
	when gender = 'F' then 'Female'
	else 'Other'
 end,
 (salary * 12) as annual_salary,
 income_tax_payable(empid)
from employee

select * from employee_table

-- Find average annual salary for each division which crosses 10 lakhs -- first column is 
-- name of the name of division and second column is average salary rounded to 2 
-- decimal points
select d.deptname, ROUND(AVG(e.salary*12),2) as salary 
from employee e
JOIN departments d 
ON d.deptid = e.deptid
group by d.deptname
having ROUND(AVG(e.salary*12),2) > 1000000
 
-- Find salary budget of each division -- first column shall be name of the division and 
-- second column shall be total salary for employees - display only top 2 highest salary 
-- budget
select d.deptname, SUM(e.salary)as salary 
from employee e
JOIN departments d 
ON d.deptid = e.deptid
group by d.deptname
Order by salary DESC
LIMIT 2 

-- Find salary budget of each division -- first column shall be name of the division and 
-- second column shall be total salary for employees - display only from 3 highest 
-- salary budget
select d.deptname, SUM(e.salary)as salary 
from employee e
JOIN departments d 
ON d.deptid = e.deptid
group by d.deptname
Order by salary DESC
LIMIT 3

-- Add a new table 
-- “Payslip”: “id” (auto generated), 
-- “empid” foreign key to “employee” table, 
-- “salary” - integer, 
-- “date_from”: date, 
-- “date_to”: date. 
-- Tax Integer,
-- Surcharge Integer,
-- Net_Salary Integer
CREATE TABLE surcharge_tax(
	Payslip serial not null,
	empid int references employee(empid),
	salary int,
	date_from date,
	date_to date,
	Tax int,
	Surcharge int,
	Net_Salary int
);

-- For a given employee ID, find the income tax payable based on the annual salary 
-- slabs: less 5L: nil, 5L - 10L: 10%, 10L - 20L: 20%, 20L and above: 30%, plus 
-- surcharge tax of 5% for those earning above 1Cr. Input parameter shall be employee 
-- ID and month, Update Tax with the calculated value, Surcharge and update 
-- Net_Salary = Salary – Tax – Surcharge for each employees.
-- Assuming that you want to update the payslip for a specific employee and month
DO $$ 
DECLARE
    emp_id INT := 1001; 
    month_year DATE := '2024-02-01'; 
BEGIN
    UPDATE surcharge_tax
    SET 
        tax = 
            CASE
                WHEN (salary * 12) < 500000 THEN 0
                WHEN (salary * 12) BETWEEN 500000 AND 1000000 THEN (salary * 12) * 0.1
                WHEN (salary * 12) BETWEEN 1000000 AND 2000000 THEN (salary * 12) * 0.2
                WHEN (salary * 12) > 2000000 THEN (salary * 12) * 0.3
            END,
        surcharge = 
            CASE
                WHEN (salary * 12) > 10000000 THEN (salary * 12) * 0.05
                ELSE 0
            END,
        net_salary = salary - tax - surcharge
    WHERE 
        empid = emp_id 
        AND date_from <= month_year
        AND date_to >= month_year;
END $$;


-- Write a query to join Employee and Payslip with Employee_id, Employee Name as fname + 
-- lname, salary, tax, surcharge, net_salary, Salary for the month, year. Then create this query 
-- as view
CREATE VIEW employee_payslip_view AS
SELECT 
    e.empid AS employee_id,
    e.fname || ' ' || e.lname AS employee_name,
    p.salary,
    p.tax,
    p.surcharge,
    p.net_salary,
    p.date_from AS month_year,
    p.date_to
FROM 
    employee e
JOIN 
    surcharge_tax p ON e.empid = p.empid;

select * from employee_payslip_view

-- Write a trigger to update Tax, Surcharge and Net_salary if Salary column is updated based 
-- on above tax calculations
CREATE OR REPLACE FUNCTION update_tax_surcharge_net_salary()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE surcharge_tax
    SET 
        tax = 
            CASE
                WHEN (NEW.salary * 12) < 500000 THEN 0
                WHEN (NEW.salary * 12) BETWEEN 500000 AND 1000000 THEN (NEW.salary * 12) * 0.1
                WHEN (NEW.salary * 12) BETWEEN 1000000 AND 2000000 THEN (NEW.salary * 12) * 0.2
                WHEN (NEW.salary * 12) > 2000000 THEN (NEW.salary * 12) * 0.3
            END,
        surcharge = 
            CASE
                WHEN (NEW.salary * 12) > 10000000 THEN (NEW.salary * 12) * 0.05
                ELSE 0
            END,
        net_salary = NEW.salary - tax - surcharge
    WHERE 
        empid = NEW.empid;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_tax_surcharge_net_salary_trigger
AFTER UPDATE OF salary ON employee
FOR EACH ROW
EXECUTE FUNCTION update_tax_surcharge_net_salary();



