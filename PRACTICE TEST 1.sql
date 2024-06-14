# 1 ST PRACTICE TEST

create database studentdb;
create table studentdb.student(
   Student_id int primary key,
   student_name varchar(30),
   section varchar(10),
   grade varchar(10)
);

 select * from studentdb. student; 
 
 DESCRIBE STUDENTDB.STUDENT;
Insert into studentdb. student (Student_id ,
   student_name ,
   section,
   grade) values 
('001', 'Abi', 'A', 'A+'),
('002','Buvani','A', 'O'),
('016','Charu','A','B'),
('045','Haritha','A','B+'),
('036', 'deetch','B','O'),
('063', 'Jerome', 'B','O');

alter table studentdb.student add department varchar(10); 

update studentdb.student set student_name =" aisu"  where student_id="001" ;

alter table studentdb.student drop department;

select student_id, student_name from studentdb.student;


 select * from studentdb. student; 