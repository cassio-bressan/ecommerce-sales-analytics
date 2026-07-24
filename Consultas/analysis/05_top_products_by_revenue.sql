/*
===============================================================================
Analysis: Top Products by Revenue
File: 05_top_products_by_revenue.sql
===============================================================================

Objective
---------
Identify the individual products that generate the highest revenue for the
business.

Business Context
----------------
This analysis highlights the top-performing products based on revenue,
providing valuable insights for inventory management, commercial strategy,
marketing campaigns and product assortment decisions.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Revenue is calculated using the sale_price of each sold item.
- Products are grouped by both product ID and product name to ensure unique
- identification, since duplicate product names may exist in the dataset.
- The result is limited to the Top 10 products ranked by revenue.

Source Tables
-------------
- order_items (fact table)
- products (product dimension)

Output
------
Returns the Top 10 products by revenue containing:
- product_id
- product_name
- product_revenue

The result is sorted from the highest to the lowest revenue.
===============================================================================
*/

SELECT p.id AS product_id, p.name AS product_name, ROUND(SUM(od.sale_price),2) AS product_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` od
JOIN `bigquery-public-data.thelook_ecommerce.products` p ON p.id = od.product_id
WHERE od.status = 'Complete'
GROUP BY product_id, product_name
ORDER BY product_revenue DESC
LIMIT 10;