-- ============================================================
-- Referential Integrity Validation
-- ============================================================

-- Check 1: Orders → Users
-- Verify if every order references an existing user.

SELECT order_id
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE user_id NOT IN (
    SELECT id
    FROM `bigquery-public-data.thelook_ecommerce.users`
    WHERE id IS NOT NULL
);

-- ============================================================

-- Check 2: Order Items → Orders
-- Verify if every order item references an existing order.

SELECT order_id
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE order_id NOT IN (
    SELECT order_id
    FROM `bigquery-public-data.thelook_ecommerce.orders`
    WHERE order_id IS NOT NULL
);

-- ============================================================

-- Check 3: Order Items → Products
-- Verify if every order item references an existing product.

SELECT product_id
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE product_id NOT IN (
    SELECT id
    FROM `bigquery-public-data.thelook_ecommerce.products`
    WHERE id IS NOT NULL
);

-- ============================================================

-- Check 4: Order Items → Users
-- Verify if every order item references an existing user.

SELECT user_id
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE user_id NOT IN (
    SELECT id
    FROM `bigquery-public-data.thelook_ecommerce.users`
    WHERE id IS NOT NULL
);