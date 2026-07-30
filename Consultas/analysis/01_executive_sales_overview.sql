/*
===============================================================================
Analysis: Executive Sales Overview
File: 01_executive_sales_overview.sql
===============================================================================

Objective
---------
Calculate the main executive sales KPIs used in the dashboard.

Business Context
----------------
This analysis provides a high-level overview of the company's sales
performance by presenting the three primary executive KPIs used to monitor
business results.

These metrics support strategic decision-making by summarizing overall sales
performance in a simple and objective way.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Revenue is calculated using the sale_price of each sold item.
- Orders are counted using DISTINCT order_id to avoid counting multiple items belonging to the same order.
- Average ticket is calculated as:
    Total Revenue / Number of Completed Orders.

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
Returns a single row containing the following KPIs:
- total_revenue
- total_orders
- average_ticket
===============================================================================
*/

SELECT
    SUM(sale_price) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sale_price) / COUNT(DISTINCT order_id), 2) AS average_ticket
FROM `projeto-e-commerce-501019.analytics.vw_sales`
WHERE status = 'Complete';