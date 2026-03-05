----------Basic Filtering & Sorting-------------------
--1.Retrieve all customers from USA sorted by name in asending Order.
select * from Customers where country='USA' order by name 
--2.Find products with a price between 3000 and 5000.
select * from Products where price between 3000 and 5000
--3.Display the top 5 highest-paid employees.
select top 5 * from Employees order by salary desc 
-----------------Aggregate Functions---------------------
--4.Find the total number of orders placed.
select count(*)as"Order_Place" from Order_details 
--5.Calculate the average salary of employees in each department.
select department,avg(salary)as"Average salary" from Employees group by department
--6.Find the total revenue generated from all orders.
select sum(total_amount)as"Total_Revenue" from Orders
------------- GROUP BY & HAVING----------------------------
--7.Count how many customers are there in each country.
select country,count(*)as"Customers" from Customers group by country
--8.Find departments where the average salary is greater than 50,000.
select department,avg(salary) as"Avg" from Employees group by department having avg(salary)>50000
--9.Find customers who have placed more than 5 orders.
SELECT customer_id,COUNT(*) AS "Order_Place" FROM Orders GROUP BY customer_id HAVING COUNT(*) > 5;
------------------------ Joins--------------------------------
--10.Display all orders along with the customer name.
select c.customer_id,o.order_id,* from 
Customers c join Orders o 
on c.customer_id=o.customer_id
--11.Show product names and quantities sold.
select p.product_name,o.quantity from 
Products p join Order_details o 
on p.product_id=o.product_id
--12.List employees who have not placed any orders (assume employees handle orders).
SELECT c.customer_id,c.name
FROM Customers c LEFT JOIN Orders o
ON c.customer_id = o.customer_id LEFT JOIN Order_details od
ON o.order_id = od.order_id WHERE od.order_id IS NULL;
---------------------- Subqueries-----------------------
--13.Find the second highest salary from Employees table.
select max(salary) as"Second_Highest" from Employees where salary <(select max(salary) from Employees)
--14.Retrieve products that cost more than the average product price.
SELECT product_id,product_name,price FROM Products WHERE price > (SELECT AVG(price) FROM Products);
--15.Find customers who have placed orders worth more than 10,000 total.
SELECT c.customer_id,c.name,SUM(od.quantity * od.price) AS Total_Amount
FROM Customers c JOIN Orders o
ON c.customer_id = o.customer_id JOIN Order_details od
ON o.order_id = od.order_id GROUP BY c.customer_id, c.name
HAVING SUM(od.quantity * od.price) > 10000;
-------------Date Functions---------------
--16.Find orders placed in the last 30 days.
SELECT * FROM Orders
WHERE CAST(order_date AS DATE) >= CAST(DATEADD(DAY, -30, GETDATE()) AS DATE);
--17.Display employees hired in the current year.
SELECT * FROM Employees WHERE YEAR(hire_date) = YEAR(GETDATE());
--------------Advanced Queries--------------------
--18.Rank employees based on salary using window functions.
SELECT employee_id,name,department,salary,RANK() OVER (ORDER BY salary DESC) AS "Salary_Rank" FROM Employees;
--19.Find the cumulative sales amount by order date.
SELECT order_date,SUM(daily_sales) OVER (ORDER BY order_date) AS Cumulative_Sales
FROM (SELECT o.order_date,SUM(od.quantity * od.price) AS daily_sales
FROM Orders o JOIN Order_details od ON o.order_id = od.order_id
GROUP BY o.order_date) AS sales_data ORDER BY order_date;
--20.Identify the top-selling product (based on quantity sold).
SELECT TOP 1 p.product_id,p.product_name,SUM(od.quantity) AS Total_Quantity_Sold
FROM Products p JOIN Order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Total_Quantity_Sold DESC;