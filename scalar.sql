/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [Bikestore].[sales].[customers]
    --customers who as choosen the brandname as
 
create procedure GettheBrandNamestocks
@brand_name varchar(20),
@Total_name varchar(20) out
as 
begin
 select c.first_name from [Bikestore].[sales].[customers] c join [Bikestore].[sales].[orders] o on
  o.customer_id = c.customer_id join [Bikestore].[production].[stocks] s on s.store_id = o.store_id 
  join [Bikestore].[production].[products] p on o.store_id = s.store_id 
  join [Bikestore].[production].[brands] b on b.brand_id = p.brand_id where b.brand_name = @brand_name

end

declare @total_name varchar(20) 
exec dbo.GettheBrandNamestocks 'Electra',@total_name out
print @total_name

--displayed a product id which as not been ordered
select product_id from [Bikestore].[production].[products] where product_id not in (select product_id from [Bikestore].[sales].[order_items])


create function getthebrandnamefunction(@brand_name varchar(20))
returns varchar(20)
as
begin
declare @total varchar(20);
select @total =  c.first_name from production.brands b join production.products p
on b.brand_id= p.brand_id join sales.order_items oi
on oi.product_id=p.product_id join sales.orders o
on o.order_id=oi.order_id join sales.customers c
on c.customer_id=o.customer_id
where b.brand_name=@brand_name
return @total;
end

select dbo.getthebrandnamefunction('Electra')


create function getthefunctioninline(@brand_name varchar(20))
returns table
as
return select c.first_name from production.brands b join production.products p
on b.brand_id= p.brand_id join sales.order_items oi
on oi.product_id=p.product_id join sales.orders o
on o.order_id=oi.order_id join sales.customers c
on c.customer_id=o.customer_id
where b.brand_name=@brand_name

select * from getthefunctioninline('Electra')


create function getthefunctioninline(@brand_name varchar(20))
returns table
as
return select c.first_name from production.brands b join production.products p
on b.brand_id= p.brand_id join sales.order_items oi
on oi.product_id=p.product_id join sales.orders o
on o.order_id=oi.order_id join sales.customers c
on c.customer_id=o.customer_id
where b.brand_name=@brand_name


 





  
 