SELECT COUNT(*)
FROM staging.stg_customers
WHERE customer_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_orders
WHERE order_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_products
WHERE product_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_order_items
WHERE order_item_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_order_payments
WHERE order_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_order_reviews
WHERE review_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_sellers
WHERE seller_id IS NULL;


SELECT *
FROM staging.stg_order_items
LIMIT 20;
