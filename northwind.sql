Create table categories(category_id int primary key, category_name varchar(50), description varchar(max), picture image)
select * from categories

create table suppliers(supplier_id int primary key,company_name varchar(50),contact_name varchar(50),
                      contact_title varchar(50),address varchar(50),city varchar(50), region varchar(50),
					  postal_code varchar(50),country varchar(50),phone varchar(50),fax varchar(50),homepage varchar(50))
select * from suppliers

Create table products(product_id int primary key,product_name varchar(50),supplier_id int, 
                     category_id int,quantity_per_unit varchar(50),unit_price int,units_in_stock int,
					 unit_on_order int,reorder_level int,discontinued int, foreign key(category_id) 
					 references categories(category_id),foreign key(supplier_id) references suppliers(supplier_id))
select * from products

create table customers(customer_id varchar(50) primary key,company_name varchar(50),
						contact_name varchar(50) ,contact_title varchar(50),address varchar(60),city varchar(50),
						region varchar(50),postal_code varchar(50),country varchar(50), phone varchar(50),fax varchar(60))
select * from customers

create table employees(employee_id int primary key,last_name varchar(50),first_name varchar(50),
					title varchar(50),title_of_country varchar(50),birth_date date,hire_date date,address varchar(50),
					city varchar(50),region varchar(50),postal_code varchar(50),country varchar(50),home_phone varchar(50),
						extension varchar(50), photo image,notes varchar(50),reports_to int,photo_path varchar(50))
select * from employees

create table orders(order_id int primary key,customer_id varchar(50),employee_id int,order_date date,required_date date,
					shipped_date date,ship_via int,freight int,ship_name varchar(50),ship_address varchar(50),ship_city varchar(50),
					ship_region varchar(50),ship_postal_code varchar(50),ship_country varchar(50),foreign key(customer_id) 
					references customers(customer_id),foreign key(employee_id) references employees(employee_id))
select * from orders

create table order_details(order_id int ,product_id int , unit_price int,quantity int,discount int,foreign key(order_id) 
							references orders(order_id),foreign key(product_id) references products(product_id))
select * from order_details

create table customer_demographics(customer_type_id varchar(50) primary key, customer_desc varchar(50))
select * from customer_demographics

create table customer_customer_demo(customer_id varchar(50),customer_type_id varchar(50),foreign key(customer_id) 
									references customers(customer_id),foreign key(customer_type_id) 
									references customer_demographics(customer_type_id))
select * from customer_customer_demo

create table region(region_id int primary key, region_description varchar(50))
select * from region

create table territories(territory_id  varchar(50) primary key,territory_description varchar(max),
						region_id int,foreign key(region_id) references region(region_id))
select * from territories


create table employee_territories(employee_id int,territory_id varchar(50), foreign key(employee_id) 
								references employees(employee_id), foreign key(territory_id) references territories(territory_id))
select * from employee_territories

create table shippers(shipper_id int primary key,company_name varchar(50), phone varchar(50))
select * from shippers

create table us_states(state_id int primary key,state_name varchar(50),state_abbr varchar(50),state_region varchar(50))
select * from us_states