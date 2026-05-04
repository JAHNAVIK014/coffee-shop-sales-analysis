## ☕ Coffee Shop Sales Analysis

📌 Project Overview
This project presents an end-to-end data analysis pipeline for a coffee shop business using SQL and Power BI.

It includes:

- Data transformation using ETL process
- Star schema data modeling
- Business insights generation using SQL
- Interactive dashboard for visualization

🎯 Objective
To analyze coffee shop sales data and generate actionable insights such as:
- Revenue trends
- Store performance
- Product demand
- Customer buying patterns

🛠️ Tools & Technologies
- SQL (MySQL)
- Power BI
- Data Modeling (Star Schema)

🧱 Data Model
The project follows a Star Schema:

Fact Table
- sales

Dimension Tables
- stores
- products
- categories
- transactions


🔄 ETL Process

Implemented in ETL_Coffee_Shop.sql

Steps:
- Created database and staging table (sales_raw)
- Cleaned and structured raw data
- Created dimension tables:
  - Stores
  - Categories
  - Products
  - Transactions
- Built fact table (sales)
  
Applied:
- Duplicate removal
- Null handling
- Data validation checks

📊 Business Analysis
Performed in Sales_Analysis.sql

Key KPIs:
- Total Revenue
- Revenue by Store
- Product Category Performance
- Monthly Revenue Trend
- Hourly Sales Trend
- Top Products per Category
- Average Order Value

🔍 Key Insights
💰 Total Revenue: 698.8K
🛒 Total Transactions: 149K
📦 Total Quantity Sold: 214K
📍 Top Store: Hell’s Kitchen
☕ Top Category: Coffee
⏰ Peak Sales Hours: Morning (8 AM – 11 AM)
📈 Revenue shows steady monthly growth


🚀 How to Use

1️⃣ Run ETL Script
- Run ETL_Coffee_Shop.sql

2️⃣ Run Analysis Queries
- Run Sales_Analysis.sql

3️⃣ Open Dashboard
- Open .pbix file in Power BI
Explore interactive visuals


📂 Project Structure
Coffee-Shop-Sales-Analysis/
│
├── ETL_Coffee_Shop.sql
├── Sales_Analysis.sql
├── Coffee_Shop_Dashboard.pbix
├── dashboard.png
└── README.md


🌟 Highlights
- End-to-end data project
- Real-world business insights
- Clean data modeling
- Interactive dashboard design


📌 Future Improvements
- Add customer segmentation
- Predict sales trends using ML
- Deploy dashboard online


👩‍💻 Author
Jahnavi K



