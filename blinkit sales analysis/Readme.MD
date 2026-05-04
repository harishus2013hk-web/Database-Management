# Blinkit Grocery Data Analysis using SQL

## Project Overview

This project analyzes the **Blinkit Grocery Dataset** using SQL to uncover business insights related to sales, revenue, outlet performance, item trends, and customer ratings.

The goal of this analysis is to demonstrate practical SQL skills including:

* Aggregations
* Window Functions
* CTEs
* Ranking
* Business KPI Analysis
* Data Segmentation
* Revenue Trend Analysis

---

## Dataset Used

**Table Name:** `blinkit_grocery_data`

The dataset contains information about:

* Item details
* Sales performance
* Outlet information
* Ratings
* Product visibility
* Fat content
* Weight and pricing metrics

---

## SQL Analysis Questions Solved

### 1. Overall Business Performance

* Total number of records
* Unique items count
* Total revenue generated
* Average sales per transaction

---

### 2. Highest Revenue Generating Item Types

* Identified top-performing product categories
* Compared sales distribution by item type

---

### 3. Fat Content Analysis

* Percentage split of **Low Fat vs Regular**
* Revenue contribution by fat category

---

### 4. Best Performing Outlet

* Outlet generating highest revenue
* Outlet performance by:

  * Size
  * Type
  * Location
  * Establishment Year

---

### 5. Sales by Outlet Location Type

* Compared revenue by location tier
* Calculated sales contribution percentage

---

### 6. Product Weight & Visibility Analysis

* Average item weight by category
* Visibility comparison across item types

---

### 7. Outlet Rating Analysis

* Best-rated outlet type/size combinations
* Rating vs Sales comparison

---

### 8. Sales Bucket Classification

Items classified into:

* Low Sales
* Medium Sales
* High Sales
* Premium Sales

---

### 9. Top 3 Best-Selling Item Types Per Outlet Type

* Used Window Functions (`RANK()`)
* Ranked products within each outlet type

---

### 10. Year-wise Revenue Trend

* Revenue by outlet establishment year
* Cumulative running revenue total

---

## SQL Concepts Used

* `GROUP BY`
* `ORDER BY`
* `CASE WHEN`
* `CTE (WITH Clause)`
* `RANK() Window Function`
* `SUM() OVER()`
* Aggregate Functions:

  * `COUNT()`
  * `SUM()`
  * `AVG()`
  * `MIN()`
  * `MAX()`

---

## Key Insights Derived

* Identified highest revenue-generating product categories
* Found top-performing outlet locations
* Analyzed customer preference for fat content
* Determined rating impact on sales
* Tracked revenue growth over establishment years

---

## Project Structure

```bash
Blinkit-SQL-Analysis/
│
├── blinkit_sql_analysis.sql
├── README.md
└── dataset/
    └── blinkit_grocery_data.csv
```

---

## How to Run

1. Import dataset into SQL database
2. Create table `blinkit_grocery_data`
3. Run queries from `blinkit_sql_analysis.sql`
4. Analyze results for business insights

---

## Tools Used

* SQL / MySQL
* GitHub
* Excel / CSV Dataset
