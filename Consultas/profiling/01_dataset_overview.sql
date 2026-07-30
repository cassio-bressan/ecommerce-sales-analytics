/*
===============================================================================
Dataset Overview
File: 01_dataset_overview.sql
===============================================================================

Objective
---------
Provide a high-level overview of the datasets used in the project.

Business Context
----------------
Before performing data profiling and business analysis, it is important to
understand the size of the available data. This overview summarizes the
number of records in each core table used throughout the project.

Source Tables
-------------
- users
- products
- orders
- order_items

Output
------
Returns the number of records for each table.
===============================================================================
*/

SELECT
    'users' AS table_name,
    COUNT(*) AS total_records
FROM `bigquery-public-data.thelook_ecommerce.users`

UNION ALL

SELECT
    'products',
    COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.products`

UNION ALL

SELECT
    'orders',
    COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.orders`

UNION ALL

SELECT
    'order_items',
    COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.order_items`;