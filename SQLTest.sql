create table Department(Dept_Id int primary key, Dept_name varchar(20), Location varchar(20))


create table Employee(emp_Id int primary key, Emp_name varchar(20), Age int, Dept_Id int, Salary int,address varchar(20), 
foreign key(Dept_Id) references Department(Dept_Id))

select * from Employee  
INSERT INTO Department (Dept_Id, Dept_name, Location) 
VALUES (1, 'Sales', 'New York'),
       (2, 'HR', 'San Francisco'),
       (3, 'IT', 'Los Angeles'),
       (4, 'Finance', 'Chicago'),
       (5, 'Marketing', 'Houston');
INSERT INTO Employee (emp_Id, Emp_name, Age, Dept_Id, Salary, address)
VALUES 
      
       (102, 'Jane Smith', 28, 2, 60000, 'San Francisco'),
       (103, 'Mike Johnson', 35, 3, 75000, 'Los Angeles'),
       (104, 'Emily Davis', 40, 4, 80000, 'Chicago'),
       (105, 'Sarah Wilson', 27, 5, 55000, 'Houston'),
    (106, 'Robert Brown', 32, 1, 52000, 'New York'),
    (107, 'Alice Green', 29, 1, 51000, 'New York'),
    (108, 'David White', 33, 2, 62000, 'San Francisco'),
    (109, 'Olivia Harris', 26, 2, 58000, 'San Francisco'),
    (110, 'Chris Martin', 31, 3, 77000, 'Los Angeles'),
    (111, 'Sophia Clark', 28, 3, 73000, 'Los Angeles'),
    (112, 'Daniel Lee', 45, 4, 85000, 'Chicago'),
    (113, 'Mia Lopez', 37, 4, 81000, 'Chicago'),   
    (114, 'James Hall', 30, 5, 56000, 'Houston'),
    (115, 'Emma Turner', 25, 5, 54000, 'Houston');
	INSERT INTO Employee (emp_Id, Emp_name, Age, Dept_Id, Salary, address)
VALUES 
    -- Employees in 'Sales' Department (Dept_Id = 1)
    (116, 'Paul Adams', 24, 1, 45000, 'New York'),
    (117, 'Linda Scott', 26, 1, 48000, 'New York'),

    -- Employees in 'HR' Department (Dept_Id = 2)
    (118, 'Kevin Baker', 29, 2, 47000, 'San Francisco'),
    (119, 'Grace Johnson', 25, 2, 46000, 'San Francisco'),

    -- Employees in 'IT' Department (Dept_Id = 3)
    (120, 'Brian Miller', 22, 3, 49000, 'Los Angeles'),
    (121, 'Julia Martinez', 28, 3, 48000, 'Los Angeles'),

    -- Employees in 'Finance' Department (Dept_Id = 4)
    (122, 'Charles Harris', 30, 4, 48000, 'Chicago'),
    (123, 'Natalie Clark', 26, 4, 47000, 'Chicago'),

    -- Employees in 'Marketing' Department (Dept_Id = 5)
    (124, 'Joshua King', 27, 5, 45000, 'Houston'),
    (125, 'Sophie Lee', 24, 5, 43000, 'Houston');


select * from Employee
--write an sql query to insert a new employee into employee table with the value('john Doe', 'Sales', 50000)
INSERT INTO Department (Dept_Id, Dept_name, Location) 
VALUES (1, 'Sales', 'New York')
INSERT INTO Employee (Emp_Id,Emp_name, Dept_Id, Salary) 
VALUES (101, 'John Doe', (Select Dept_ID from Department where Dept_name = 'sales'),50000)
--write a sql query to delete employee from the employee table where emp_id = 103
delete from Employee where emp_Id = 103
--update salary where emp_id = 103
update Employee set Salary = 60000 where emp_Id = 106

--write a query to select all employees who work in hr
select * from Employee where Dept_Id In (select Dept_Id from Department where Dept_name = 'HR')
--write a query to find employess whose salary is between 40000 and 60000
select* from Employee where Salary between 40000 and 60000
--Write a query to select employees whose name start with 'j'
select * from Employee where Emp_name like 'j%'
--write a query to find employees who work in either 'sales' or 'marketing'
SELECT * FROM Employee WHERE Dept_Id IN (SELECT Dept_Id FROM Department WHERE Dept_name IN ('Sales', 'Marketing'))
--write a query to select employeess who have either null or a specific value eg:1000 in the commision column
SELECT * FROM Employee WHERE commission IS NULL OR commission = 1000;

--write query to select all distinct salaries from the employee table
select distinct(salary) from Employee

--write a query to count all the total numbers of employees in each department & use alias name
select Dept_Id,(select dept_name from Department where Dept_Id = Employee.Dept_Id) as Dept_name,
count(*) as Total_employee from Employee group by Dept_Id

--write a query to get average salary of employess in the finace department nad use alaias
select avg(salary) as averagesalry from Employee where Dept_Id = (select dept_id from department where Dept_name='Finance')

select Max(Salary), Min(Salary) from Employee

--Concat
  select concat(FirstName,' ',LastName) as full_name from [NORTHWND].[dbo].[Employees] 

---select getlen

Select Emp_name,Len(Emp_name) from Employee

--write a query to convert employees names to UPPPERCAse

select UPPER(Emp_name) from Employee

--write a query to find a employee whose salary is equal to any of the salaries in the 
--Employees table that are grater than 5000
SELECT * FROM Employee WHERE Salary IN (SELECT Salary FROM Employee WHERE Salary > 50000);

--write a query using having clause to find departments with more than 5 employess

select Dept_Id ,(select Dept_name from Department where Dept_Id = Employee.Dept_Id) as dept_name, count(*)
as total_employee from Employee group by Dept_Id having count(*)>5


--write a query to check if there are any employees with a null value in the commision column using exists operator
select 'employee with null' as result where exists(select 1 from Employee where commission is null)

--write a query to return the department and the total salary of employees for each department group by clause

select dept_name as department, SUM(e.Salary) as total_salary from employee e
join 
department d on e.Dept_Id = d.Dept_Id group by dept_name

--write a query to use case statement to create a new column Salary Grdae which 
--categories employees based on theier salary('high','Medium','low')

select emp_Id, Emp_name, Salary ,
CASE 
when Salary > 60000 then 'high'
when Salary > 50000 and Salary < 60000 then 'Medium'
else 'low'
end as salary_grade
from employee

--write a sql query to retireve list of employess laong with thrie dipartment name and location 
select e.Emp_name, e.Age, e.Salary, d.Dept_name, d.Location from Employee e JOIN Department d ON e.Dept_Id = d.Dept_Id

--write sql queries to retrieve lists of employess names and department names from both the employee and 
--department tables ensure that the results from employee and department 
--are combined into a single list, where each result contains the name of the entity
select Emp_name , 'Employee' as EntityType from Employee UNION Select Dept_name, 'Department' from Department

--write a query to display last_name, first_name and salary of all employees who earn more thatn panday(pandya is lastname)
SELECT last_name, first_name, salary
FROM Employee
WHERE salary > (SELECT salary FROM Employees WHERE last_name = 'Pandya');
