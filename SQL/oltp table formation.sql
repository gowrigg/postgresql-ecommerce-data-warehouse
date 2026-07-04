create table oltp.customers (
customer_id varchar(50) primary key,
customer_unique_id varchar(50) not null,
customer_zip_code_prefix integer,
customer_city varchar(100),
customer_state char(2)
);

CREATE TABLE oltp.products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

CREATE TABLE oltp.products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);


DROP TABLE IF EXISTS oltp.orders;

CREATE TABLE oltp.orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    order_status VARCHAR(50),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES oltp.customers(customer_id)
);


CREATE TABLE oltp.sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

CREATE TABLE oltp.order_items (
    order_id VARCHAR(50),
    order_item_id INTEGER,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),

    PRIMARY KEY (order_id, order_item_id),

    FOREIGN KEY (order_id)
        REFERENCES oltp.orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES oltp.products(product_id),

    FOREIGN KEY (seller_id)
        REFERENCES oltp.sellers(seller_id)
);

CREATE TABLE oltp.order_payments (
    order_id VARCHAR(50),
    payment_sequential INTEGER,
    payment_type VARCHAR(50),
    payment_installments INTEGER,
    payment_value NUMERIC(10,2),

    PRIMARY KEY(order_id, payment_sequential),

    FOREIGN KEY(order_id)
        REFERENCES oltp.orders(order_id)
);
drop table if exists oltp.order_reviews;
CREATE TABLE oltp.order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,

	PRIMARY KEY (review_id,order_id),

    FOREIGN KEY(order_id)
        REFERENCES oltp.orders(order_id)
);

-- business constraints
-- review the score


alter table oltp.order_reviews
add constraint chk_review_score
check (review_score between 1 and 5);

--payment value

alter table oltp.order_payments
add constraint chk_payment_value
check (payment_value >=0);

--price check
ALTER TABLE oltp.order_items
ADD CONSTRAINT chk_price
CHECK (price >= 0);

--freight check

ALTER TABLE oltp.order_items
ADD CONSTRAINT chk_freight
CHECK (freight_value >= 0);



