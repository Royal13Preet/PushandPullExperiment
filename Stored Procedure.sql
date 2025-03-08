--Retrieve Employee Details Along with Department Name
create procedure Employee_AlongwithDeptName
As
Begin
select e.EmpId, e.FirstName, d.DepartmentID from [dbo].[Employees] e join  [dbo].[Departments] d on
e.DepartmentId = d.DepartmentID
End

Exec Employee_AlongwithDeptName

-- Fetch Employees by Department Name
create procedure EmployeesByDepartmentName 
As
Begin
Select e.FirstName, e.LastName, d.DepartmentName from [dbo].[Employees] e join 
Departments d on e.DepartmentId = d.DepartmentID
end

Exec EmployeesByDepartmentName

-- Count Employees in Each Department
create procedure Count_EmployeesinDepartment
As 
Begin
Select d.DepartmentName, count(e.EmpId) as Total_employes from Departments d JOIN Employees e on d.DepartmentId = e.DepartmentId
group by d.DepartmentName
End

Exec Count_EmployeesinDepartment

-- Get Highest Salary in Each Department

create procedure HighestSalary_InEachDepartment
As
Begin
Select d.DepartmentName, Max(e.Salary) as Highest_salary from Employees e join 
Departments d on  d.DepartmentId = e.DepartmentId group by d.DepartmentName
End

Exec HighestSalary_InEachDepartment

--Find Employees Working in a Location

create procedure Employees_therielocation
@Location varchar(50)
As
Begin
select e.FirstName, e.LastName, d.Location from Employees e join  Departments d 
on e.DepartmentId = d.DepartmentId
where d.Location = @Location
end

exec Employees_therielocation 'New york'

--Retrieve Departments with More than 3 Employees (Using GROUP BY & HAVING)

create procedure Departmnetswith3Employee
As
Begin
Select d.DepartmentName, Count(e.EmpID) as employeecount from [Departments] d join Employees e on  e.DepartmentId = d.DepartmentId
group by d.DepartmentName
Having Count(e.EmpID) > 1
end

Exec Departmnetswith3Employee

-- Get Average Salary Per Department (Using GROUP BY)

create procedure averageSalaryperDepartmnet
As
Begin
Select avg(e.Salary) , d.DepartmentName from Departments d join Employees e on e.DepartmentId = d.DepartmentId
group by d.DepartmentName
End

Exec averageSalaryperDepartmnet

--Insert Employee if Not Exists (Using IF NOT EXISTS)

create procedure InserEmployeeifnot
@EmpId int, @firstName varchar(50), @Lastname varchar(20), @DepartmentId int, @Salary Decimal(10,2)
As
Begin
      If not Exists (select 1 from Employees where FirstName = @firstName and LastName = @Lastname) 
	  Begin
	  Insert into Employees (EmpId, FirstName, LastName, DepartmentId, Salary, HireDate)
	  Values (@EmpId, @firstName, @lastName, @DepartmentId,  @Salary, GetDate());
	  End 
End

Exec InserEmployeeifnot 112, 'Alice', 'Miller' , 3, 43532

--Update Employee’s Salary if They Exist (Using IF Condition)
create procedure InsertEmployeeSalaryifexists
@EmpID int ,
@Salary Decimal(10,2)
As 
Begin
   If Exists (select 1 from Employees Where EmpID = @EmpID)
   Begin 
		 Update Employees set Salary = @Salary where EmpID = @EmpID
   End
   else
   Begin 
   Print 'employee not found';
   end
end

Exec InsertEmployeeSalaryifexists 211, 423222

--Delete Employees Who Have Less than 2 Years of Experience
DROP PROCEDURE IF EXISTS DeleteEmployeesless2yearsofexperience
create procedure DeleteEmployeesless2yearsofexperience
As
Begin
  DELETE FROM Employees WHERE HireDate >  DATEADD(YEAR, -2, GETDATE())
End

Exec DeleteEmployeesless2yearsofexperience

--Transfer an Employee to a Different Department (Using UPDATE)

CREATE PROCEDURE TransferEmployee
    @EmpID INT, 
    @DepartmentID INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Employees WHERE EmpID = @EmpID) 
	Begin
        UPDATE Employees SET DepartmentID = @DepartmentID WHERE EmpID = @EmpID;
		End
    ELSE
	Begin
       Print 'Employee Not Found';
    END 
END 

Exec TransferEmployee 110, 4

--Find the Department with the Highest Average Salary

CREATE PROCEDURE GetTopPayingDepartment
As
BEGIN
    SELECT TOP 1 d.DepartmentName, AVG(e.Salary) AS AvgSalary
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY d.DepartmentName
    ORDER BY AvgSalary DESC
END 

Exec GetTopPayingDepartment


    UPDATE Employees 
    SET Salary = 
        CASE 
            WHEN Salary > 80000 THEN Salary * 1.10
            ELSE Salary * 1.05
        END;

--Automatically Promote Employees with High Performance (Using UPDATE & CASE)
create procedure promoteswithHigherPerfomance
As
Begin
Update Employees Set Salary = 
   Case 
   When Salary > 80000 Then Salary * 1.10
       else salary * 1.05
	End
End

Exec promoteswithHigherPerfomance