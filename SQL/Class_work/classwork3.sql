create database employee ;
use employee;
create table emp(EID int, ENAME varchar(15), EBOD date, EDEDIGATION varchar(20), EMGRID int, ESAL int, EDEPTNO int);
desc emp;
select * from emp;
INSERT INTO emp VALUES
(10101, 'RIYA', '1989-12-02', 'JAVA DEVELOPER', 10106, 25000, 101),
(10102, 'RAHUL', '1990-03-27', 'PYTHON DEVELOPER', 10104, 27000, 102),
(10103, 'PRIYA', '1991-05-25', 'MANUAL TESTER', 10101, 16000, 103),
(10104, 'MAHI', '1985-04-23', 'SENIOR MANAGER', NULL, 50000, 103),
(10105, 'SAYLI', '1991-10-16', 'PYTHON DEVELOPER', 10102, 25000, 101),
(10106, 'DHRUV', '1989-12-22', 'JAVA DEVELOPER', 10104, 30000, 103),
(10107, 'MEERA', '1990-07-15', 'MANUAL TESTER', 10111, 15000, 102),
(10108, 'ROHAN', '1991-06-03', 'JAVA DEVELOPER', 10106, 18000, 101),
(10109, 'RAJ', '1987-02-28', 'AUTOMATION TESTER', 10111, 17000, 101),
(10110, 'AMOL', '1989-05-04', 'PYTHON DEVELOPER', 10102, 23000, 101),
(10111, 'RADHA', '1990-09-18', 'AUTOMAION TESTER', 10104, 20000, 102),
(10112, 'VIKAS', '1993-02-13', 'SALES MANAGER', 10104, 25000, 105);
select ENAME as emplyee_name, ESAL*12 as Anual_Salary from emp;
select ESAL, ESAL+100 from emp;
select ENAME,  EBOD, ESAL/2 from emp;
select ESAL,ESAL-100 from emp;
select ENAME,ESAL from emp where ESAL=20000 ;

select ENAME,ESAL from emp where ESAL!=20000 ;

select ENAME,ESAL from emp where ESAL!=20000 ;

select ENAME,ESAL from emp where ESAL < 20000 ;
select * from emp where ESAL between 20000 and 30000 ;
select * from emp where EID in ( 10101,10104);
select * from emp where EMGRID is null ;
select * from emp where ENAME like "A%";
select * from emp where ENAME like "%A";
select * from emp where ENAME like "%A%";
select *from emp order by ESAL ;
select *from emp order by ESAL desc ;
select *from emp order by ENAME ;
select * from emp where EMGRID=10104 and ESAL> 28000;
select * from emp where EMGRID=10104 or ESAL> 28000;
select lower(ENAME) as Employee_name from emp;
select concat(ENAME," ",ESAL) as Employee_name_With_Salary from emp;
select ename, length(ename) from emp;
select substr(ename,1,2)  from emp;
 select replace("RIYA","Y","N")  from emp;
 select replace(ename,"A","O")  from emp where EID=10108 ;
 select round(34.39);
 select mod(35,4);

select count( ename) from  emp where ESAL=15000;
select count( distinct ESAL ) from  emp;
select min( ESAL) from emp;
select sum( ESAL) from emp;
select emgrid ,count(emgrid)from emp group by emgrid;
select emgrid ,sum(ESAL) from emp group by emgrid;
select emgrid ,sum(ESAL) from emp group by emgrid having sum(ESAL)>45000;
 select emgrid ,sum(ESAL) as total_sal from emp group by emgrid having total_sal>45000;
select distinct(EDEDIGATION) from emp ;
create table student (sid int not null,sname varchar(30));
insert  into student values (null,"Amit");
create table student1 (sid int not null unique,sname  varchar(30));
insert into student1 values
(1,"Nikhil"),
(2,"Neha"),
(3,"Rima");
create table student2 (sid int not null check(sid>0),sname varchar(30));
insert into student2 values
(1,"Nikhil"),
(2,"Neha"),
(3,"Rima");
create table student3 (sid int not null,sname varchar(30),location varchar(30) default "kolkata");
insert into student3 (sid,sname) values(1,"Nikhil");
select * from student3;
insert into student3 values(2,"Neha","Mumbai");
create table  student4 (sid int primary key,sname varchar(30));
insert into student4 values
(1,"Ankita");
insert into student4 values(2,"Amit");
select * from student4;

create table Customer_Detail (c_id int primary key,Customer_Name varchar(30),address varchar(30));
insert into Customer_Detail values
(101,"Adam","Noida"),
(102,"Alex","Delhi"),
(103,"Stuart","Rohtak");
create table Order_Detail (order_id int primary key,Order_Name varchar(30) not null,cid int,foreign key(cid) references Customer_Detail(c_id));
insert into Order_Detail values 
(10,"or1",101),
(11,"or2",103),
(12,"or3",102);
DELETE FROM Order_Detail WHERE order_id=12  ;
select * from Order_Detail;
DELETE FROM Customer_Detail WHERE c_id=102  ;
select * from Customer_Detail;

use employee;
create table student5 (s_id int ,s_name varchar(30));
create table student6 (s_id int ,location varchar(30),mobile_no varchar(30));
insert into student5 values
(1,"Nisha"),
(2,"Mohan"),
(3,"Rahul"),
(4,"Amit"),
(5,"Kajal");
insert into student6 values
(4,"Kolkata","2376800324"),
(5,"Mumbai","4368967899"),
(6,"chennai","5653467821");
-- inner join
select student5.s_id,student5.s_name,student6.location from student5 inner join student6 on 
student5.s_id=student6.s_id;
-- left join
select student5.s_id,student5.s_name,student6.location from student5 left join student6 on 
student5.s_id=student6.s_id;
-- right join
select student5.s_id,student5.s_name,student6.location from student5 right join student6 on 
student5.s_id=student6.s_id;

select * from student5 right outer join student6 on 
student5.s_id=student6.s_id;
-- self join
create table employee1(
emp_id int primary key,
ename varchar(50),
maneger_id int);

insert into employee1 values
(1,"A",null),
(2,"B",1),
(3,"C",1),
(4,"D",2);

select e.ename as employee, m.ename as Manager
from employee1 e left join employee1 m on 
e.maneger_id= m.emp_id;

create table colors(colors varchar(20),shape varchar(20));
create table size(size varchar(20));
insert into colors values("Red","triangle"),("Yellow","Round"),("Orange","Square");
insert into size values("S"),("M"),("XL");
select c.colors as colour,c.shape ,s.size from colors c cross join size s;

SELECT COUNT(*) FROM emp WHERE EDEDIGATION = 'JAVA DEVELOPER';








