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

