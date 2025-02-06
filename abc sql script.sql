-- Use the northwind schema
USE northwind;

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
SELECT CustomerName, Address, PostalCode FROM customers;

-- Display info about each employee
SELECT FirstName, Notes FROM employees;

-- Display detail of the customer(s) who has Maria Larsson has their contact name 
SELECT * FROM customers where ContactName = 'Maria Larsson';

-- Please get the phone number of Federal Shipping and United Package
SELECT ShipperName, Phone FROM shippers WHERE ShipperName IN('Federal Shipping', 'United Package');

-- Count the number of customers we have in each country
SELECT Country, COUNT(Country) AS `Number of Customers` FROM customers GROUP BY Country ORDER BY `Number of Customers` DESC;

-- Calculate the total number of customers we have in the `Number of Customers`
SELECT COUNT(Country) AS `Total Number of Countries` FROM customers;

-- Count the number of customers we have in London and Madrid City 
SELECT City, COUNT(City) AS `Number of Customers` FROM customers where City IN('London', 'Madrid') GROUP BY City;

-- Get the Name, address and postal code of customers in london 
SELECT CustomerName, Address, PostalCode FROM customers WHERE City = "London";

-- Which country has the highest supplier
SELECT Country, COUNT(Country) AS `Number of Suppliers` FROM suppliers GROUP BY Country ORDER BY COUNT(Country) DESC LIMIT 2;

