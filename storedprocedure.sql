/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ID]
      ,[Name]
      ,[Gender]
      ,[Salary]
      ,[DepartmentId]
      ,[DOB]
  FROM [SampleData].[dbo].[tblEmployee]


update [tblEmployee] set DOB='2024-07-05' where [ID] = 5


create procedure GetAgeUsingCurrentYear
as
begin
select Id, Name, DOB, DATEDIFF(YEAR, DOB, GETDATE()) -
 CASE 
 When Month(DOB) > Month(GetDate()) or (Month(DOB) = Month(GetDate()) and day(DOB) > DAY(GetDate()))
 Then 1 
 else 0 
END as 'Year'
from tblEmployee
end


















SELECT ID,  Name, DOB, DATEDIFF(YEAR, DOB, GETDATE()) - 
    CASE 
        WHEN MONTH(DOB) > MONTH(GETDATE()) 
             OR (MONTH(DOB) = MONTH(GETDATE()) AND DAY(DOB) > DAY(GETDATE())) 
        THEN 1 ELSE 0 
    END AS Years,
    (12 + MONTH(GETDATE()) - MONTH(DOB) - 
        CASE 
            WHEN DAY(DOB) > DAY(GETDATE()) THEN 1 ELSE 0 
        END
    ) % 12 AS Months
FROM 
    tblEmployee


 select ID, Name, DOB, DATEDIFF(year, DOB, getdate()) AS age from  tblEmployee
