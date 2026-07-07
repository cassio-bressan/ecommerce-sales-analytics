SELECT
    MIN(created_at) AS first_order_date,
    MAX(created_at) AS last_order_date
FROM bigquery-public-data.thelook_ecommerce.orders;