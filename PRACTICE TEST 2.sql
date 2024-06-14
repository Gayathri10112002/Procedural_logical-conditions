create database empl;
create table empl.empmaster(
ecode int,
ename varchar(20),
dob int,
doj int,
salary int
);


insert into empl.empmaster (ecode, ename, dob, doj, salary) values
    ('001', 'abi', '2002-11-10', '2024-08-09', '300000'),
    ('002', 'ashwath', '1999-12-17', '2022-06-12', '500000'),
    ('003', 'buvani', '1997-12-17', '2021-07-18', '654000'),
    ('004', 'chitra', '2000-05-06', '2020-05-12', '59000'),
    ('005', 'charu', '1999-04-02', '2021-04-25', '72000'),
    ('006', 'deetch', '2000-07-07', '2022-04-23', '40000'),    
    ('007', 'deva', '2000-10-09', '2023-05-24', '42000');

select * from empl.empmaster;
update empl.empmaster set ename="devadharshini" where empmaster.ecode="007";
update empl.empmaster set salary="500000" where empmaster.ecode="006";
alter  table empl.empmaster add column designation varchar(50);
alter table empl.empmaster add column doj int;
alter table empl.empmaster add column teamno int;
alter table empl.empmaster modify column designation varchar(20);
alter table empl.empmaster modify column doj date;
alter table empl.empmaster modify column dob date;
alter table empl.empmaster modify column ename varchar(10);
alter table empl.empmaster drop column teamno;
alter table empl.empmaster drop column doj;
alter table empl.empmaster rename column doj to dateofjoining;
alter table empl.empmaster rename column  dateofjoining to doj;
#drop table empl.empmaster;
alter table empl.empmaster drop column designation;
create table empl.empmaster1 like  empl.empmaster;
select * from empl.empmaster1;
insert into empl.empmaster1 (ecode, ename, dob, doj, salary) values
    ('001', 'abi', '2002-11-10', '2024-08-09', '300000'),
    ('002', 'ashwath', '1999-12-17', '2022-06-12', '500000'),
    ('003', 'buvani', '1997-12-17', '2021-07-18', '654000'),
    ('004', 'chitra', '2000-05-06', '2020-05-12', '59000'),
    ('005', 'charu', '1999-04-02', '2021-04-25', '72000'),
    ('006', 'deetch', '2000-07-07', '2022-04-23', '40000'),    
    ('007', 'deva', '2000-10-09', '2023-05-24', '42000');
    
  alter table empl.empmaster1 drop column dateofjoining;  
  drop table empl.empmaster1;
  
  #duplicate table  - to create table and insert values as a duplicate (without manual entry )
  create table empl.empmaster1 as (select * from empl.empmaster);
  select * from empl.empmaster1;
  
  #create new table and insert values from other table
  create table empl.empmaster2 like empl.empmaster; 
  select * from empl.empmaster2;
  alter table empl.empmaster2 drop column designation;
  /*insert into empl.empmaster2 (ecode, ename, dob, doj, salary) values (select * from empl.empmaster);
 insert into empl.empmaster2 (ecode, ename, dob, doj, salary)  from empl.empmaster;
  insert into empl.empmaster2 (ecode, ename, dob, doj, salary) get from  empl.empmaster;
    insert into empl.empmaster2  get from  empl.empmaster;
 insert into empl.empmaster2 values  as (select * from empl.empmaster);*/
insert into empl.empmaster2 select * from empl.empmaster;       #to insert data from other table

alter table empl.empmaster2 add column ID varchar(20) as (concat(ecode, ename));
alter table empl.empmaster2 drop column id ;
alter table empl.empmaster2 add column ID varchar(20) as (concat(ecode," -TM ", ename));
update empl.empmaster2 set ename="devadharshini" where ecode="007";
SET SQL_SAFE_UPDATES = 0;

#cursor

delimiter $$

DECLARE ecode, dob, doj, salary INT;
declare ename varchar (20);
DECLARE emp_cursor CURSOR FOR SELECT * FROM empl.empmaster;
OPEN emp_cursor;
fetch next from emp_cursor into ecode , salary,dob, doj, salary, ename ;
while @@fetch_status =0
begin 
update empmaster set salary= salary* 50%;
where ecode=ecode;
fetch next from emp_cursor into ecode , salary,dob, doj, salary, ename ;
end
close emp_cursor;
deallocate emp_cursor;

delimiter ;

select * from empmaster;

delimiter $$
CREATE PROCEDURE `emp_increases_salary`()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE ecode INT;
    DECLARE emp_salary INT;

    -- Declare cursor for selecting employees
    DECLARE employee_cursor CURSOR FOR
        SELECT ecode, salary
        FROM empmaster;

    -- Error handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN employee_cursor;

    -- Fetch initial row
    FETCH employee_cursor INTO ecode, emp_salary;

    -- Iterate through cursor
    read_loop: LOOP
        -- Check if no more rows
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Update salary (increase by 10%)
        UPDATE empmaster
        SET salary = salary * 50
        WHERE ecode = ecode;
        select salary, empname;
        alter table empmaster add column sv varchar(30) default "employeestatus";
        

        -- Fetch next row
        FETCH employee_cursor INTO ecode, emp_salary;
    END LOOP;

    -- Close cursor
    CLOSE employee_cursor;
    CALL emp_increases_salary();
END 

