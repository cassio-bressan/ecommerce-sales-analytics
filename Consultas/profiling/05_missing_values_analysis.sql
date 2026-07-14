-- ============================================================
-- Missing Values Analysis
-- ============================================================

-- ============================================================
-- Mandatory Analytical Fields
-- ============================================================

-- ------------------------------------------------------------
-- Users
-- Validate NULL values in mandatory analytical fields.
-- ------------------------------------------------------------

SELECT
    COUNTIF(id IS NULL) AS id_nulls,
    COUNTIF(gender IS NULL) AS gender_nulls,
    COUNTIF(age IS NULL) AS age_nulls,
    COUNTIF(created_at IS NULL) AS created_at_nulls
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- ------------------------------------------------------------
-- Orders
-- Validate NULL values in mandatory analytical fields.
-- ------------------------------------------------------------

SELECT
    COUNTIF(order_id IS NULL) AS order_id_nulls,
    COUNTIF(user_id IS NULL) AS user_id_nulls,
    COUNTIF(status IS NULL) AS status_nulls,
    COUNTIF(created_at IS NULL) AS created_at_nulls
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- ------------------------------------------------------------
-- Products
-- Validate NULL values in mandatory analytical fields.
-- ------------------------------------------------------------

SELECT
    COUNTIF(id IS NULL) AS id_nulls,
    COUNTIF(category IS NULL) AS category_nulls,
    COUNTIF(department IS NULL) AS department_nulls,
    COUNTIF(retail_price IS NULL) AS retail_price_nulls
FROM `bigquery-public-data.thelook_ecommerce.products`;

-- ------------------------------------------------------------
-- Order Items
-- Validate NULL values in mandatory analytical fields.
-- ------------------------------------------------------------

SELECT
    COUNTIF(id IS NULL) AS id_nulls,
    COUNTIF(order_id IS NULL) AS order_id_nulls,
    COUNTIF(user_id IS NULL) AS user_id_nulls,
    COUNTIF(product_id IS NULL) AS product_id_nulls,
    COUNTIF(sale_price IS NULL) AS sale_price_nulls,
    COUNTIF(status IS NULL) AS status_nulls,
    COUNTIF(created_at IS NULL) AS created_at_nulls
FROM `bigquery-public-data.thelook_ecommerce.order_items`;

-- ============================================================
-- Business Process Fields
-- ============================================================

-- ------------------------------------------------------------
-- Orders
-- Overall NULL count for operational timestamp fields.
-- ------------------------------------------------------------

SELECT
    COUNTIF(created_at IS NULL) AS created_at_nulls,
    COUNTIF(shipped_at IS NULL) AS shipped_at_nulls,
    COUNTIF(delivered_at IS NULL) AS delivered_at_nulls,
    COUNTIF(returned_at IS NULL) AS returned_at_nulls
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- ------------------------------------------------------------
-- Orders
-- Validate operational timestamps by order status.
-- ------------------------------------------------------------

SELECT
    status,
    COUNT(*) AS total_orders,
    COUNTIF(created_at IS NULL) AS created_at_nulls,
    COUNTIF(shipped_at IS NULL) AS shipped_at_nulls,
    COUNTIF(delivered_at IS NULL) AS delivered_at_nulls,
    COUNTIF(returned_at IS NULL) AS returned_at_nulls
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status
ORDER BY total_orders DESC;