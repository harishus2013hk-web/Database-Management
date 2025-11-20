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
        
-- 1. Get the first 3 sales records
SELECT * FROM products
LIMIT 3;

-- 2. Get the top 5 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

-- 3. Get the first 2 furniture items
SELECT * FROM products
WHERE category = 'Furniture'
LIMIT 2;

-- 4. Get the first 4 sales made by John
SELECT * FROM products
WHERE salesperson = 'John'
LIMIT 4;

-- 5. Get the first 3 sales from the West region
SELECT * FROM products
WHERE region = 'West'
LIMIT 3;

-- 1. Skip the first 2 records, then return the next 3
SELECT * FROM products
LIMIT 3 OFFSET 2;

-- 2. Skip the first 5 most expensive products, then return the next 2
SELECT * FROM products
ORDER BY price DESC
LIMIT 2 OFFSET 5;

-- 3. Skip the first 3 sales by Mary
SELECT * FROM products
WHERE salesperson = 'Mary'
LIMIT 2 OFFSET 3;

-- 4. Skip the first 4 electronics sales
SELECT * FROM products
WHERE category = 'Electronics'
LIMIT 2 OFFSET 4;
