/*
===============================================================================
Analysis: Monthly Revenue Trend
File: 02_monthly_revenue_trend.sql
===============================================================================

Objective
---------
Analyze the evolution of realized revenue over time.

Business Context
----------------
The commercial director needs to understand how sales have evolved since the
beginning of the operation in order to identify growth trends, seasonality
and changes in customer demand.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Revenue is calculated using the sale_price of each sold item.
- Revenue is aggregated at the monthly level.

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
Returns one row per month containing:
- year_month
- monthly_revenue

The result is sorted chronologically.
===============================================================================
*/

SELECT year_month, ROUND(SUM(sale_price), 2) AS monthly_revenue
FROM `projeto-e-commerce-501019.analytics.vw_sales`
WHERE status = 'Complete'
GROUP BY year_month
ORDER BY year_month;