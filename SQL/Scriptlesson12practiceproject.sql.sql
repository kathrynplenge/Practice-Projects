-- develop tables for products, customers, and sales --

PRAGMA foreign_keys = ON;

CREATE TABLE product (
    p_code    INT          PRIMARY KEY,
    p_name    VARCHAR(50)  NOT NULL,
    price     DECIMAL(10,2) NOT NULL,
    stock     INT          NOT NULL,
    category  VARCHAR(50)
);

CREATE TABLE customer (
    c_id        INT          PRIMARY KEY,
    c_name      VARCHAR(50)  NOT NULL,
    c_location  VARCHAR(50),
    c_phoneno   VARCHAR(15)
);

CREATE TABLE sales (
    order_date  DATE         NOT NULL,
    order_no    VARCHAR(10)  PRIMARY KEY,
    c_id        INT          NOT NULL,
    c_name      VARCHAR(50),
    s_code      INT          NOT NULL,
    p_name      VARCHAR(50),
    qty         INT          NOT NULL,
    price       DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (c_id)   REFERENCES customer(c_id),
    FOREIGN KEY (s_code) REFERENCES product(p_code)
);


-- checking work and making sure data was imported correctly --
SELECT *
FROM customer 

SELECT *
FROM product

-- all data imported correctly --

-- insert values into sales table--

   INSERT INTO sales (order_date, order_no, c_id, c_name, s_code, p_name, qty, price) VALUES
('2016-07-24', 'HM06', 9212, 'Jessica', 11, 'pencil',      3,   30),
('2016-10-19', 'HM09', 3921, 'Mukesh',  17, 'biscuits',   10,  600),
('2016-10-30', 'HM10', 9875, 'Stephen',  2, 'cornoto',    10,  500),
('2018-04-12', 'HM03', 1212, 'Oliver',  20, 'kiwi',        3,  420),
('2018-05-02', 'HM05', 1910, 'Mohan',   20, 'kiwi',        2,  280),
('2018-09-20', 'HM08', 5334, 'Chirsty', 16, 'chocolate',   2,   50),
('2019-01-11', 'HM07', 1246, 'Vignesh', 19, 'apple',       5,  600),
('2019-03-15', 'HM01', 1910, 'Mohan',    5, 'mayanoise',   4,  360),
('2021-02-10', 'HM04', 1111, 'Nisha',   25, 'conditioner', 5, 1000),
('2021-02-12', 'HM02', 2123, 'Biyush',   3, 'Pen',         2,   20);


-- order ID, customer ID, order date, price, and quantity from sales --
SELECT order_no, c_id, order_date, price, qty
FROM sales;

-- details from product table where the category is stationary --
SELECT *
FROM product
WHERE category = 'Stationary';

-- unique categories in the product table --
SELECT DISTINCT category
FROM product;

-- product details in descending order of price --
SELECT *
FROM product
ORDER BY price DESC;













