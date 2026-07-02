
use employee1;
select * from emp;
select ENAME ,ESAL from emp where ENAME ="RAJ";
select ENAME ,ESAL from emp
where ESAL>(select ESAL from emp where ENAME="RAJ");

-- find all employee EDEDIGATION which is RIYA's EDEDIGATION
select ENAME ,EDEDIGATION from emp where ENAME ="RIYA";
select ENAME ,EDEDIGATION from emp where EDEDIGATION=(select EDEDIGATION from emp where ENAME="RIYA");

select ENAME,EID from emp where ENAME like "R%";
-- find the second highest salary from the table
select  max(ESAL) as second_highest_Esal from emp where ESAL <(select max(ESAL) from emp );
-- find all max salary employees
select * from emp where ESAL = (select max(ESAL) from emp );
 -- find all employee earning mor then the avg salary
 select avg(ESAL) from emp;
  select avg(ESAL) as mor_then_the_avg_salary from emp where ESAl>(select avg(ESAL) from emp);
-- find emp who belong of the highest paid salary
select *  from emp where EDEPTNO=(select EDEPTNO from emp where  ESAL=(select max(ESAL) from emp ));



