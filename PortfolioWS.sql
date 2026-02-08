SHOW TABLES;
CREATE TABLE retail_sales (
    transactions_id INT,
    sale_date VARCHAR(20),
    sale_time VARCHAR(20),
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantiy INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);
SHOW TABLES;

-- Check the number of rows
SELECT COUNT(*) FROM retail_sales;

-- Quick Data Check
SELECT *
FROM retail_sales
LIMIT 5;

-- Number of rows
SELECT COUNT(*) AS total_rows
FROM retail_sales;

-- Column structure
DESCRIBE retail_sales;

-- Check for Missing Values
SELECT
    SUM(CASE WHEN transactions_id IS NULL THEN 1 ELSE 0 END) AS missing_transactions,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customers,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN quantiy IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN price_per_unit IS NULL THEN 1 ELSE 0 END) AS missing_price
FROM retail_sales;

-- Check for duplicates
SELECT COUNT(*) - COUNT(DISTINCT transactions_id) AS duplicate_transactions
FROM retail_sales;

-- Numerical Analysis
SELECT
    MIN(quantiy) AS min_quantity,
    MAX(quantiy) AS max_quantity,
    AVG(quantiy) AS avg_quantity,
    MIN(price_per_unit) AS min_price,
    MAX(price_per_unit) AS max_price,
    AVG(price_per_unit) AS avg_price
FROM retail_sales;

-- CHANGE DATE FORMAT
ALTER TABLE retail_sales
MODIFY sale_date DATE;

UPDATE retail_sales
SET sale_date = STR_TO_DATE(sale_date, '%d/%m/%Y');

-- What is the total revenue?
SELECT 
    SUM(total_sale) AS total_revenue
FROM retail_sales;

-- How many unique orders were made? 
SELECT 
    COUNT(DISTINCT transactions_id) AS total_orders
FROM retail_sales;

-- How many unique customers are in the dataset?
SELECT 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

-- What is the average order value?
SELECT 
    SUM(quantiy * price_per_unit) / COUNT(DISTINCT transactions_id) 
        AS average_order_value
FROM retail_sales;

-- How many products are sold in total?
SELECT 
    SUM(quantiy) AS total_products_sold
FROM retail_sales;

-- Which product generates the highest revenue? 
SELECT 
    category AS product_category,
    SUM(quantiy * price_per_unit) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;

-- Who are the top 10 customers by total spend?
SELECT 
    customer_id,
    SUM(quantiy * price_per_unit) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Which products have the highest sales volume?
SELECT 
    category AS product_category,
    SUM(quantiy) AS total_units_sold
FROM retail_sales
GROUP BY category
ORDER BY total_units_sold DESC
LIMIT 10;

-- Which customers place the most orders?
SELECT 
    customer_id,
    COUNT(DISTINCT transactions_id) AS total_orders
FROM retail_sales
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- How does Revenue change over time?
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(quantiy * price_per_unit) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY month;


-- What are the peak sales month?
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(quantiy * price_per_unit) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- Is there seasonality in retail?
SELECT 
    MONTH(sale_date) AS month_number,
    SUM(quantiy * price_per_unit) AS revenue
FROM retail_sales
GROUP BY month_number
ORDER BY month_number;

-- How does the number of orders change from month to month? 
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    COUNT(DISTINCT transactions_id) AS total_orders
FROM retail_sales
GROUP BY month
ORDER BY month;

-- How many customers are repeat vs one-time buyers
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT customer_id, COUNT(DISTINCT transactions_id) AS order_count
    FROM retail_sales
    GROUP BY customer_id
) t
GROUP BY customer_type;

-- What percentage of revenue comes from the top 20% of customers?
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

SELECT 
    SUM(total_spent) / (SELECT SUM(quantiy * price_per_unit) FROM retail_sales) * 100 AS pct_revenue_top20
FROM (
    SELECT customer_id, SUM(quantiy * price_per_unit) AS total_spent
    FROM retail_sales
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 31
) t;

-- Which customers show signs of churn risk (long time since last purchase)?
SELECT 
    customer_id,
    DATEDIFF(MAX(STR_TO_DATE(sale_date, '%d/%m/%Y')), CURDATE()) AS days_since_last_purchase
FROM retail_sales
GROUP BY customer_id
ORDER BY days_since_last_purchase DESC
LIMIT 10;

-- Are a small number of products driving most revenue?
SELECT 
    category,
    SUM(quantiy * price_per_unit) AS revenue,
    SUM(quantiy * price_per_unit) / (SELECT SUM(quantiy * price_per_unit) FROM retail_sales) * 100 AS pct_total_revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC
LIMIT 5;

-- Which customers have the highest lifetime value (LTV)?
SELECT 
    customer_id,
    SUM(quantiy * price_per_unit) AS lifetime_value
FROM retail_sales
GROUP BY customer_id
ORDER BY lifetime_value DESC
LIMIT 10;







