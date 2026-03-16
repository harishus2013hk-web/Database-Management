-- CREATE DATABASE window_functions;
-- USE window_functions;
CREATE TABLE category
	(
		new_id INT,
		new_cat VARCHAR(50)
	);
INSERT INTO category (new_id,new_cat)
VALUES
(100,"Agni"),
(200,"Agni"),
(500, "Dharti"),
(700, "Dharti"),
(200,"Vayu"),
(300, "Vayu"),
(500, "Vayu");

SELECT * FROM category;
TRUNCATE category;

SELECT *,
SUM(new_id) OVER(PARTITION BY new_cat) AS "Total" FROM category;

SELECT *,
MAX(new_id) OVER(PARTITION BY new_cat) AS "Total" FROM category;

SELECT *,
MIN(new_id) OVER(PARTITION BY new_cat) AS "Total" FROM category;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY new_cat) AS "Total" FROM category;

SELECT *,
	SUM(new_id) OVER(PARTITION BY new_cat) AS "Total",
	MAX(new_id) OVER(PARTITION BY new_cat) AS "Maximum",
	MIN(new_id) OVER(PARTITION BY new_cat) AS "Minimum",
	COUNT(new_cat) OVER(PARTITION BY new_cat) AS "count",
	AVG(new_id) OVER(PARTITION BY new_cat) AS "Average"
FROM category;

SELECT *,
	DENSE_RANK() OVER(ORDER BY new_id) AS "Dense", 
	RANK() OVER(ORDER BY new_id) AS "Rank",
    ROW_NUMBER() OVER(ORDER BY new_id) AS "Row_No",
    ROW_NUMBER() OVER(PARTITION BY new_cat) AS "Row_No_cat",
    PERCENT_RANK() OVER(ORDER BY new_id) AS "Percent_Rank"
FROM category;

SELECT *,
	FIRST_VALUE(new_id) OVER(ORDER BY new_cat DESC) AS "First", 
	LAST_VALUE(new_id) OVER(ORDER BY new_cat) AS "Last",
    LEAD(new_id) OVER(ORDER BY new_id) AS "Lead",
    LAG(new_id) OVER(PARTITION BY new_cat) AS "Laf"
FROM category;

SELECT *, 
LAST_VALUE(new_id) OVER (
    ORDER BY new_cat
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS Last
FROM category ORDER BY new_cat;


SELECT *,
	SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Total",
    AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Avg",
    COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Count",
    MIN(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Min",
    MAX(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Max"
FROM category;

CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);

SELECT * FROM Sales;
-- 1. Show the Running total for Amount
SELECT *,
	SUM(Amount) OVER(ORDER BY SaleDate) as "Running_Total"
FROM Sales;

-- 2. Show the Running total for Amount based on customer ID
SELECT *,
	SUM(Amount) OVER(PARTITION BY CustomerID ORDER BY SaleDate) as "Running_Total"
FROM Sales;

-- 3. Calculate the average sales amount over the last 3 sales.
SELECT *,
    AVG(Amount) OVER (ORDER BY SaleDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Avg_Last3Sales
FROM Sales
ORDER BY SaleDate;

-- 4. Rank the sales by amount for each customer
SELECT *,
	RANK() OVER(ORDER BY Amount DESC) as "Rank",
    RANK() OVER(PARTITION BY CustomerID ORDER BY Amount DESC) as "Rank_customer"
FROM Sales;