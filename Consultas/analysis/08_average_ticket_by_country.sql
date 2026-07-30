/*
===============================================================================
Analysis: Average Order Value by Country
File: 08_average_ticket_by_country.sql
===============================================================================

Objective
---------
Calculate the average order value (average ticket) for each country based on
completed orders.

Business Context
----------------
This analysis compares customer purchasing behavior across different countries
by measuring the average revenue generated per completed order.

Unlike total revenue, the average ticket highlights markets where customers
tend to spend more per purchase, supporting strategic decisions related to
pricing, commercial initiatives and market prioritization.

Business Rule
-------------
- Only completed sales are considered (status = 'Complete').
- Average ticket is calculated as:
    Total Revenue / Number of Completed Orders.
- Orders are counted using DISTINCT order_id to avoid counting multiple items belonging to the same order.
- All countries are included in the analysis.

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
Returns one row per country containing:
- country
- average_ticket

The result is sorted from the highest to the lowest average ticket.
===============================================================================
*/

SELECT country, ROUND(SUM(sale_price) / COUNT(DISTINCT order_id),2) AS average_ticket
FROM `projeto-e-commerce-501019.analytics.vw_sales`
WHERE status = 'Complete'
GROUP BY country
ORDER BY average_ticket DESC;
