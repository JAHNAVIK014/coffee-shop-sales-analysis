-- ============================================
-- PROJECT: Coffee Shop Sales Data Analysis
-- DESCRIPTION:
-- This script performs ETL (Extract, Transform, Load)
-- to convert raw sales data into a structured format.
--
-- DATA MODEL:
-- Star Schema
-- - Fact Table: sales
-- - Dimension Tables: stores, products, categories, transactions
--
-- TOOLS USED:
-- MySQL
-- ============================================


-- ============================================
-- Create and Using DATABASE
-- ============================================

CREATE DATABASE IF NOT EXISTS coffee_shop_sales;
USE coffee_shop_sales;

-- ============================================
-- STAGING TABLE (RAW DATA)
-- ============================================

CREATE TABLE IF NOT exists sales_raw (
    transaction_id INT,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(50),
    product_id INT,
    unit_price DECIMAL(5,2),
    product_category VARCHAR(50),
    product_type VARCHAR(50),
    product_detail VARCHAR(100)
);

-- ============================================
-- DIMENSION TABLE: STORES
-- ============================================

CREATE TABLE IF NOT exists stores (
    store_id INT PRIMARY KEY,
    store_location VARCHAR(50) 
    );
INSERT IGNORE INTO stores (store_id, store_location)
SELECT DISTINCT
    store_id,
    store_location
FROM sales_raw
WHERE store_id IS NOT NULL;

-- ============================================
-- DIMENSION TABLE: CATEGORIES
-- ============================================

CREATE TABLE IF NOT exists categories(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    product_category VARCHAR(50) NOT NULL UNIQUE
);

INSERT IGNORE INTO categories (product_category)
SELECT DISTINCT
    product_category 
FROM sales_raw
WHERE product_category IS NOT NULL;

-- ============================================
-- DIMENSION TABLE: PRODUCTS
-- ============================================

CREATE TABLE IF NOT exists products (
    product_id INT PRIMARY KEY,
    product_detail VARCHAR(100),
    product_type VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
INSERT IGNORE INTO products (
    product_id, product_detail, product_type, category_id
)
SELECT DISTINCT
    r.product_id,
    r.product_detail,
    r.product_type,
    c.category_id
FROM sales_raw r
JOIN categories c
    ON r.product_category = c.product_category
WHERE r.product_id IS NOT NULL;


-- ============================================
-- DIMENSION TABLE: TRANSACTIONS
-- ============================================

CREATE TABLE IF NOT exists transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- Remove duplicates using GROUP BY

INSERT IGNORE INTO transactions (transaction_id, transaction_date, transaction_time, store_id)
SELECT 
    transaction_id,
    MIN(transaction_date),
    MIN(transaction_time),
    MIN(store_id)
FROM sales_raw
WHERE transaction_id IS NOT NULL
GROUP BY transaction_id;

-- ============================================
-- FACT TABLE: SALES
-- ============================================

CREATE TABLE IF NOT exists sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    transaction_qty INT NOT NULL,
    unit_price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE KEY unique_transaction_product (transaction_id, product_id)
);

-- Data Cleaning:
-- Remove invalid quantity and NULL prices

INSERT IGNORE INTO sales (
    transaction_id,
    product_id,
    transaction_qty,
    unit_price
)
SELECT DISTINCT
    transaction_id,
    product_id,
    transaction_qty,
    unit_price
FROM sales_raw
WHERE transaction_qty > 0 AND unit_price IS NOT NULL;

SELECT * FROM sales;

-- ============================================
-- VALIDATION CHECKS
-- ============================================

-- Total records in fact table

SELECT COUNT(*) AS total_sales FROM sales;

-- Check duplicate transactions
SELECT transaction_id, COUNT(*)
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Check NULL values
SELECT COUNT(*)
FROM sales
WHERE transaction_id IS NULL 
   OR product_id IS NULL;


















    
    



