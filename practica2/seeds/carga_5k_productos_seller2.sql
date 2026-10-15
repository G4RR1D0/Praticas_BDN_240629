LOAD DATA LOCAL INFILE 'C:/Users/PC-04/Desktop/BND/seeds/5000_productos.csv'
INTO TABLE tb_products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    id, sku, name, description, current_price, current_stock, creation_date, last_update, @status
)
SET status = IF(@status = '1', b'1', b'0');