/*
===============================================================================
Analysis: Top Customers by Revenue
File: 06_top_customers_by_revenue.sql
===============================================================================

Objective
---------
Identify the customers who generate the highest revenue for the business.

Business Context
----------------
This analysis highlights the company's highest-value customers based on
generated revenue. It supports customer segmentation strategies, loyalty
programs, personalized marketing campaigns and customer relationship management.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Revenue is calculated using the sale_price of each sold item.
- Customers are uniquely identified by customer ID while their full name is displayed for readability.
- The result is limited to the Top 10 customers ranked by revenue.

Source Tables
-------------
- order_items (fact table)
- users (customer dimension)

Output
------
Returns the Top 10 customers by revenue containing:
- customer_name
- customer_revenue

The result is sorted from the highest to the lowest revenue.
===============================================================================
*/

SELECT CONCAT(u.first_name,' ', u.last_name) AS customer_name,ROUND(SUM(od.sale_price),2) AS customer_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`od
JOIN `bigquery-public-data.thelook_ecommerce.users` u ON u.id = od.user_id
WHERE od.status = 'Complete'
GROUP BY u.id,u.first_name, u.last_name
ORDER BY customer_revenue DESC
LIMIT 10