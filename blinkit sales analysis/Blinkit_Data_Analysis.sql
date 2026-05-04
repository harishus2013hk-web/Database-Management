-- Q1. What is the total number of records, total revenue,

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT item_identifier) AS unique_items,
    ROUND(SUM(sales),  2) AS total_revenue,
    ROUND(AVG(sales),  2) AS avg_sales
FROM blinkit_grocery_data;

-- Q2. Which item_type generates the highest total sales?

SELECT
    item_type,
    COUNT(*)              AS total_records,
    ROUND(SUM(sales), 2)  AS total_sales,
    ROUND(AVG(sales), 2)  AS avg_sales,
    ROUND(MIN(sales), 2)  AS min_sales,
    ROUND(MAX(sales), 2)  AS max_sales
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY total_sales DESC;

-- Q3. What is the percentage split between Low Fat and Regular

SELECT 
    item_fat_content,
    COUNT(*) AS item_count,
    ROUND(COUNT(*) * 100.0 / (SELECT 
                    COUNT(*)
                FROM
                    blinkit_grocery_data),
            2) AS count_pct,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(AVG(sales), 2) AS avg_sales
FROM
    blinkit_grocery_data
GROUP BY item_fat_content
ORDER BY total_sales DESC;

-- Q4. Which outlet (outlet_identifier) has the highest revenue?

SELECT
    outlet_identifier,
    outlet_type,
    outlet_size,
    outlet_location_type,
    outlet_establishment_year,
    COUNT(*) AS items_sold,
    ROUND(SUM(sales), 2)  AS total_revenue,
    ROUND(AVG(rating), 2) AS avg_rating
FROM blinkit_grocery_data
GROUP BY
    outlet_identifier,
    outlet_type,
    outlet_size,
    outlet_location_type,
    outlet_establishment_year
ORDER BY total_revenue DESC
LIMIT 10;

-- Q5. Compare total sales and average rating across

SELECT
    outlet_location_type,
    COUNT(*) AS total_records,
    ROUND(SUM(sales),  2) AS total_sales,
    ROUND(AVG(sales),  2) AS avg_sales,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(SUM(sales) * 100.0 /
         (SELECT SUM(sales) FROM blinkit_grocery_data), 2)      AS sales_share_pct
FROM blinkit_grocery_data
GROUP BY outlet_location_type
ORDER BY total_sales DESC;

-- Q6. What is the average item_weight and item_visibility

SELECT
    item_type,
    ROUND(AVG(item_weight),     2)  AS avg_weight,
    ROUND(MIN(item_weight),     2)  AS min_weight,
    ROUND(MAX(item_weight),     2)  AS max_weight,
    ROUND(AVG(item_visibility), 6)  AS avg_visibility
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_weight DESC;

-- Q7. Which outlet_type has the best average rating,

SELECT
    outlet_type,
    outlet_size,
    COUNT(*) AS total_items,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(MIN(rating), 2) AS min_rating,
    ROUND(MAX(rating), 2) AS max_rating,
    ROUND(AVG(sales),  2) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_type, outlet_size
ORDER BY avg_rating DESC, avg_sales DESC;

-- Q8. Classify items into sales buckets and count how many

SELECT
    CASE
        WHEN sales < 50 THEN 'Low (< 50)' 
        WHEN sales BETWEEN 50 AND 150  THEN 'Medium  (50-150)'
        WHEN sales BETWEEN 151 AND 300 THEN 'High    (151-300)'
        ELSE                                'Premium (> 300)'
    END AS sales_bucket,
    COUNT(*) AS item_count,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(item_weight), 2) AS avg_weight,
    ROUND(AVG(item_visibility), 6) AS avg_visibility
FROM blinkit_grocery_data
GROUP BY sales_bucket
ORDER BY avg_sales ASC;

-- Q9. Find the top 3 best-selling item_types within each

WITH sales_summary AS (
    SELECT
        outlet_type,
        item_type,
        ROUND(SUM(sales),  2) AS total_sales,
        ROUND(AVG(rating), 2) AS avg_rating
    FROM blinkit_grocery_data
    GROUP BY outlet_type, item_type
),
ranked AS (
    SELECT
        outlet_type,
        item_type,
        total_sales,
        avg_rating,
        RANK() OVER (
            PARTITION BY outlet_type
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM sales_summary
)
SELECT
    outlet_type,
    sales_rank,
    item_type,
    total_sales,
    avg_rating
FROM ranked
WHERE sales_rank <= 3
ORDER BY outlet_type, sales_rank;

-- Q10. Show year-wise revenue with a cumulative running total
WITH yearly AS (
    SELECT
        outlet_establishment_year,
        COUNT(DISTINCT outlet_identifier) AS active_outlets,
        COUNT(*) AS total_records,
        ROUND(SUM(sales),  2) AS yearly_revenue,
        ROUND(AVG(sales),  2) AS avg_sales,
        ROUND(AVG(rating), 2) AS avg_rating
    FROM blinkit_grocery_data
    GROUP BY outlet_establishment_year
)
SELECT
    outlet_establishment_year,
    active_outlets,
    total_records,
    yearly_revenue,
    avg_sales,
    avg_rating,
    ROUND(
        SUM(yearly_revenue) OVER (
            ORDER BY outlet_establishment_year
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS cumulative_revenue
FROM yearly
ORDER BY outlet_establishment_year;
