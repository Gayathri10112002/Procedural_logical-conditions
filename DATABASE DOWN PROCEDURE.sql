#ONLY DATABASE AND DOWN PROCEDURE

create database emp;
CREATE TABLE employeee (
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
job_desc VARCHAR(20),
salary INT );
INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000);
INSERT INTO employee VALUES(3,'George','SALES',2000000);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000);
INSERT INTO employee VALUES(5,'Meena','HR',2000000);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000);
select * from employee;

select * from employee
where ename="Ramya";

select * from employee
where ename<>"Ramya";
********************************************

use employee;
create table backupemployee(emp_id int primary key,
emp_name varchar(30),
emp_designation varchar(50),
emp_salary int
);

select * from backupemployee;

***************************************************
# FILTER FROM 60K - 70K AND UPDATE THEM 1.1 SAL INCREMENT 

delimiter $$
create procedure sv_employee()
begin
declare sal1,sal2 int;
set sal1= 60000;
set sal2 = 80000;
delete from backupemployee;
while sal1<=sal2 do insert into backupemployee select emp_id, emp_name , emp_designation ,emp_salary 
from employee_table where emp_salary=sal1;
set sal1= sal1 + 10000;
end while;
update backupemployee set emp_salary=emp_salary*1.1 where emp_id =emp_id;
end $$
delimiter ; 

call sv_employee();

***************************************************************
# FILTER FROM 60K - 70K 

delimiter $$
create procedure v_employee()
begin
declare sal1,sal2 int;
set sal1= 60000;
set sal2 = 80000;
delete from backupemployee;
while sal1<=sal2 do insert into backupemployee select emp_id, emp_name , emp_designation ,emp_salary 
from employee_table where emp_salary=sal1;
set sal1= sal1 + 10000;
end while;


end $$
delimiter ; 

call v_employee();


