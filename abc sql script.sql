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
SELECT ROUND(SUM(freight)) AS `Total Freight` FROM orders;