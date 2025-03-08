/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CategoryID]
      ,[CategoryName]
      ,[Description]
      ,[Picture]
  FROM [NORTHWND].[dbo].[Categories]

 CREATE TABLE Numbers (
    ID INT,
    Value FLOAT
);
Alter table Numbers add Description varchar(50)

truncate table Numbers

INSERT INTO Numbers (ID, Value, Description)
VALUES (1, 25.64,'PreeT'),
       (2, 144.0,'poojas'),
       (3, -12.45,'PRIYA'),
       (4, 100.0,'SIdd');

select CEILING(10.25) as 'values'

select CEILING(-7.8) as 'values'

select CEILING(20.0) as 'values'


Select CEILING(Value) as afterceil from Numbers

SELECT ID, Value, ABS(Value) AS AbsoluteValue FROM Numbers

SELECT ID, Value, POWER(Value, 2) AS SquaredValue
FROM Numbers;

SELECT ID, Value, SQRT(Value) AS SquareRoot
FROM Numbers
WHERE Value > 0

SELECT ID, Value, ROUND(Value,0) AS RoundedValue
FROM Numbers


SELECT CONCAT(ID,'-', Description) AS Description
FROM Numbers

select * from Numbers

SELECT ID, LEN(Description) AS ValueLength
FROM Numbers

SELECT UPPER(Description) AS UpperCase from Numbers


Select LOWER(Description) AS LowerCase from Numbers




SELECT RAND() AS RandomNumber;


SELECT ID, RAND(ID) AS RandomValue
FROM Numbers;