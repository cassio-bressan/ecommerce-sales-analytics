-- Executive Sales Overview
-- ============================================================
-- Objective:
-- Calculate the main executive sales KPIs used in the dashboard.
--
-- Business Context:
-- The commercial director needs a high-level view of the e-commerce
-- performance, focusing on realized revenue, completed orders,
-- and average order value.
--
-- Business Rule:
-- Only records with status = 'Complete' are considered realized sales.
-- Orders that are Processing, Shipped, Cancelled, or Returned are
-- excluded from the KPI calculation.
--
-- Source Table:
-- bigquery-public-data.thelook_ecommerce.order_items
--
-- KPIs:
-- 1. total_revenue  -> Sum of all completed sales values.
-- 2. total_orders   -> Number of unique completed orders.
-- 3. average_ticket -> Average revenue generated per completed order.
-- ============================================================

SELECT SUM(sale_price) AS total_revenue, 
    COUNT( DISTINCT order_id) AS total_orders, 
    ROUND(SUM(sale_price) / COUNT(DISTINCT order_id),2) AS average_ticket
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete';