/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[Discount]
  FROM [NORTHWND].[dbo].[Order Details]

create function GetcountorderId(
select p.ProductName,orderId,quantity COUNT(o.OrderID) as OrderCount
FROM [NORTHWND].[dbo].[Order Details] o
join [NORTHWND].[dbo].[Products] p ON o.ProductID = p.ProductID
WHERE p.ProductName = 'Tofu'
group by p.ProductName

--get customer order details orderid, quantity,product name,customerid-input

create function GetOrderdetails(@CustomerID nchar(5))
returns table
as
return (select od.OrderId, od.Quantity, p.ProductName from [Order Details] od join Orders o on
o.OrderId = od.OrderId join [Products] p on p.ProductId = od.ProductId where CustomerID = @CustomerID)

select * from dbo.GetOrderdetails('ANATR')


selevt	