/*
===============================================================================
Analysis: Top Categories by Revenue
File: 03_top_categories_by_revenue.sql
===============================================================================

Objective
---------
Identify which product categories generate the highest revenue for the business.

Business Context
----------------
Understanding revenue by product category helps identify the company's
best-performing product lines. This analysis supports commercial decisions
such as inventory planning, marketing campaigns and product assortment strategy.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Revenue is calculated using the sale_price of each sold item.
- Revenue is aggregated at the product category level.

Source Tables
-------------
- order_items (fact table)
- products (product dimension)

Output
------
Returns one row per product category containing:
- category
- category_revenue

The result is sorted from the highest to the lowest revenue.
===============================================================================
*/

SELECT p.category AS category, ROUND(SUM(od.sale_price),2) AS category_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` od
JOIN `bigquery-public-data.thelook_ecommerce.products` p ON p.id = od.product_id
WHERE od.status = 'Complete'
GROUP BY category
ORDER BY category_revenue DESC;