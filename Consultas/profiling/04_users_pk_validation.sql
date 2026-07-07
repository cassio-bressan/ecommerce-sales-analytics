-- Check for duplicate primary keys
SELECT id, COUNT(id) AS duplicate_count 
FROM bigquery-public-data.thelook_ecommerce.users 
GROUP BY id 
HAVING COUNT(id) > 1;

-- Check for NULL primary keys
SELECT id 
FROM bigquery-public-data.thelook_ecommerce.users 
WHERE id IS NULL;