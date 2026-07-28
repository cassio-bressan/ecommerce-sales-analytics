/*
===============================================================================
Analysis: Order Status Distribution
File: 09_order_status_distribution.sql
===============================================================================

Objective
---------
Analyze the distribution of orders across their current status.

Business Context
----------------
This analysis provides an operational overview of the order lifecycle by
showing how orders are distributed among the available status categories.

It helps identify the proportion of completed, shipped, processing, cancelled
and returned orders, supporting operational monitoring and process evaluation.

Business Rule
-------------
- All orders are considered.
- No status filtering is applied.
- Each order is counted once according to its current status.

Source Tables
-------------
- orders

Output
------
Returns one row per order status containing:
- status
- orders_count

The result is sorted from the highest to the lowest number of orders.
===============================================================================
*/

SELECT status, COUNT(order_id) AS orders_count
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY orders_count DESC;