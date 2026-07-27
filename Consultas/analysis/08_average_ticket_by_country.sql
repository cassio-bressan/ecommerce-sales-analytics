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

Source Tables
-------------
- order_items (fact table)
- users (customer dimension)

Output
------
Returns one row per country containing:
- country
- average_ticket

The result is sorted from the highest to the lowest average ticket.
===============================================================================
*/

SELECT u.country AS country, ROUND(SUM(od.sale_price) / COUNT(DISTINCT order_id),2) AS average_ticket
FROM `bigquery-public-data.thelook_ecommerce.order_items`od
JOIN `bigquery-public-data.thelook_ecommerce.users` u ON u.id = od.user_id
WHERE od.status = 'Complete'
GROUP BY u.country
ORDER BY average_ticket DESC;