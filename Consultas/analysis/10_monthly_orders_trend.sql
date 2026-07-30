/*
===============================================================================
Analysis: Monthly Orders Trend
File: 10_monthly_orders_trend.sql
===============================================================================

Objective
---------
Analyze the monthly evolution of completed orders over time.

Business Context
----------------
This analysis measures the monthly volume of completed orders, allowing the
business to evaluate sales growth patterns and compare order volume with the
monthly revenue trend.

Together with the monthly revenue analysis, this KPI helps determine whether
business growth is driven by an increase in the number of orders or by changes
in the average order value.

Business Rule
-------------
- Only completed orders are considered (status = 'Complete').
- Orders are grouped by the month in which they were created.
- One order is counted once.

Source
------
- bigquery-public-data.thelook_ecommerce.orders

Notes
-----
This query uses the transactional orders table instead of the analytical
view (vw_sales).

The objective of this analysis is to measure the operational volume of
completed orders over time. Since this metric focuses on order lifecycle
rather than sales enrichment with product and customer attributes, the
transactional orders table is the most appropriate source.

Output
------
Returns one row per month containing:
- year_month
- order_count

The result is sorted chronologically.
===============================================================================
*/

SELECT FORMAT_DATE('%Y-%m', DATE_TRUNC(DATE(created_at), MONTH)) AS year_month, COUNT(order_id) AS order_count
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = 'Complete'
GROUP BY year_month
ORDER BY year_month ASC;