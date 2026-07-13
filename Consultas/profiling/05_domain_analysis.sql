-- ============================================================
-- Domain Analysis
-- ============================================================

-- ------------------------------------------------------------
-- Orders
-- Analyze the domain of the status column.
-- ------------------------------------------------------------

SELECT status, COUNT(*) AS status_count
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY status_count DESC;

-- ------------------------------------------------------------
-- Order Items
-- Analyze the domain of the status column.
-- ------------------------------------------------------------

SELECT status, COUNT(*) AS status_count
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY status
ORDER BY status_count DESC;

-- ------------------------------------------------------------
-- Users
-- Analyze the domain of the gender column.
-- ------------------------------------------------------------

SELECT gender, COUNT(*) AS user_count
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY gender
ORDER BY user_count DESC;

-- ------------------------------------------------------------
-- Products
-- Analyze the domain of the department column.
-- ------------------------------------------------------------

SELECT department, COUNT(*) AS product_count
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY department
ORDER BY product_count DESC;

-- ------------------------------------------------------------
-- Products
-- Analyze the domain of the category column.
-- ------------------------------------------------------------

SELECT category, COUNT(*) AS product_count
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY product_count DESC;