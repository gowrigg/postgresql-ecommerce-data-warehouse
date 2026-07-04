--creating the warehouse schema using the oltp data

CREATE SCHEMA warehouse;

--creating the dim customer table with newly added surrogate key
CREATE TABLE warehouse.dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id VARCHAR(50) UNIQUE NOT NULL,
    customer_unique_id VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);


INSERT INTO warehouse.dim_customer (
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
)
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state
FROM oltp.customers;


--creating the dim product table with newly added surrogate key
CREATE TABLE warehouse.dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id VARCHAR(50) UNIQUE NOT NULL,
    product_category_name VARCHAR(100),
    product_weight_g INTEGER
);


INSERT INTO warehouse.dim_product (
    product_id,
    product_category_name,
    product_weight_g
)
SELECT
    product_id,
    product_category_name,
    product_weight_g
FROM oltp.products;

--creating the dim seller table with newly added surrogate key

CREATE TABLE warehouse.dim_seller (
    seller_key SERIAL PRIMARY KEY,
    seller_id VARCHAR(50) UNIQUE NOT NULL,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);


INSERT INTO warehouse.dim_seller (
    seller_id,
    seller_city,
    seller_state
)
SELECT
    seller_id,
    seller_city,
    seller_state
FROM oltp.sellers;

--creating the dim date table with newly added surrogate key


CREATE TABLE warehouse.dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    day INTEGER,
    weekday VARCHAR(20)
);

--creating the dim fact sales table with newly added surrogate key
CREATE TABLE warehouse.fact_sales (
    sale_key BIGSERIAL PRIMARY KEY,

    customer_key INTEGER NOT NULL,
    product_key INTEGER NOT NULL,
    seller_key INTEGER NOT NULL,
    date_key INTEGER NOT NULL,

    order_id VARCHAR(50),

    quantity INTEGER,
    sales_amount NUMERIC(10,2),
    freight_amount NUMERIC(10,2),

    FOREIGN KEY (customer_key)
        REFERENCES warehouse.dim_customer(customer_key),

    FOREIGN KEY (product_key)
        REFERENCES warehouse.dim_product(product_key),

    FOREIGN KEY (seller_key)
        REFERENCES warehouse.dim_seller(seller_key),

    FOREIGN KEY (date_key)
        REFERENCES warehouse.dim_date(date_key)
);


INSERT INTO warehouse.fact_sales (
    customer_key,
    product_key,
    seller_key,
    date_key,
    order_id,
    quantity,
    sales_amount,
    freight_amount
)
SELECT
    dc.customer_key,
    dp.product_key,
    ds.seller_key,
    dd.date_key,

    o.order_id,

    1 AS quantity,

    oi.price,

    oi.freight_value

FROM oltp.orders o

JOIN oltp.order_items oi
    ON o.order_id = oi.order_id

JOIN warehouse.dim_customer dc
    ON o.customer_id = dc.customer_id

JOIN warehouse.dim_product dp
    ON oi.product_id = dp.product_id

JOIN warehouse.dim_seller ds
    ON oi.seller_id = ds.seller_id

JOIN warehouse.dim_date dd
    ON DATE(o.order_purchase_timestamp) = dd.full_date;

/*Why is the warehouse query more complex?

Because it's performing the Transform step of ETL:

Extract data from OLTP.
Transform by joining tables and replacing business keys with surrogate keys.
Load the transformed data into the warehouse.
*/

--Creati a Complete Calendar (Production Standard)

---In enterprise data warehouses, we usually create a calendar table for every day, even if there were no orders.
