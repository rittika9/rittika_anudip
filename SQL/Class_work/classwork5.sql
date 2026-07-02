create database class5;
use class5;

CREATE TABLE Employee1 (
    Emp_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender varchar(15),
    Department VARCHAR(50),
    Salary double,
    Hire_Date DATE,
    City VARCHAR(50)
);
INSERT INTO Employee1
(Emp_ID, First_Name, Last_Name, Gender, Department, Salary, Hire_Date, City)
VALUES
(101, 'Amit', 'Sharma', 'Male', 'HR', 45000.00, '2022-01-15', 'Kolkata'),
(102, 'Priya', 'Singh', 'Female', 'Finance', 60000.00, '2021-06-20', 'Delhi'),
(103, 'Rahul', 'Verma', 'Male', 'IT', 75000.00, '2020-03-10', 'Bengaluru'),
(104, 'Sneha', 'Roy', 'Female', 'Marketing', 55000.00, '2023-02-18', 'Kolkata'),
(105, 'Arjun', 'Das', 'Male', 'IT', 80000.00, '2019-09-25', 'Hyderabad'),
(106, 'Neha', 'Gupta', 'Female', 'Sales', 48000.00, '2022-11-05', 'Mumbai'),
(107, 'Vikram', 'Patel', 'Male', 'Finance', 65000.00, '2021-08-12', 'Ahmedabad'),
(108, 'Ananya', 'Sen', 'Female', 'HR', 47000.00, '2024-01-08', 'Kolkata'),
(109, 'Rohan', 'Mehta', 'Male', 'Sales', 52000.00, '2023-05-17', 'Pune'),
(110, 'Kavita', 'Nair', 'Female', 'Marketing', 58000.00, '2020-12-01', 'Chennai');


--     .......................... view ...........................                   

select * from Employee1;
create view emp_details as select Emp_ID,First_Name,Last_Name,Department from Employee1;
select * from emp_details;
create view emp_high_sal as select Emp_ID,First_Name,Salary from Employee1 where salary>55000;
select * from emp_high_sal;
create view emp_it as select * from Employee1 where Department="IT";
select * from emp_it;
create view emp_details_1 as select Emp_ID,concat(First_Name," ",Last_Name)as full_name, Salary from Employee1 ;
select * from emp_details_1;
create view emp_details_2 as select Department, avg(Salary) as Avg_Salary from Employee1 GROUP BY 
    Department; 
select * from emp_details_2;
-- add new column...........................
create view sal_category as select Emp_ID,Salary, 
                                 case 
							       when Salary<50000 then "Low"
                                    when Salary between 50000 and 70000 then "Medium"
                                    else "High"
                                    end as Category 
                                    from Employee1;
                                    
--     .......................... Limit ...........................                   
                                    
select * from sal_category;
select * from Employee1 limit 2;
select * from Employee1 order by salary desc limit 1;
select * from Employee1;
-- 1st one skip rows and 2nd show the row
select * from Employee1 limit 2,4;
-- second highest salary
select * from Employee1 order by salary desc  limit 1,1;



--      .......................... delimiter ...........................                   

DELIMITER //
create procedure GetEmployeeByID(IN employeeID int)
BEGIN
select * from employee1 where Emp_ID = employeeID;
END //
DELIMITER ;
call GetEmployeeByID(101);


DELIMITER //
create procedure GetEmployeeByDepartment(IN depart VARCHAR(30))
 BEGIN
 select * from employee1 where Department = depart ;
 END //
 DELIMITER ;
 call GetEmployeeByDepartment("IT");
 
 -- display the emp with salary given the amount
 DELIMITER //
create procedure GetEmployeeBysalary(IN Sal double)
BEGIN
select * from employee1 where Salary = Sal;
END //
DELIMITER ;
  call GetEmployeeBysalary(45000.00);


DELIMITER //
create procedure GetEmployeeSummary()
BEGIN
      select
  Department,
  count(*) as Total_Employee,
  sum(Salary)  as Total_Salary ,  
  avg(Salary) as Avg_Salary,
  max(Salary) as max_Salary,
  min(Salary) as min_Salary
      from employee1 group by Department ;
END //
DELIMITER ;
call GetEmployeeSummary();


DELIMITER //
create procedure GetTotal_Employee(out total int)
BEGIN
select count(*) into total from employee1;
END //
DELIMITER ;
call GetTotal_Employee(@total);
select @total;


DELIMITER //
create procedure GetRetunAvgSalary(out sal int)
BEGIN
select avg(Salary) into sal from employee1;
END //
DELIMITER ;
call GetRetunAvgSalary(@sal);
select @sal;

-- display the retun total number of employee in specific depertment
      -- in_out
      
DELIMITER $$
CREATE procedure GetEmployeeNosbyDept_IN_OUT(in dept varchar(30),out emp_no int)
BEGIN
Select count(*) into emp_no from employee1 where Department=dept;
END $$
DELIMITER ;
call GetEmployeeNosbyDept_IN_OUT("IT",@emp_no);
select @emp_no;
