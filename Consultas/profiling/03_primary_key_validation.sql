-- ============================================================
-- Primary Key Validation
-- ============================================================

-- Check 1: Users

-- Check for duplicate primary keys
SELECT id, COUNT(id) AS duplicate_count 
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY id 
HAVING COUNT(id) > 1;

-- Check for NULL primary keys
SELECT id 
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE id IS NULL;
-- ============================================================

-- Check 2: Orders

-- Check for duplicate primary keys
SELECT order_id, COUNT(order_id) AS duplicate_count 
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY order_id 
HAVING COUNT(order_id) > 1;
-- Check for NULL primary keys
SELECT order_id 
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE order_id IS NULL;

-- ============================================================

-- Check 3: Products

-- Check for duplicate primary keys
SELECT id, COUNT(id) AS duplicate_count 
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY id 
HAVING COUNT(id) > 1;
-- Check for NULL primary keys
SELECT id 
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE id IS NULL;



-- ============================================================

-- Check 4: Order Items 

-- Check for duplicate primary keys
SELECT id, COUNT(id) AS duplicate_count 
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY id 
HAVING COUNT(id) > 1;
-- Check for NULL primary keys
SELECT id 
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE id IS NULL;

































-- Check for duplicate primary keys
SELECT id, COUNT(id) AS duplicate_count 
FROM bigquery-public-data.thelook_ecommerce.users 
GROUP BY id 
HAVING COUNT(id) > 1;

-- Check for NULL primary keys
SELECT id 
FROM bigquery-public-data.thelook_ecommerce.users 
WHERE id IS NULL;