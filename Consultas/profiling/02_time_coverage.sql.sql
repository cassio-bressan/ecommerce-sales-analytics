-- ============================================================
-- Time Coverage Analysis
-- ============================================================

-- Check 1: Orders
SELECT
    MIN(created_at) AS first_order_date,
    MAX(created_at) AS last_order_date
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- ============================================================

-- Check 2: Users
SELECT 
    MIN(created_at) AS first_user_data, 
    MAX(created_at) AS last_user_data
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- ============================================================