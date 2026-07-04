INSERT INTO oltp.customers
SELECT *
FROM staging.stg_customers;

INSERT INTO oltp.products
SELECT *
FROM staging.stg_products;

INSERT INTO oltp.sellers
SELECT *
FROM staging.stg_sellers;


INSERT INTO oltp.orders
SELECT *
FROM staging.stg_orders;

INSERT INTO oltp.order_items
SELECT *
FROM staging.stg_order_items;


INSERT INTO oltp.order_payments
SELECT *
FROM staging.stg_order_payments;


INSERT INTO oltp.order_reviews
SELECT *
FROM staging.stg_order_reviews;


SELECT COUNT(*)
FROM oltp.order_payments;


SELECT COUNT(*)
FROM oltp.order_reviews;
