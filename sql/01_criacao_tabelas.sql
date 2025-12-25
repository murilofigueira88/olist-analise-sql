-- ===============================
-- Projeto 4 - Análise SQL (Olist)
-- Criação das Tabelas
-- ===============================

CREATE DATABASE IF NOT EXISTS olist_sql;
USE olist_sql;

-- -------------------------------
-- Customers
-- -------------------------------
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

-- -------------------------------
-- Orders
-- -------------------------------
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- -------------------------------
-- Order Items
-- -------------------------------
CREATE TABLE order_items (
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- -------------------------------
-- Products
-- -------------------------------
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100)
);

-- -------------------------------
-- Payments
-- -------------------------------
CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- -------------------------------
-- Reviews
-- -------------------------------
CREATE TABLE reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);