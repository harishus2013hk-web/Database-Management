SELECT CURDATE();         -- Current date (YYYY-MM-DD)
SELECT CURTIME();         -- Current time (HH:MM:SS)
SELECT NOW();             -- Current date and time
SELECT SYSDATE();         -- Current date and time at execution
SELECT UTC_DATE();        -- Current UTC date
SELECT UTC_TIME();        -- Current UTC time
SELECT UTC_TIMESTAMP();   -- Current UTC date and time
SELECT DATE_ADD('2025-11-20', INTERVAL 7 DAY);       -- Add days
SELECT DATE_SUB('2025-11-20', INTERVAL 1 MONTH);     -- Subtract months
SELECT ADDDATE('2025-11-20', INTERVAL 10 DAY);       -- Add days (alias)
SELECT SUBDATE('2025-11-20', INTERVAL 5 DAY);        -- Subtract days (alias)
SELECT TIMESTAMPADD(DAY, 10, '2025-11-20');          -- Add using TIMESTAMPADD
SELECT TIMESTAMPDIFF(MONTH, '2025-01-01', '2025-11-20'); -- Difference in months
SELECT YEAR('2025-11-20');       -- Extract year
SELECT MONTH('2025-11-20');      -- Extract month
SELECT DAY('2025-11-20');        -- Extract day
SELECT HOUR('2025-11-20 14:30:00'); -- Extract hour
SELECT MINUTE('2025-11-20 14:30:00'); -- Extract minute
SELECT SECOND('2025-11-20 14:30:00'); -- Extract second
SELECT WEEKDAY('2025-11-20');    -- Day index (0=Monday)
SELECT DAYNAME('2025-11-20');    -- Day name
SELECT MONTHNAME('2025-11-20');  -- Month name
SELECT QUARTER('2025-11-20');    -- Quarter (1–4)
SELECT DATE_FORMAT('2025-11-20', '%Y-%m-%d');        -- Format as YYYY-MM-DD
SELECT DATE_FORMAT('2025-11-20', '%W, %M %d, %Y');   -- Full weekday and month
SELECT TIME_FORMAT('14:30:00', '%h:%i %p');          -- Format time as 02:30 PM
SELECT DATEDIFF('2025-12-01', '2025-11-20');         -- Difference in days
SELECT STR_TO_DATE('20-11-2025', '%d-%m-%Y');        -- Convert string to date
SELECT LAST_DAY('2025-11-20');                       -- Last day of the month
SELECT MAKEDATE(2025, 324);                          -- Create date from year and day-of-year
SELECT MAKETIME(14, 30, 0);                          -- Create time from hour, minute, second

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
        
-- Extract year from sale_date
SELECT sale_id, product, EXTRACT(YEAR FROM sale_date) AS sale_year
FROM products;

-- Extract month from sale_date
SELECT sale_id, product, EXTRACT(MONTH FROM sale_date) AS sale_month
FROM products;

-- Extract day from sale_date
SELECT sale_id, product, EXTRACT(DAY FROM sale_date) AS sale_day
FROM products;

-- Days since each sale (assuming current date is 2025-11-20)
SELECT sale_id, product, DATEDIFF('2025-11-20', sale_date) AS days_since_sale
FROM products;

-- Sales made in March 2024
SELECT * FROM products
WHERE sale_date BETWEEN '2024-03-01' AND '2024-03-31';

-- Add 10 days to each sale date
SELECT sale_id, product, sale_date, DATE_ADD(sale_date, INTERVAL 10 DAY) AS follow_up_date
FROM products;

-- Subtract 7 days from each sale date
SELECT sale_id, product, sale_date, DATE_SUB(sale_date, INTERVAL 7 DAY) AS reminder_date
FROM products;