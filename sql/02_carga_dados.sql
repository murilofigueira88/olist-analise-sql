USE olist_sql;

-- -------------------------------
-- Customers
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -------------------------------
-- Orders
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -------------------------------
-- Order Items
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -------------------------------
-- Products
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -------------------------------
-- Payments
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- -------------------------------
-- Reviews
-- -------------------------------
LOAD DATA LOCAL INFILE
'C:/Users/Admin/olist-analise-sql/data/raw/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;