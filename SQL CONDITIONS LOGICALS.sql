#PRACTICE QNS CONDITIONS 

create database employee;
create table employee.employee_table
(emp_id int primary key,
emp_name varchar(30),
emp_designation varchar(50),
emp_salary int
);
 Insert into employee.employee_table (emp_id, emp_name , emp_designation , emp_salary)
  values 
(1, 'John Doe', 'Software Engineer', 70000),
(2, 'Jane Smith', 'Project Manager', 90000),
(3, 'Emily Johnson', 'Data Analyst', 65000),
(4, 'Michael Brown', 'Product Manager', 80000),
(5, 'Jessica Davis', 'UI/UX Designer', 60000),
(6, 'Daniel Wilson', 'DevOps Engineer', 75000),
(7, 'Laura Martinez', 'QA Engineer', 68000),
(8, 'Kevin Anderson', 'Business Analyst', 72000),
(9, 'Sarah Thomas', 'Frontend Developer', 70000),
(10, 'David Jackson', 'Backend Developer', 73000),
(11, 'Chris Lee', 'Data Scientist', 85000),
(12, 'Amanda Harris', 'System Administrator', 71000),
(13, 'Brian Clark', 'Network Engineer', 69000),
(14, 'Sophia Lewis', 'HR Manager', 74000),
(15, 'James Robinson', 'Technical Writer', 62000),
(16, 'Olivia Walker', 'Software engineer', 50000),
(17, 'Ethan Young', 'Cloud Engineer', 78000),
(18, 'Mia King', 'Graphic Designer', 64000),
(19, 'Aiden Scott', 'Marketing Manager', 82000),
(20, 'Charlotte Green', 'SEO Specialist', 66000),
(21, 'Henry Adams', 'Mobile Developer', 71000),
(22, 'Ella Baker', 'Software engineer', 63000),
(23, 'Lucas Gonzalez', 'IT Support Specialist', 67000),
(24, 'Ava Perez', 'Cybersecurity Analyst', 79000),
(25, 'Mason Collins', 'Database Administrator', 75000),
(26, 'Isabella Stewart', 'Operations Manager', 80000),
(27, 'Liam Russell', 'Full Stack Developer', 85000),
(28, 'Sophia Wright', 'Digital Marketing Specialist', 66000),
(29, 'Noah Bennett', 'Software Tester', 69000),
(30, 'Emma Flores', 'Technical Support Engineer', 68000),
(31, 'Benjamin Torres', 'Frontend Developer', 72000),
(32, 'Sophia Rodriguez', 'UI/UX Designer', 68000),
(33, 'Liam Hernandez', 'Backend Developer', 75000),
(34, 'Ava Gonzalez', 'Data Analyst', 67000),
(35, 'Michael Ramirez', 'Software engineer', 78000),
(36, 'Isabella Sanchez', 'Project Manager', 85000),
(37, 'William Flores', 'Software Engineer', 82000),
(38, 'Mia Rivera', 'QA Engineer', 70000),
(39, 'Ethan Gomez', 'Network Engineer', 72000),
(40, 'Emma Diaz', 'HR Manager', 76000);

select * from employee.employee_table;

select * from employee.hiredet_table;

create table employee.hiredet_table
(emp_id int primary key,
emp_joblocation varchar (30),
emp_joining date,
emp_jobid int,
emp_exp int
);
 
 Insert into employee.hiredet_table(emp_id , emp_joblocation ,emp_joining , emp_jobid,emp_exp) values
 (1, 'New York', '2020-01-15', 101, 5),
(2, 'Los Angeles', '2019-03-10', 102, 8),
(3, 'Chicago', '2018-05-22', 103, 4),
(4, 'Houston', '2021-07-11', 104, 6),
(5, 'Phoenix', '2017-09-30', 105, 7),
(6, 'Philadelphia', '2016-11-20', 106, 10),
(7, 'San Antonio', '2022-02-13', 107, 3),
(8, 'San Diego', '2015-06-05', 108, 12),
(9, 'Dallas', '2020-08-19', 109, 5),
(10, 'San Jose', '2019-10-25', 110, 9),
(11, 'Austin', '2018-12-15', 111, 4),
(12, 'Jacksonville', '2017-03-10', 112, 8),
(13, 'Fort Worth', '2016-04-22', 113, 7),
(14, 'Columbus', '2021-01-30', 114, 6),
(15, 'Charlotte', '2022-05-17', 115, 2),
(16, 'San Francisco', '2015-07-29', 116, 11),
(17, 'Indianapolis', '2019-09-13', 117, 5),
(18, 'Seattle', '2018-11-03', 118, 6),
(19, 'Denver', '2017-01-19', 119, 8),
(20, 'Washington', '2016-02-27', 120, 10),
(21, 'Boston', '2020-03-14', 121, 3),
(22, 'El Paso', '2019-05-25', 122, 7),
(23, 'Nashville', '2018-07-08', 123, 5),
(24, 'Detroit', '2017-09-12', 124, 9),
(25, 'Oklahoma City', '2016-10-20', 125, 6),
(26, 'Portland', '2021-11-04', 126, 2),
(27, 'Las Vegas', '2022-01-23', 127, 4),
(28, 'Memphis', '2015-03-30', 128, 10),
(29, 'Louisville', '2020-06-15', 129, 7),
(30, 'Baltimore', '2019-08-21', 130, 6);

alter table employee.hiredet_table 
add constraint foreign key FK_emp_id (emp_id) references employee.employee_table (emp_id);

#joins-comma

select employee.employee_table.emp_name, employee.employee_table.emp_designation, employee.hiredet_table.emp_jobid,
employee.hiredet_table.emp_exp, 
employee.employee_table.emp_salary from employee.employee_table, employee.hiredet_table where
employee.hiredet_table.emp_id = employee.employee_table.emp_id ;

#inner
select employee.employee_table.emp_name, employee.employee_table.emp_designation, employee.hiredet_table.work_location,
employee.hiredet_table.emp_exp, 
employee.employee_table.emp_salary from employee.employee_table Inner join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id ;

#left
select employee.employee_table.emp_name, employee.hiredet_table.emp_joblocation,
employee.hiredet_table.emp_exp, 
employee.employee_table.emp_salary from employee.employee_table left join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id ;

#right
select employee.employee_table.emp_name, employee.employee_table.emp_designation, employee.hiredet_table.emp_joblocation,
employee.hiredet_table.emp_exp, employee.hiredet_table.emp_joining,
employee.employee_table.emp_salary from employee.employee_table right join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id ;

#updates and alters:

#UPDATES IS FOR CAHNGES IN  RECORDS IN A TABLE
update employee.employee_table set emp_salary="75000" where emp_id="5"; 
update employee.employee_table set emp_designation="User Interface" where emp_designation="UI/UX Designer";

 #ALTER IS FOR ADDING OR DELETING TABLES OR COLUMNS OR IN DB
alter table employee.employee_table add column Team_id varchar(10) default "team 008" ;
alter table employee.employee_table modify emp_designation varchar(50);
alter table employee.employee_table drop column manager_id;
alter table employee.hiredet_table rename column current_location to work_location;
ALTER TABLE employee.employee_TABLE RENAME TO EMPLOYEE.E_TABLE;
ALTER table employee.e_table rename to employee.employee_table;

# as we used foreign key and primary key . so we first deleting the record of foreign key table and the primary key table
delete from  employee.hiredet_table where emp_id="25";
delete from  employee.employee_table where emp_id="25";

#conditions:

select * from employee.employee_table where emp_salary>="50000";

select count(*) as count_of_employee from employee.employee_table where emp_salary>="70000";

select emp_id,emp_exp,emp_jobid  from employee.hiredet_table  where emp_exp>="3" and emp_jobid>="120"
order by employee.hiredet_table.emp_id asc ;

select employee.employee_table.emp_name, employee.employee_table.emp_salary, 
employee.hiredet_table.work_location, employee.hiredet_table.emp_exp
from employee.employee_table right join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id 
where emp_exp>="4" and emp_jobid>"110" and not emp_salary<"70000" ;

select count(emp_exp) as maximum_experience from employee.hiredet_table where emp_exp>="5";

select emp_designation, count(*) as person_count from employee.employee_table
group by emp_designation; 

#index:

create  index idx_emp_name on employee.employee_table (emp_name);
create index idx_dept_salary on  employee.employee_table (emp_designation, emp_salary);
#drop index idx_dept_salary on employee.employee_table;
select * from employee.employee_table
use index (idx_emp_name) where emp_name = 'John Doe';

select emp_id, emp_name from employee.employee_table use index (idx_dept_salary) 
where emp_designation="software engineer" or emp_salary>"65000";

#qns:
1) Retrieve the first and second highest salary from the employee_table.
#without name
select max(emp_salary) as firsthighest_salary from employee.employee_table;
#with name
select emp_salary as first_highestsalary, emp_name from employee.employee_table where emp_salary=(select max(emp_salary) 
from employee.employee_table);

select emp_salary as secondhighest_salary,  emp_name from employee.employee_table 
where emp_salary=(select max(emp_salary)  from employee.employee_table
where emp_salary<(select max(emp_salary)  
from employee.employee_table));

2) Retrieve the employee details who joined most recently from the hiredet_table.
 select * from employee.hiredet_table order by emp_joining desc limit 1;
 
3) Retrieve the employee details from the employee_table whose name starts with 'J' or ends with 'E' 
select * from employee.employee_table  where emp_name like  'j%e';
select * from employee.employee_table  where emp_name regexp '^j.*e$';

4) Retrieve the employee details whose salary is higher than the average salary of their respective designations from the employee_table.
select * from employee.employee_table e where e.emp_salary> (select Avg(emp_salary) 
from employee.employee_table where emp_designation=e.emp_designation );

5) Calculate the total salary budget for each designation from the employee_table.
select  emp_designation, sum(emp_salary) as total_salary from employee.employee_table group by emp_designation;

6) Retrieve the employee details from the employee_table who have been working for more than 5 years 
(based on the emp_joining date in the hiredet_table).
select employee.employee_table.emp_name, employee.employee_table.emp_designation, employee.hiredet_table.work_location,
employee.hiredet_table.emp_exp, employee.hiredet_table.emp_joining,
employee.employee_table.emp_salary from employee.employee_table right join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id 
where employee.hiredet_table.emp_exp>5 or 
timestampdiff(year, hiredet_table.emp_joining, current_date) > 5
order by hiredet_table.emp_joining desc;
#(date_part('year',current date)-date_part('year',employee.hiredet_table.emp_joining))>5
#Timestamp is used to calculate the diff b/w two dates.
#Here, it computes the difference in years (so we included "year" in ()) between the joining date and the current date.

7) Retrieve the employee details from the employee_table who have the highest salary for each designation.
select * from employee.employee_table et where et.emp_salary =(select max(et.emp_salary) 
from employee.employee_table 
where et.emp_designation=emp_designation);

SELECT * 
FROM employee.employee_table et
WHERE et.emp_salary = (
    SELECT MAX(inner_et.emp_salary) 
    FROM employee.employee_table inner_et
    WHERE inner_et.emp_designation = et.emp_designation
);

8) Retrieve the job locations from the hiredet_table that have employees with an experience of more than 8 years.
select employee.hiredet_table.work_location from employee.hiredet_table where emp_exp >8;

9) Retrieve the employee details from the employee_table who have the same salary as another employee.
select * from employee.employee_table et where et.emp_salary in (select et.emp_salary from employee.employee_table 
group by emp_salary having count(emp_salary)>1);
#The = operator is used for a direct one-to-one comparison.
#The IN operator allows comparison of a single value against a list or set of values.



10) Retrieve the employee details from the employee_table whose salary is in the top 10 highest salaries.
select * from employee.employee_table order by emp_salary desc limit 10 ;

11) Retrieve the employee details from the employee_table whose salary is above the average salary of all employees.
select * from employee.employee_table et where et.emp_salary >(select avg(emp_salary) from employee.employee_table);

12) Retrieve the job locations from the hiredet_table that have employees with the highest and lowest experience.
select work_location from employee.hiredet_table  where emp_exp in(select max(emp_exp) from employee.hiredet_table union
 select min(emp_exp) from employee.hiredet_table);

13) Retrieve the employee details from the employee_table who have been working for the longest and shortest duration 
(based on the emp_joining date in the hiredet_table).

select employee.employee_table.emp_name, employee.employee_table.emp_designation, employee.hiredet_table.work_location,
employee.hiredet_table.emp_exp, employee.hiredet_table.emp_joining,
employee.employee_table.emp_salary from employee.employee_table left join employee.hiredet_table on
employee.hiredet_table.emp_id = employee.employee_table.emp_id 
where employee.hiredet_table.emp_joining =(select max(emp_joining) from employee.hiredet_table) or 
(select min(emp_joining) from employee.hiredet_table);

How would you find the details of employees who are either 'Managers' or whose salary is 
greater than $60,000?
SELECT * FROM EMPLOYEE.EMPLOYEE_TABLE WHERE EMPLOYEE_TABLE.EMP_SALARY>"720000" OR EMPLOYEE_TABLE.EMP_DESIGNATION="MANAGERS";

How can you retrieve the top 5 highest-paid employees?
SELECT * FROM EMPLOYEE.EMPLOYEE_TABLE ORDER BY EMPLOYEE_TABLE.EMP_SALARY  DESC LIMIT 5;

How can you find the employees whose names have exactly 5 characters?
SELECT * FROM EMPLOYEE.EMPLOYEE_TABLE WHERE LENGTH(EMPLOYEE_TABLE.EMP_NAME)=5;

How would you calculate the total salary and the number of employees for each designation, but only include designations 
with more than 3 employees?

How can you list job locations where the average experience of employees is greater than 5 years?
Conditional Aggregation:

How would you find the average salary of employees for each job location, only considering employees who have more than 2 years of experience?
Joining Tables
Join with Condition:

How can you list all employees along with their job location and joining date, ensuring that employees without a job location are still included?
Multiple Joins:

How would you find the names of employees who have the same job ID but are located in different job locations?
Self Join Challenge:

How can you find pairs of employees who have the same designation and whose salaries differ by less than $10,000?
Data Manipulation and Transformation
Complex Insert:

How would you insert a new employee into employee_table and simultaneously ensure they have a corresponding entry in hiredet_table with their job location and other details?
Conditional Update:

How would you increase the salary by 20% for employees who have more than 10 years of experience and are located in 'New York'?
Conditional Delete:

How can you remove employees from employee_table who have no corresponding entry in hiredet_table?
Advanced Query Techniques
Window Functions:

How would you rank employees by their salary within each job location?
Recursive Queries:

Suppose the employee_table had a manager_id column that references emp_id. How would you write a query to find the hierarchy of employees under a specific manager?
Pivoting Data:

How can you transform the employee_table to show the number of employees and the total salary for each designation in a single query result?
Handling NULL Values:

How can you count the number of employees who do not have a joblocation in the hiredet_table?
Temporal Queries:

How would you find the employees who joined in the last 6 months?
Combining Results:

How can you list all distinct job locations from both the employee_table and hiredet_table?
General Data Management and Integrity
Foreign Key Enforcement:

How would you ensure that every emp_id in hiredet_table must exist in employee_table?
Data Consistency Check:

How would you verify that all employees with a salary above $100,000 are designated as 'Senior' or higher in employee_table?
Normalization Analysis:

If you notice repeating groups in the employee_table, what steps would you take to normalize the table structure?
Index Usage:

How would you create an index to optimize queries that frequently filter employee_table by emp_salary?





