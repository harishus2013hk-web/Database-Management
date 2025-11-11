select * from products;

-- Categorize High vs Low when quantity is greater 9 then High else Low
SELECT sale_id, product, quantity,
  CASE WHEN quantity >= 10 THEN 'High'
       ELSE 'Low'
  END AS quantity_level
FROM products;

-- Flag Expensive Products when price is more than 30000 then expensive else affordable
SELECT product, price,
  CASE WHEN price > 30000 THEN 'Expensive'
       ELSE 'Affordable'
  END AS price_tag
FROM products;

-- Group Salesperson Performance when sales is moret than 200000 then top performer else Regular performer
SELECT salesperson,
  CASE WHEN SUM(quantity * price) > 200000 THEN 'Top Performer'
       ELSE 'Regular'
  END AS performance
FROM products
GROUP BY salesperson;

-- Generate Quarter wise Sales 
SELECT
	CASE
		WHEN MONTH(sale_date) BETWEEN 1 and 3 THEN "Q1"
        WHEN MONTH(sale_date) BETWEEN 4 and 6 THEN "Q2"
        WHEN MONTH(sale_date) BETWEEN 7 and 9 THEN "Q3"
        ELSE "Q4"
	END AS Quarter,
    sum(price*quantity) as sales
FROM products
GROUP BY Quarter;

-- Flag salespeople for bonus if they sold more than ₹500,000 total.
SELECT 
  salesperson,
  SUM(quantity * price) AS total_sales,
  CASE 
    WHEN SUM(quantity * price) > 500000 THEN 'Eligible'
    ELSE 'Not Eligible'
  END AS bonus_status
FROM products
GROUP BY salesperson;

-- Assign incentive percentage based on region.
SELECT 
  sale_id,
  region,
  CASE 
    WHEN region = 'East' THEN '10%'
    WHEN region = 'West' THEN '8%'
    WHEN region = 'North' THEN '6%'
    ELSE '5%'
  END AS incentive_rate
FROM products;

-- Identify if the sale happened on a weekend.
SELECT 
  sale_id,
  sale_date,
  CASE 
    WHEN DAYOFWEEK(sale_date) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS sale_day_type
FROM products;
