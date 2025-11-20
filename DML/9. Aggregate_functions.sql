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
        
SELECT COUNT(*) AS total_sales
FROM products;
-- Returns total number of rows in the table

SELECT SUM(quantity * price) AS total_revenue
FROM products;
-- Calculates total sales value across all records

SELECT AVG(price) AS average_price
FROM products;
-- Returns the mean price of all products sold

SELECT MAX(price) AS highest_price
FROM products;
-- Finds the most expensive product sold

SELECT MIN(price) AS lowest_price
FROM products;
-- Finds the cheapest product sold

