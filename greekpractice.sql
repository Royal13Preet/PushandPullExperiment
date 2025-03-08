/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[category]
      ,[unit_price]
  FROM [GreeksDB].[dbo].[Products]

  

  Select * from Sales
  --Retrieve all columns from the Sales table.

  --Retrieve the product_name and unit_price from the Products table.

  select product_name,unit_price from Products

  --Retrieve the sale_id and sale_date from the Sales table.

  select sale_id,sale_date from sales

  --Filter the Sales table to show only sales with a total_price greater than $100.
  select * from Sales where total_price > 100

  --Filter the Products table to show only products in the 'Electronics' category.
  select * from Products where category = 'Electronics'

  --Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.
  select sale_id, total_price from Sales where sale_date = '2024-01-03'

  --Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.

  select product_id,product_name from Products where unit_price>100

  -- Calculate the total revenue generated from all sales in the Sales table.

  select sum(total_price) from Sales

  -- Calculate the average unit_price of products in the Products table.
  select avg(unit_price) from Products

  --Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
  select sale_id,product_id,total_price from sales where quantity_sold > 4

  -- Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
  select product_name, unit_price from Products order by unit_price desc

 -- Retrieve the total_price of all sales, rounding the values to two decimal places.
 select Round(SUM(total_price),2) from Sales 

 --Calculate the average total_price of sales in the Sales table.
 select avg(total_price) from Sales

--Calculate the total revenue generated from sales of products in the 'Electronics' category.

select Sum(s.total_price) as total_revenue from Sales s
join Products p on s.product_id = p.product_id where category = 'Electronics'

--Retrieve the product_name and unit_price from the Products table,
--filtering the unit_price to show only values between $20 and $600

select product_name, unit_price from Products where unit_price between 20 and 600

 --Calculate the total quantity_sold of products in the 'Electronics' category.
 select sum(s.quantity_sold) from Sales s  join Products p on p.product_id = s.product_id where p.category = 'Electronics'

 -- Retrieve the product_name and total_price from the Sales table, 
 --calculating the total_price as quantity_sold multiplied by unit_price.
 select product_name,(quantity_sold*unit_price) as total_price from Sales s join Products p on s.product_id = p.product_id

 --Calculate the total revenue generated from sales for each product category.
 select sum(total_price) from Sales s join Products p on p.product_id  = s.product_id group by category

 --Find the product category with the highest average unit price.

 select category from Products group by category order by avg(unit_price) desc

 -- Identify products with total sales exceeding 30.
 select p.product_name from Sales s join Products p On s.product_id = p.product_id 
 group by p.product_name having sum(total_price)>30

-- Count the number of sales made in each month.
SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month, COUNT(*) AS sales_count FROM Sales s GROUP BY month;
