-- ============================================
-- PROJECT: Coffee Shop Sales Analysis
-- DESCRIPTION:
-- This script performs business analysis on the 
-- transformed sales data using SQL queries.
--
-- OBJECTIVE:
-- Generate insights such as revenue trends,
-- top-performing stores, products, and sales patterns.
--
-- DATABASE:
-- coffee_shop_sales
-- ============================================

USE coffee_shop_sales;

-- ============================================
-- KPI 1: TOTAL REVENUE
-- ============================================

-- Business Question:
-- What is the total revenue generated?

SELECT 
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_revenue
FROM sales;

-- ============================================
-- KPI 2: REVENUE BY STORE
-- ============================================

-- Business Question:
-- Which store generates the highest revenue?

SELECT 
    st.store_location,
    ROUND(SUM(s.transaction_qty * s.unit_price), 2) AS revenue
FROM sales s
JOIN transactions t ON s.transaction_id = t.transaction_id
JOIN stores st ON t.store_id = st.store_id
GROUP BY st.store_location
ORDER BY revenue DESC;

-- ============================================
-- KPI 3: TOP PRODUCT CATEGORIES BY QUANTITY
-- ============================================

-- Business Question:
-- Which product categories sell the most?

SELECT 
    c.product_category,
    SUM(s.transaction_qty) AS total_quantity_sold
FROM sales s
JOIN products p 
    ON s.product_id = p.product_id
JOIN categories c 
    ON p.category_id = c.category_id
GROUP BY c.product_category
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- ============================================
-- KPI 4: TOP REVENUE-GENERATING CATEGORIES
-- ============================================

-- Business Question:
-- Which categories generate the highest revenue?

SELECT 
    c.product_category,
    ROUND(SUM(s.transaction_qty * s.unit_price), 2) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.product_category
ORDER BY revenue DESC
LIMIT 10;

-- ============================================
-- KPI 5: MONTHLY REVENUE TREND
-- ============================================

-- Business Question:
-- How does revenue change month by month?

SELECT 
    DATE_FORMAT(t.transaction_date, '%Y-%m') AS month,
    ROUND(SUM(s.transaction_qty * s.unit_price), 2) AS monthly_revenue
FROM sales s
JOIN transactions t 
    ON s.transaction_id = t.transaction_id
GROUP BY month
ORDER BY month;

-- ============================================
-- KPI 6: SALES BY HOUR
-- ============================================

-- Business Question:
-- At what hour are sales highest?

SELECT 
    HOUR(t.transaction_time) AS sales_hour,
    ROUND(SUM(s.transaction_qty * s.unit_price), 2) AS revenue
FROM sales s
JOIN transactions t ON s.transaction_id = t.transaction_id
GROUP BY sales_hour
ORDER BY revenue DESC;

-- ============================================
-- KPI 7: TOP PRODUCTS WITHIN EACH CATEGORY
-- ============================================

-- Business Question:
-- What are the top-performing products in each category?

SELECT *
FROM (
    SELECT 
        c.product_category,
        p.product_detail,
        ROUND(SUM(s.transaction_qty * s.unit_price)) AS revenue,
        RANK() OVER (
            PARTITION BY c.product_category
            ORDER BY SUM(s.transaction_qty * s.unit_price) DESC
        ) AS revenue_rank
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    GROUP BY c.product_category, p.product_detail
) ranked_products
WHERE revenue_rank <= 3;


-- ============================================
-- KPI 8: AVERAGE ORDER VALUE
-- ============================================

-- Business Question:
-- What is the average revenue per transaction?

SELECT 
    ROUND(SUM(transaction_qty * unit_price) / COUNT(DISTINCT transaction_id), 2) 
    AS avg_order_value
FROM sales;

-- ============================================
-- END OF ANALYSIS
-- ============================================

