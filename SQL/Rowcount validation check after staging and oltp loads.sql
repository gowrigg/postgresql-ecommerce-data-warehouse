--checking staging and oltp loaded data count for validation

SELECT
    (SELECT COUNT(*) FROM staging.stg_customers) AS staging_count,
    (SELECT COUNT(*) FROM oltp.customers) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_orders) AS staging_count,
    (SELECT COUNT(*) FROM oltp.orders) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_products) AS staging_count,
    (SELECT COUNT(*) FROM oltp.products) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_sellers) AS staging_count,
    (SELECT COUNT(*) FROM oltp.sellers) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_order_items) AS staging_count,
    (SELECT COUNT(*) FROM oltp.order_items) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_order_payments) AS staging_count,
    (SELECT COUNT(*) FROM oltp.order_payments) AS oltp_count;

SELECT
    (SELECT COUNT(*) FROM staging.stg_order_reviews) AS staging_count,
    (SELECT COUNT(*) FROM oltp.order_reviews) AS oltp_count;

SELECT
	COUNT(*)
FROM
	OLTP.ORDERS O
	LEFT JOIN OLTP.CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE
	C.CUSTOMER_ID IS NULL;

--Referential Integrity Check for each relations

SELECT
	COUNT(*)
FROM
	OLTP.ORDERS O
	LEFT JOIN OLTP.CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE
	C.CUSTOMER_ID IS NULL;

SELECT
	COUNT(*)
FROM
	OLTP.order_items oi
	LEFT JOIN OLTP.orders o ON oi.order_id = o.order_id
WHERE
	oi.order_id IS NULL;


SELECT
	COUNT(*)
FROM
	OLTP.order_items oi
	LEFT JOIN OLTP.products p ON oi.product_id = p.product_id
WHERE
	oi.product_id IS NULL;

SELECT
	COUNT(*)
FROM
	OLTP.order_items oi
	LEFT JOIN OLTP.sellers s ON oi.seller_id = s.seller_id
WHERE
	oi.seller_id IS NULL;

SELECT
	COUNT(*)
FROM
	OLTP.order_payments op
	LEFT JOIN OLTP.orders o ON op.order_id = o.order_id
WHERE
	op.order_id IS NULL;


SELECT
	COUNT(*)
FROM
	OLTP.order_reviews ors
	LEFT JOIN OLTP.orders o ON ors.order_id = o.order_id
WHERE
	ors.order_id IS NULL;