/*
===============================================================================
View: vw_sales
File: vw_sales.sql
===============================================================================

Objective
---------
Create a consolidated analytical view containing sales, product and customer
information to support business intelligence analyses and dashboard creation.

Business Context
----------------
This view centralizes the most relevant attributes from the transactional
tables into a single analytical layer.

Instead of repeatedly joining multiple tables in every query, analysts and
dashboard tools can use this view as a single source of truth for sales
analysis.

The view is designed to support KPIs and visualizations such as:

- Total Revenue
- Total Orders
- Average Ticket
- Monthly Revenue
- Monthly Orders
- Revenue by Category
- Revenue by Department
- Top Products
- Top Customers
- Revenue by Country
- Revenue by State
- Order Status Distribution

Source Tables
-------------
- order_items (fact table)
- products
- users

Business Rules
--------------
- No status filtering is applied.
- All orders are preserved.
- Customer name is standardized into a single field.
- Time dimensions are precomputed for dashboard consumption.

Output
------
One row per order item enriched with product, customer and temporal
attributes.
===============================================================================
*/

CREATE OR REPLACE VIEW `projeto-e-commerce-501019.analytics.vw_sales`
AS 

SELECT
-- ============================================================================
-- Identifiers
-- ============================================================================
    od.order_id,
    od.user_id,
    od.product_id,
-- ============================================================================
-- Sales Information
-- ============================================================================
    od.sale_price,
    od.status,
    od.created_at AS order_created_at,
-- ============================================================================
-- Time Dimensions
-- ============================================================================
    EXTRACT(YEAR FROM od.created_at) AS order_year,
    EXTRACT(MONTH FROM od.created_at) AS order_month,
    DATE_TRUNC(DATE(order_created_at), MONTH) AS year_month,
-- ============================================================================
-- Product Information
-- ============================================================================
    p.name AS product_name,
    p.category,
    p.department,
-- ============================================================================
-- Customer Information
-- ============================================================================
    CONCAT(u.first_name,' ', u.last_name) AS customer_name,
    u.gender,
    u.age,
-- ============================================================================
-- Geographic Information
-- ============================================================================
    u.country,
    u.state,
    u.city
-- ============================================================================
-- Joins
-- ============================================================================
FROM `bigquery-public-data.thelook_ecommerce.order_items` od
JOIN `bigquery-public-data.thelook_ecommerce.users` u ON u.id = od.user_id
JOIN `bigquery-public-data.thelook_ecommerce.products` p ON p.id = od.product_id;