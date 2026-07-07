-- Check for duplicate primary keys
SELECT order_id, COUNT(order_id) AS duplicate_count 
FROM bigquery-public-data.thelook_ecommerce.orders 
GROUP BY order_id 
HAVING COUNT(order_id) > 1;
-- Check for NULL primary keys
SELECT order_id 
FROM bigquery-public-data.thelook_ecommerce.orders 
WHERE order_id IS NULL;