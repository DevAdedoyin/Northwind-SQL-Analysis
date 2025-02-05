-- Use the northwind schema
USE northwind;

-- Retrieve all columns from the customers table.
SELECT * FROM customers; 

-- Retrieve customer name, address, and post code from the customers table.
SELECT CustomerName, Address, PostalCode FROM customers;

-- Retrieve all columns from the employees table.
SELECT * FROM employees;

-- Display info about each employee
SELECT FirstName, Notes FROM employees;

-- Display detail of the customer(s) who has Maria Larsson has their contact name 
SELECT * FROM customers where ContactName = 'Maria Larsson';