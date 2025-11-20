CREATE TABLE products
	(
		sale_id INT PRIMARY KEY,
        product VARCHAR(50),
        category VARCHAR(50),
        quantity INT,
        price DECIMAL(10,2),
        region VARCHAR (50),
        salesperson VARCHAR (50),
        sale_date DATE
    );
INSERT INTO products(sale_id,product,category,quantity,price,region,salesperson,sale_date)
VALUES
		(1,"Laptop","Electronics",5,50000,"East","John","2024-01-05"),
        (2,"Mobile","Electronics",10,20000,"West","Mary","2024-01-10"),
        (3,"Chair","Furniture",20,1500,"East","John","2024-02-15"),
        (4,"Table","Furniture",8,5000,"North","Steve","2024-02-18"),
        (5,"Laptop","Electronics",7,55000,"South","Mary","2024-03-01"),
        (6,"Mobile","Electronics",15,18000,"East","John","2024-03-05"),
        (7,"Sofa","Furniture",3,25000,"West","Steve","2024-03-20"),
        (8,"Laptop","Electronics",2,52000,"North","Mary","2024-04-02"),
        (9,"Chair","Furniture",30,1200,"South","John","2024-04-12"),
        (10,"mobile","Electronics",12,22000,"West","Steve","2024-04-15");

SELECT * FROM products;

-- 1. Find total sales amount for each region.
SELECT
	region,
	sum(quantity*price) as Total_sales
FROM 
	products
GROUP BY
	region;

-- 2. Find total quantity sold by each salesperson
SELECT
	salesperson,
    SUM(quantity) AS Total_Qty
FROM
	products
GROUP BY
	salesperson;

-- 3. Show categories where total quantity sold is more than 30
SELECT
	category,
    SUM(quantity)
FROM
	products
group by category
having sum(quantity)>30;

-- 4 Find total revenue by each category
select category,sum(quantity*price) as Revenue
from products
group by category;

-- 5 Find salesperson who sold total quantity more than 20
select salesperson, sum(quantity) as Qty
from products
group by salesperson
having sum(quantity)>20;

-- 6 Find region-wise average sale price
select region,avg(price) as Average_Price
from products
group by region;

-- 7 Find total revenue for each salesperson and show only those having revenue above 30000
select salesperson, sum(price*quantity) as total_sales
from products
group by salesperson
having sum(price*quantity)>30000;

-- 8 Find how many products each category has.
select category, count(distinct product) as count_productssales2productspersonal_2
from products
group by category;

-- 9 Find total sales per month
select monthname(sale_date) as Month,sum(quantity*price) as Total_sales
from products
group by monthname(sale_date);

-- 10 Find each region's maximum sale price
select region,max(price)
from products
group by region;

-- 11 Find each category's average quantity sold, but show only where avg>10
select category,avg(quantity) as Avg_quantity_more_than_10,(select avg(quantity) from products) as avg_aty
from products
group by category
having avg(quantity)>10;

-- 12 Find total revenue by region and category
select region,category,sum(quantity*price) as revenue
from products
group by region,category;

-- 13 Find how many sales each salesperson made in each region.
select region,salesperson, sum(quantity*price) as total_sales
from products
group by region,salesperson;

-- 14 Find the region where total quantity sold exceeds 20
select region, sum(quantity) as total_qty
from products
group by region
having sum(quantity)>20;

-- 15 Find the salesperson who sold in more than one region
select salesperson,count(distinct region)
from products
group by salesperson
having count(distinct region)>1;

-- 16 Find category having total revenue between 200000 and 1000000
select category, sum(quantity*price) as total_revenue
from products
group by category
having total_revenue between 200000 and 100000;

-- 17 Find top 1 category with the highest total sales.
select
	category,
    sum(quantity*price) as total_sales
from products
group by category
order by total_sales
limit 1;

-- 18 Find salesperson's average sale value per transaction
select
	salesperson,
    avg(quantity*price) as average_sale
from products
group by salesperson;

-- FInd category with minimum average price greater than 20000
select
	category,
    avg(price) as avg_price
from products
group by category
having avg_price>20000
order by avg_price
limit 1;

-- 20 Find region and salesperson combination where revenue>200000
select
	region,
    salesperson,
    sum(quantity*price) as total_revenue
from products
group by region, salesperson
having total_revenue>200000;

USE company;
CREATE TABLE employee_1
	(
		emp_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        department VARCHAR(50),
        salary DECIMAL(10,2),
        hire_date DATE
	);
INSERT INTO employee_1(first_name, last_name, department, salary, hire_date)
VALUES
("John","Doe","IT",60000.00,"2019-01-10"),
("Jane","Smith","HR",55000.00,"2018-03-05"),
("Emily","Jones","IT",62000.00,"2020-07-23"),
("Michael","Brown","Finance",70000.00,"2016-05-14"),
("Sarah","Davis","Finance",69000.00,"2017-11-18"),
("David","Johnson","HR",48000.00,"2021-09-10");
SELECT * FROM employee_1;


-- 1. Find the average salary of employees in each department.
SELECT 
	department,
    AVG(salary) AS average_salary
FROM employee_1
GROUP BY department;

-- 2. Find the total number of employees hired after 2019.
SELECT 
	hire_date,
	COUNT(*) as no_emp,
	(SELECT COUNT(*) FROM employee_1 WHERE YEAR(hire_date)>2019) as tot_count
FROM employee_1
WHERE year(hire_date)>2019
GROUP BY hire_date;

-- 3. List the departments and the total salary of all employees in each department, ordered by the total salary.
SELECT
	department,
    sum(salary) as tot_salary
FROM employee_1
GROUP BY department
ORDER BY sum(salary) DESC;

-- 4.	Find the highest salary in the Finance department. 
SELECT first_name, last_name, salary
FROM employee_1
WHERE department = 'Finance'
	AND salary = (SELECT MAX(salary) FROM employee_1 WHERE department = 'Finance');
    
-- 5.	Get the top 3 highest-paid employees.
SELECT *
FROM employee_1
ORDER BY salary DESC
LIMIT 3;

-- 6.	Find the department with the minimum average salary.
SELECT
	department,
    avg(salary) as average_salary
FROM employee_1
GROUP BY department
ORDER BY avg(salary)
LIMIT 1;

-- 7. Display the total number of employees in each department, ordered by the number of employees.
SELECT
	department,
    count(*) as total_emp
FROM employee_1
GROUP BY department
ORDER BY count(*);

-- 8.	Find the average salary of employees who were hired before 2020.
SELECT
	AVG(salary) as avg_salary
FROM employee_1
WHERE YEAR(hire_date)<2020-01-01;

-- 9.	List the names of employees in the IT department ordered by hire date, with the most recently hired employees first.
SELECT *
FROM employee_1
WHERE department="IT"
ORDER BY hire_date DESC;

-- 10.	Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. 
SELECT
	hire_date,
    sum(salary) as total_salary
FROM employee_1
WHERE hire_date>"2019-01-01"
GROUP BY hire_date
ORDER BY sum(salary) DESC;

-- 11.	Get the employee with the lowest salary in the HR department.
SELECT *
FROM employee_1
WHERE department ="HR"
ORDER BY salary;

-- 12.	Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.
SELECT
	department, 
	SUM(salary) AS total_salary
FROM employee_1
GROUP BY department
ORDER BY total_salary DESC
LIMIT 2;

-- 13.	List all employees hired after 2018, ordered by salary, and show only the first 4 employees. 
SELECT *
FROM employee_1
WHERE year(hire_date)>2018
ORDER BY salary DESC
LIMIT 4;

-- 14.	Find the highest salary in the IT department, but limit the results to the top 1 result.
SELECT *
FROM employee_1
WHERE department="IT"
ORDER BY salary DESC
LIMIT 1;

-- 15. Get the average salary of employees in each department and list only departments with an average salary greater than $60,000.
SELECT
	department,
    avg(salary)
FROM employee_1
GROUP BY department
HAVING avg(salary)>60000;