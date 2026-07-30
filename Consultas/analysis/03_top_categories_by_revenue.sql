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

Source
------
- analytics.vw_sales

Notes
-----
This query uses the analytical view (vw_sales), created during Sprint 4,
which consolidates sales, product and customer information into a single
analytical layer.

Output
------
Returns one row per product category containing:
- category
- category_revenue

The result is sorted from the highest to the lowest revenue.
===============================================================================
*/

SELECT category, ROUND(SUM(sale_price),2) AS category_revenue
FROM `projeto-e-commerce-501019.analytics.vw_sales`
WHERE status = 'Complete'
GROUP BY category
ORDER BY category_revenue DESC;