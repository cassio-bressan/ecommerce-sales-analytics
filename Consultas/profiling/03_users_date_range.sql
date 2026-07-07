SELECT 
    MIN(created_at) AS first_user_data, 
    MAX(created_at) AS last_user_data
FROM bigquery-public-data.thelook_ecommerce.users;