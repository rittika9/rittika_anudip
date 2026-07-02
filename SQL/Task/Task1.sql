create  database employee1;
use employee1;
create table emp(
EID int,
ENAME varchar(15),
EDOB date,
EDEDIGATION varchar(20),
 EMGRID int, 
 ESAL int, 
 EDEPTNO int);
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
select * from emp;
select ENAME,ESAL from emp where ESAL>15000;
select ENAME,ESAL from emp where ESAL between 15000 and 25000;
select ENAME,EID,EDOB from emp where year(EDOB)=1990;
select ENAME from emp where ENAME like "S%";
select ENAME from emp where ENAME like "%A%" and ENAME like "%H%";
select ENAME,EID,EDOB from emp where year(EDOB)=1990 order by EDOB asc;
select max(ESAL) as maximun, min(ESAL) as minimum from emp ;
select EDEDIGATION,max(ESAL) as maximun, min(ESAL) as minimum,sum(ESAL) as total, avg(ESAL) as avg_salary from emp group by EDEDIGATION;
select EMGRID ,count(*) from emp group by EMGRID having count(*)>1;
SELECT COUNT(DISTINCT EMGRID) as Number_of_managers FROM emp;
select max(ESAL)-min(ESAL) as Range_of_salary from emp;
select EDEDIGATION from emp group by EDEDIGATION having count(*)>2;
select EDEDIGATION,AVG(ESAL) AS average_salary from emp group by EDEDIGATION having avg(ESAL) > 20000;
select EDEDIGATION,ESAL  from emp group by ESAL=50000 having avg(ESAL=50000);





