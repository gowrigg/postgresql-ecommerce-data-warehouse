SELECT COUNT(*)
FROM staging.stg_customers;

SELECT COUNT(*)
FROM staging.stg_products;

SELECT COUNT(*)
FROM staging.stg_sellers;

SELECT COUNT(*)
FROM staging.stg_order_items;


SELECT COUNT(*)
FROM staging.stg_order_payments;


SELECT COUNT(*)
FROM staging.stg_order_reviews;

SELECT COUNT(*)
FROM staging.stg_geolocation;

SELECT COUNT(*)
FROM staging.stg_category_translation;


SELECT COUNT(*) total_rows,
       COUNT(DISTINCT customer_id) unique_rows
FROM staging.stg_customers;

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT order_id) unique_rows
FROM staging.stg_orders;

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT product_id) unique_rows
FROM staging.stg_products;

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT seller_id) unique_rows
FROM staging.stg_sellers;

SELECT COUNT(*) total_rows,
       COUNT(DISTINct order_item_id) unique_rows
FROM staging.stg_order_items;

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT order_id) unique_rows
FROM staging.stg_order_payments;

SELECT COUNT(*) total_rows,
       COUNT(DISTINCT review_id) unique_rows
FROM staging.stg_order_reviews;

SELECT customer_id,
       COUNT(*)
FROM staging.stg_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


SELECT order_id,
       COUNT(*)
FROM staging.stg_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_id,order_item_id,
       COUNT(*)
FROM staging.stg_order_items
GROUP BY order_id,order_item_id
HAVING COUNT(*) > 1;


SELECT COUNT(*)
FROM staging.stg_orders o
LEFT JOIN staging.stg_customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*)
FROM staging.stg_order_items oi
LEFT JOIN staging.stg_products p
ON oi.product_id = p.product_id
where p.product_id IS NULL;

