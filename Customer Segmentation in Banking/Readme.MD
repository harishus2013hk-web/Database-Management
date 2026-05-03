# 🏦 Bank Customer Segmentation & Financial Analytics (MySQL)

A MySQL-based project that simulates a Nigerian retail bank database — complete with schema setup, realistic data generation, and a suite of analytical queries for customer segmentation and financial insights.

---

## 📁 Project Structure

| File | Description |
|---|---|
| `schema_setup.sql` | Creates the core database tables (`customers`, `accounts`, `transactions`) |
| `data_generation.sql` | Populates the database with 200 synthetic Nigerian customers, accounts, and 1,000 transactions |
| `bank_segmentation.sql` | 13 analytical queries for customer and financial insights |

---

## 🗃️ Database Schema

```
customers
├── customer_id (PK)
├── name, gender, dob
├── signup_date
└── city

accounts
├── account_id (PK)
├── customer_id (FK → customers)
├── account_number, account_type
├── open_date
└── balance

transactions
├── transaction_id (PK)
├── account_id (FK → accounts)
├── transaction_date
├── amount, transaction_type
└── description
```

---

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0+ (CTEs and window functions required)

#. Run scripts in order
mysql -u root -p bank_analytics < schema_setup.sql
mysql -u root -p bank_analytics < data_generation.sql
mysql -u root -p bank_analytics < bank_segmentation.sql
```

---

## 📊 Analytical Queries

The `bank_segmentation.sql` file contains 13 ready-to-run queries:

| # | Query | Description |
|---|---|---|
| 1 | **Total Spend Per Customer** | Ranks customers by total debit volume |
| 2 | **Salary Trend Analysis** | Tracks monthly salary credits over the last 12 months |
| 3 | **Most Active Accounts (Count)** | Top 10 accounts by number of transactions |
| 4 | **Most Active Accounts (Volume)** | Top 10 accounts with full debit/credit breakdown |
| 5 | **Monthly Transaction Breakdown** | Month-over-month transaction counts and volumes |
| 6 | **Yearly Transaction Breakdown** | Year-over-year aggregated transaction metrics |
| 7 | **Top 20 High-Value Customers** | Customers with the highest total credited amounts |
| 8 | **Dormant Accounts** | Accounts with no activity in the last 12 months |
| 9 | **Single Product Customers** | Customers holding only one account — upsell targets |
| 10 | **Most Used Transaction Services** | Ranks transaction descriptions by frequency |
| 11 | **City-wise Performance** | Transaction totals and averages by city |
| 12 | **Engagement by Region** | Active vs dormant account counts per city |
| 13 | **Highest Spender by City** | Top-spending customer in each city using window functions |

---

## 🌍 Sample Data

- **200 customers** with Nigerian names, cities, and demographics
- **~300 accounts** of types: `savings`, `current`, `loan`
- **1,000 transactions** with realistic descriptions (e.g., *POS payment at Shoprite*, *Salary credited*, *MTN Airtime recharge*)
- Cities covered: Lagos, Abuja, Port Harcourt, Kano, Ibadan, Enugu, and more

---

## 💡 Use Cases

- Practicing intermediate-to-advanced SQL (CTEs, window functions, conditional aggregation)
- Building dashboards on top of a realistic financial dataset
- Learning customer segmentation techniques for retail banking
- Portfolio project for data analyst or BI developer roles

---

## 🛠️ Tech Stack

- **Database:** MySQL 8.0+
- **Concepts:** CTEs, Window Functions, Recursive Queries, Conditional Aggregation, Date Arithmetic

---
