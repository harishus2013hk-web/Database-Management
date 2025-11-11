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
select region,sum(quantity*price) as Total_sales
from products
group by region;

-- 2. Find total quantity sold by each salesperson
select salesperson, sum(quantity) as Total_Qty
from products
group by salesperson;

-- 3. Show categories where total quantity sold is more than 30
select category,sum(quantity)
from products
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
select category, count(distinct product) as count_products
from products
group by category;

-- 9 Find total sales per month
select month(sale_date) as Month,sum(quantity*price) as Total_sales
from products
group by month(sale_date);

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
having sum(quantity*price) between 200000 and 100000;

 