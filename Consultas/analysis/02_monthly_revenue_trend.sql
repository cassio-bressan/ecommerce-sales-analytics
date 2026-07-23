-- ============================================================
-- Monthly Revenue Trend
-- ============================================================
-- Objective:
-- Analyze the evolution of realized revenue over time.
--
-- Business Context:
-- The commercial director needs to understand how sales have
-- evolved since the beginning of the operation and identify
-- growth trends, seasonality, and changes in demand.
--
-- Business Rule:
-- Only records with status = 'Complete' are considered realized sales.
--
-- Time Grain:
-- Monthly
--
-- Source Table:
-- bigquery-public-data.thelook_ecommerce.order_items
--
-- Output:
-- One row per month containing the realized revenue for that period.
-- ============================================================

SELECT FORMAT_DATE('%Y-%m', DATE_TRUNC(DATE(created_at), MONTH)) AS year_month , ROUND(SUM(sale_price),2) AS monthly_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` 
WHERE status = 'Complete'
GROUP BY year_month
ORDER BY year_month ASC;