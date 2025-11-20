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
        
-- 1. Sort products by price in ascending order (cheapest first)
SELECT * FROM products
ORDER BY price ASC;

-- 2. Sort sales by sale_date in descending order (latest sales first)
SELECT * FROM products
ORDER BY sale_date DESC;

-- 3. Sort by region alphabetically, then by salesperson within each region
SELECT * FROM products
ORDER BY region ASC, salesperson ASC;

-- 4. Sort by category descending (Furniture before Electronics), then by price ascending
SELECT * FROM products
ORDER BY category DESC, price ASC;

-- 5. Sort by total sale value (quantity × price) in descending order
SELECT *, quantity * price AS total_value
FROM products
ORDER BY total_value DESC;