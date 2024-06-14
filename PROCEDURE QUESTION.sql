#FROM DATE1 TO DATE2 RETRIEVAL USING WHILE LOOP

use empl;
create  table employy(
ecode int ,
ename varchar(10),
dob date,
doj date,
salary int);

select * from employy;

/*
set date1= 2015-09-01 ;
set date2= 2015-09-30;
while date1<=date2 do
 select * from emplooy where doj=date1;
 
 set date1= date_add(date1,  interval 1 day);
 end while;

*/
delimiter $$
create procedure retrievedatee()
begin 
declare done int default 0;
declare ecode int;
declare ename varchar (10);
declare dob, doj date;
declare date1, date2 date;
declare  salary int;
 set date1= '2015-09-01' ;
set date2= '2015-09-30'; 
    SELECT 'Before loop: date1 =', date1, 'date2 =', date2;  
delete from backme;
while date1<=date2 do 
insert into backme select ecode, ename, dob, doj, salary from employy where doj=date1;

/*declare cur cursor for 
declare continue handler for not found set done=1;
open cur;
label:loop
fetch cur into ecode, ename, dob, doj , salary; #as per order of table
if done=1 then leave label;
end if;

end loop;
 close cur;
 set done=0;*/
 set date1= date_add(date1,  interval 1 day);
 end while;
 insert into backme values(ecode, ename, dob, doj, salary);
 SELECT 'After loop: date1 =', date1, 'date2 =', date2;
end $$
delimiter ;
*********************************************************

delimiter $$
create procedure retrievedate()
begin
    declare done int default 0;
    declare ecode_v int;
    declare ename_v varchar(10);
    declare dob_v, doj_v date;
    declare date1, date2 date;
    declare salary_v int;
    set date1 = '2015-09-01';
    set date2 = '2015-09-30';
    delete from backme;
    while date1 <= date2 do
        insert into backme
        select ecode, ename, dob, doj, salary
        from employy
        where doj = date1;

        set date1 = date_add(date1, interval 1 day);
    end while;
end$$
delimiter ;

call retrievedate();

***************************************

delimiter $$
create procedure p_retrievedatee()
begin
    declare done int default 0;
    declare ecode_p int;
    declare ename_p varchar(10);
    declare dob_p date;
    declare doj_p date;
    declare salary_p int;
    declare cur cursor for
        select ecode, ename, dob, doj, salary
        from employy where doj between '2015-09-01' and '2015-09-30';
    declare continue handler for not found set done = 1;
    delete from backme;
    open cur;
    label: loop
        fetch cur into ecode_p, ename_p, dob_p, doj_p, salary_p;
        if done = 1 then
            leave label;
        end if;
        insert into backme values (ecode_p, ename_p, dob_p, doj_p, salary_p);
    end loop;

    close cur;
end$$
delimiter ;

call p_retrievedatee();

*************  SOLUTION  **************

delimiter $$
create procedure v_retrievedate()
begin
    declare date1, date2 date;
    set date1 = '2015-09-01';
    set date2 = '2015-09-30';
    delete from backme;
    while date1 <= date2 do
        insert into backme select ecode, ename, dob, doj, salary from employy where doj = date1;
        set date1 = date_add(date1, interval 1 day);
    end while;
end$$
delimiter ;

call v_retrievedate();
select * from backme;




