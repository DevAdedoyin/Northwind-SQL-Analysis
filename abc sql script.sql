-- Use the northwind schema
USE Tesco_Lidl;

-- Retrieve all columns from the customers table.
SELECT * FROM customers; 

-- Retrieve all columns from the employees table.
SELECT * FROM employees;

-- Retrieve all columns from the categories table.
SELECT * FROM categories;

-- Retrieve all columns from the shippers table.
SELECT * FROM shippers;

-- Retrieve all columns from the suppliers table.
SELECT * FROM suppliers;

-- Retrieve customer name, address, and post code from the customers table.
SELECT company_name, address, postal_code FROM customers;

-- Display info about each employee
SELECT first_name, Notes FROM employees;

-- Display detail of the customer(s) who has Maria Larsson has their contact name 
SELECT * FROM customers where contact_name = 'Maria Larsson';

-- Please get the phone number of Federal Shipping and United Package
SELECT company_name, Phone FROM shippers WHERE company_name IN('Federal Shipping', 'United Package');

-- Count the number of customers we have in each country
SELECT Country, COUNT(Country) AS `Number of Customers` FROM customers GROUP BY Country ORDER BY `Number of Customers` DESC;

-- Calculate the total number of customers we have in the `Number of Customers`
SELECT COUNT(Country) AS `Total Number of Countries` FROM customers;

-- Count the number of customers we have in London and Madrid City 
SELECT City, COUNT(City) AS `Number of Customers` FROM customers where City IN('London', 'Madrid') GROUP BY City;

-- Get the Name, address and postal code of customers in london 
SELECT company_name, address, postal_code FROM customers WHERE City = "London";

-- Which country has the highest supplier
SELECT Country, COUNT(Country) AS `Number of Suppliers` FROM suppliers GROUP BY Country ORDER BY COUNT(Country) DESC LIMIT 1;

-- Retrieve all columns from the products table.
SELECT * FROM products;

-- Retrieve all columns from the orders table.
SELECT * FROM orders;

-- Retrieve all columns from the order_details table.
SELECT * FROM order_details;

-- Retrieve all columns from the categories table.
SELECT * FROM categories; 

-- Get data for all order that was shipped on 1997-02-14
SELECT * FROM  orders WHERE shipped_date = '1997-02-14';

-- Get the product name and product ID for product with unit price greater than 50
SELECT product_id, product_name, unit_price FROM products where unit_price > 50 ORDER BY unit_price DESC; 

-- Get the total number of discontinued order 
SELECT SUM(discontinued) AS `Total Discontinued Orders` FROM products;

-- Calculate the average unit_price of products in the Products table to 2dp
SELECT ROUND(AVG(unit_price), 2) AS `Average Unit Price` FROM products;

-- What is the total freight order to 2dp
SELECT ROUND(SUM(freight), 2) AS `Total Freight` FROM orders;

-- Count order Per Day from the order table
SELECT  order_date, COUNT(order_date) AS `Order Count` FROM orders GROUP BY order_date ORDER BY `Order Count` DESC;

-- Retrieve product_name and unit_price from the Products table with the Highest Unit Price
SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 1;

-- Display the order id and full date in letter format
SELECT order_id, DATE_FORMAT(order_date, '%a %D %M, %Y') AS `Date` FROM orders LIMIT 20;

-- Display the category each product belongs to
SELECT products.category_id, products.product_name, categories.category_name
FROM products
INNER JOIN categories ON products.category_id = categories.category_id; 

-- Find the total unit price for products whose categories are beverages
SELECT categories.category_name, SUM(products.unit_price) AS `Total Beverage Unit Price`
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE categories.category_name = 'Beverages';

-- Display the products that his between 40 to 100 worth unit price
SELECT products.product_name, products.unit_price FROM products WHERE unit_price BETWEEN 40 AND 100;

-- Retrieve the product_name and total_price from the order_details table, calculating the total_price as quantity multiplied by unit_price.
SELECT products.product_name, order_details.unit_price * order_details.quantity AS `Total Price`
FROM order_details
INNER JOIN products ON products.product_id = order_details.product_id;

-- Identify the Most Frequently Sold Product from order_details
SELECT products.product_name, COUNT(order_details.product_id) AS `Times Sold`
FROM order_details
JOIN products ON products.product_id = order_details.product_id
GROUP BY order_details.product_id
ORDER BY `Times Sold` DESC LIMIT 1;

-- Find the Products Not Sold from Products table
SELECT products.product_id, products.product_name
FROM products
WHERE products.product_id NOT IN (SELECT DISTINCT order_details.product_id FROM order_details);

-- Calculate the total revenue generated from sales for each product category.
SELECT categories.category_name, ROUND(SUM(order_details.unit_price * order_details.quantity), 2) AS `Total Revenue`
FROM categories
JOIN products ON categories.category_id = products.category_id
JOIN order_details ON order_details.product_id = products.product_id
GROUP BY categories.category_name
ORDER BY `Total Revenue` DESC;

-- Find the product category with the highest average unit price.
SELECT categories.category_name, AVG(order_details.unit_price) AS `Average Unit Price`
FROM categories
JOIN products ON products.category_id = categories.category_id 
JOIN order_details ON order_details.product_id = products.product_id
GROUP BY categories.category_name
ORDER BY `Average Unit Price` DESC LIMIT 1;

-- Count the number of orders made in each month.
SELECT DATE_FORMAT(orders.order_date, '%Y-%m') AS month, COUNT(*) AS `Order Count`
FROM orders
GROUP BY month;

-- Retrieve order details for Products with 'Coffee' in their name
SELECT order_details.order_id, products.product_name, order_details.product_id, order_details.unit_price
FROM order_details
JOIN products ON products.product_id = order_details.product_id
WHERE products.product_name LIKE '%Coffee%';