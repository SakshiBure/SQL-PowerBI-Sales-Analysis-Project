create database Sample1
use Sample1
create table Customers(
customer_id int identity primary key,
name varchar(100) not null,
city varchar(100) not null,
country varchar(100) not null 
);
select * from Customers
INSERT INTO Customers (name, city, country) VALUES 
('Ajay', 'Pune', 'India'),
('Raj', 'New York', 'USA'),
('Sagar', 'Mumbai', 'India'),
('Niya', 'Los Angeles', 'USA'),
('Riya', 'Hyderabad', 'India'),
('Jay', 'Paris', 'France'),
('Shyam', 'Pune', 'India'),
('Rina', 'Chicago', 'USA'),
('Diya', 'Pune', 'India'),
('Anvit', 'Delhi', 'India'),
('Rahul', 'Bangalore', 'India'),
('Aman', 'Houston', 'USA'),
('Sneha', 'Seattle', 'USA'),   
('Karan', 'London', 'UK'),
('Meera', 'Dubai', 'UAE');




create table Orders(
order_id int primary key identity(101,1),
customer_id int constraint cid  references Customers(customer_id),
order_date date,
total_amount int );
select * from Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2026-01-05', 2500.00),
(2, '2026-01-10', 5400.50),
(3, '2026-01-12', 1200.75),
(4, '2026-01-15', 999.99),
(5, '2026-01-18', 4300.00),
(6, '2026-01-20', 2750.25),
(7, '2026-01-22', 1500.00),
(8, '2026-01-25', 3200.80),
(9, '2026-01-28', 4100.40),
(10, '2026-02-01', 2200.00),
(11, '2026-02-03', 1800.60),
(12, '2026-02-05', 7600.00),
(13, '2026-02-08', 890.00),
(14, '2026-02-10', 3400.90),
(15, '2026-02-12', 6100.75);



create table Products(
product_id int primary key identity(201,1),
product_name varchar(100) not null,
category varchar(100) ,
price int,
stock int);
select * from Products
INSERT INTO Products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Smartphone', 'Electronics', 25000.00, 25),
('Headphones', 'Electronics', 1500.00, 50),
('Keyboard', 'Electronics', 1200.00, 40),
('Mouse', 'Electronics', 800.00, 60),
('Refrigerator', 'Appliances', 30000.00, 8),
('Washing Machine', 'Appliances', 28000.00, 6),
('Microwave', 'Appliances', 9000.00, 15),
('Sofa', 'Furniture', 45000.00, 5),
('Dining Table', 'Furniture', 22000.00, 7),
('Chair', 'Furniture', 2500.00, 30),
('T-shirt', 'Clothing', 700.00, 100),
('Jeans', 'Clothing', 1800.00, 75),
('Shoes', 'Footwear', 3500.00, 40),
('Watch', 'Accessories', 5000.00, 20);




create table Order_details(
order_detail_id int primary key identity(301,1),
order_id int constraint oid references Orders(order_id),
product_id int constraint pid references Products(product_id),
quantity int,
price int );
select * from Order_details
INSERT INTO Order_details (order_id, product_id, quantity, price) VALUES
(101, 201, 1, 55000),
(101, 203, 2, 1500),
(102, 202, 1, 25000),
(102, 205, 3, 800),
(103, 204, 2, 1200),
(104, 206, 1, 30000),
(105, 207, 1, 28000),
(106, 208, 2, 9000),
(107, 209, 1, 45000),
(108, 210, 1, 22000),
(109, 211, 4, 2500),
(110, 212, 5, 700),
(111, 213, 2, 1800),
(112, 214, 1, 3500),
(113, 215, 2, 5000);


create table Employees(
employee_id int primary key identity(401,1),
name varchar(100)not null,
department varchar(100)not null,
salary int,
hire_date date );
select * from Employees
INSERT INTO Employees (name, department, salary, hire_date) VALUES
('Amit Sharma', 'IT', 60000, '2023-01-15'),
('Neha Patil', 'HR', 45000, '2022-03-20'),
('Rahul Verma', 'Finance', 55000, '2021-07-10'),
('Priya Singh', 'Marketing', 50000, '2023-05-18'),
('Karan Mehta', 'IT', 75000, '2020-11-25'),
('Sneha Joshi', 'Sales', 48000, '2022-08-12'),
('Vikas Rao', 'Operations', 52000, '2021-09-30'),
('Anjali Desai', 'HR', 47000, '2023-02-14'),
('Rohit Kulkarni', 'IT', 82000, '2019-06-22'),
('Meera Nair', 'Finance', 61000, '2022-12-05'),
('Sanjay Gupta', 'Sales', 53000, '2021-04-17'),
('Pooja Shah', 'Marketing', 49000, '2023-07-01'),
('Arjun Kapoor', 'Operations', 58000, '2020-10-09'),
('Nikita Reddy', 'IT', 67000, '2022-01-11'),
('Manish Yadav', 'Finance', 64000, '2019-03-27');
