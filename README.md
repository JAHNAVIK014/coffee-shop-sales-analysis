# ☕ Coffee Shop Sales Analysis

## 📌 Project Overview

This project presents an end-to-end data analysis workflow for a coffee shop business using SQL and Power BI.

It includes:

* Data cleaning and transformation using SQL
* Database normalization up to Third Normal Form (3NF)
* Relational data modeling
* Business insights generation using SQL queries
* Interactive dashboard for visualization in Power BI

---

## 🎯 Objective

To analyze coffee shop sales data and generate actionable insights such as:

* Revenue trends
* Store performance
* Product demand
* Customer buying patterns

---

## 🛠️ Tools & Technologies

* SQL (MySQL)
* Power BI
* Data Modeling (Relational Model & Normalization)

---

## 🧱 Data Model

The data was structured using relational modeling in SQL and normalized up to Third Normal Form (3NF).

### Tables Created:

* `sales` (central transaction table)
* `stores`
* `products`
* `categories`
* `transactions`

These tables are connected using **primary and foreign keys** to maintain data integrity and enable multi-table analysis.

---

## 🧠 Database Design & Normalization

The dataset was normalized up to **Third Normal Form (3NF)** to:

* Eliminate data redundancy
* Improve data consistency and integrity
* Optimize storage and query performance
* Create a scalable structure for analysis

---

## 🔄 ETL Process (SQL-Based)

Implemented in `ETL_Coffee_Shop.sql`

### Steps:

* Created database and staging table (`sales_raw`)
* Extracted raw transactional data
* Cleaned data (handled nulls, removed duplicates, standardized formats)
* Applied normalization up to 3NF
* Created structured tables:

  * Stores
  * Categories
  * Products
  * Transactions
* Built central `sales` table
* Loaded cleaned data into structured format for analysis

---

## 📊 Business Analysis (SQL)

Performed in `Sales_Analysis.sql`

The analysis focuses on answering key business questions using SQL queries.

### Key KPIs:

* Total Revenue
* Revenue by Store
* Product Category Performance
* Monthly Revenue Trend
* Hourly Sales Trend
* Top Products per Category
* Average Order Value

### Techniques Used:

* Aggregation (`SUM`, `COUNT`, `ROUND`)
* Joins across multiple tables
* Grouping (`GROUP BY`)
* Time-based analysis (`DATE_FORMAT`, `HOUR`)
* Window functions (`RANK()` for top products)

---

## 🔍 Key Insights

* 💰 Total Revenue: 698.8K
* 🛒 Total Transactions: 149K
* 📦 Total Quantity Sold: 214K
* 📍 Top Store: Hell’s Kitchen
* ☕ Top Category: Coffee
* ⏰ Peak Sales Hours: Morning (8 AM – 11 AM)
* 📈 Revenue shows steady monthly growth

---

## 📊 Dashboard Overview (Power BI)

An interactive dashboard was created to visualize key business metrics and trends.

### Features:

* KPI cards (Revenue, Transactions, Quantity)
* Monthly and hourly trend analysis
* Product and category performance
* Interactive filters for dynamic exploration

---

## 📸 Dashboard Preview

![Dashboard](images/dashboard.png)

---

## 📂 Project Structure

```bash
coffee-shop-sales-analysis/
│
├── sql/
│   ├── ETL_Coffee_Shop.sql
│   └── Sales_Analysis.sql
│
├── dashboard/
│   └── coffee_shop_dashboard.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

---

## 🚀 How to Use

### 1️⃣ Run ETL Script

Execute:
`ETL_Coffee_Shop.sql`

### 2️⃣ Run Analysis Queries

Execute:
`Sales_Analysis.sql`

### 3️⃣ Open Dashboard

* Open `.pbix` file in Power BI Desktop
* Explore visuals using filters

---

## 🌟 Highlights

* End-to-end data analysis project
* SQL-based ETL process
* Database normalization up to 3NF
* Strong use of joins and aggregations
* Use of window functions (`RANK`)
* Interactive Power BI dashboard
* Business-focused insights

---

## 📌 Future Improvements

* Add customer segmentation analysis
* Implement sales forecasting models
* Automate data pipeline

---

## 👩‍💻 Author

**Jahnavi K**
Aspiring Data Analyst
Skills: SQL | Python | Power BI | Excel | Data Analytics
