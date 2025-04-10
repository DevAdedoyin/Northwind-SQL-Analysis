# 🧾 Northwind Data Analysis Using MySQL

This project contains a detailed SQL analysis of the Northwind sample database, covering various business aspects like customer behavior, product performance, revenue, and order trends.

---

## 📘 Table of Contents

1. [Introduction](#introduction)
2. [Database Setup](#database-setup)
3. [Data Exploration](#data-exploration)
4. [Customer Insights](#customer-insights)
5. [Supplier & Product Insights](#supplier--product-insights)
6. [Sales & Revenue Analysis](#sales--revenue-analysis)
7. [Order Analysis](#order-analysis)
8. [Performance Metrics](#performance-metrics)
9. [Advanced Queries](#advanced-queries)
10. [Views & Indexing](#views--indexing)
11. [Conclusion](#conclusion)

---

## 🧠 Introduction

The Northwind database is a classic dataset representing a fictional company that imports and exports specialty foods. This project explores various SQL techniques to gain insights into its operations.

---

## 🛠 Database Setup

- Ensure you're using a compatible SQL engine (e.g., MySQL or MariaDB).
- Load the Northwind schema and data before running the queries.
- Ensure you have the three `sql` files in this project

---

## 🔍 Data Exploration

Initial queries to inspect the structure and sample contents of key tables such as:
- `customers`
- `employees`
- `orders`
- `order_details`
- `products`
- `categories`

### Data Exploration Code and Output

```
-- Retrieve all columns from the customers table.
SELECT * FROM customers;
```
![Screenshot 2025-04-10 at 10 27 07](https://github.com/user-attachments/assets/97cc139c-f136-481e-b9e0-f4cd0ed00324)

```
-- Retrieve all columns from the employees table.
SELECT * FROM employees;
```
![Screenshot 2025-04-10 at 10 31 19](https://github.com/user-attachments/assets/d22b61b0-0f0d-43aa-9066-084a7b7fa5ef)

```
-- Retrieve all columns from the categories table.
SELECT * FROM categories;
```
![Screenshot 2025-04-10 at 10 33 45](https://github.com/user-attachments/assets/6e3dc2cb-74c0-431f-a84d-13fe74b58940)

```
-- Retrieve all columns from the shippers table.
SELECT * FROM shippers;
```
![Screenshot 2025-04-10 at 10 34 58](https://github.com/user-attachments/assets/ba42948c-255a-45ea-bb07-67a9fa68e370)

```
-- Retrieve all columns from the suppliers table.
SELECT * FROM suppliers;
```
![Screenshot 2025-04-10 at 10 35 59](https://github.com/user-attachments/assets/78d4d597-72a6-4717-a443-f1e5a976ed52)

```
-- Retrieve all columns from the products table.
SELECT * FROM products;
```
![Screenshot 2025-04-10 at 10 39 36](https://github.com/user-attachments/assets/b2f7ee12-5192-404c-8f11-b8a43eab6f3c)

```
-- Retrieve all columns from the orders table.
SELECT * FROM orders;
```
![Screenshot 2025-04-10 at 10 40 43](https://github.com/user-attachments/assets/c8ea695a-8e98-4e6d-b50e-f89a2cd588ab)

```
-- Retrieve all columns from the order_details table.
SELECT * FROM order_details;
```
![Screenshot 2025-04-10 at 10 42 00](https://github.com/user-attachments/assets/3d81b3cf-b780-420d-8f11-b180b1265fcf)

---

## 👥 Customer Insights

- Count customers by country/city
- Identify customers in London or with specific contact names
- Retrieve specific contact information

### Customer Insights Code and Output
```
-- Retrieve customer name, address, and post code from the customers table.
SELECT company_name, address, postal_code FROM customers;
```
![Screenshot 2025-04-10 at 11 01 04](https://github.com/user-attachments/assets/27808dfc-3d48-4692-99cb-d9d427b355ae)


```
-- Display info about each employee
SELECT first_name, Notes FROM employees;
```
![Screenshot 2025-04-10 at 11 02 22](https://github.com/user-attachments/assets/b7ae84cc-65ee-4915-80ad-0b5cf3f2d4a7)


```
-- Display detail of the customer(s) who has Maria Larsson as their contact name
SELECT * FROM customers WHERE contact_name = 'Maria Larsson';
```
![Screenshot 2025-04-10 at 11 03 06](https://github.com/user-attachments/assets/95580334-73cb-4460-a90b-824cd7a5d1cc)


```
-- Get the phone number of Federal Shipping and United Package
SELECT company_name, Phone FROM shippers WHERE company_name IN('Federal Shipping', 'United Package');
```
![Screenshot 2025-04-10 at 11 04 42](https://github.com/user-attachments/assets/b4124331-5b4c-460a-a9ab-a840e687f6c0)


```
-- Count the number of customers we have in each country
SELECT Country, COUNT(Country) AS `Number of Customers` FROM customers GROUP BY Country ORDER BY `Number of Customers` DESC;
```
![Screenshot 2025-04-10 at 11 06 24](https://github.com/user-attachments/assets/f2504e5d-1b7c-4ad6-89da-2d72d56419cc)


```
-- Calculate the total number of countries with customers
SELECT COUNT(DISTINCT Country) AS `Total Number of Countries` FROM customers;
```
![Screenshot 2025-04-10 at 11 07 50](https://github.com/user-attachments/assets/f3356868-5315-429c-8a1e-ce1043aaffa9)


```
-- Count the number of customers we have in London and Madrid City
SELECT City, COUNT(City) AS `Number of Customers` FROM customers WHERE City IN('London', 'Madrid') GROUP BY City;
```
![Screenshot 2025-04-10 at 11 08 35](https://github.com/user-attachments/assets/9babc495-5909-4021-a097-e02b6355ddaa)


```
-- Get the Name, address and postal code of customers in London
SELECT company_name, address, postal_code FROM customers WHERE City = 'London';
```
![Screenshot 2025-04-10 at 11 09 15](https://github.com/user-attachments/assets/2e7950d1-040d-494e-b1b7-1efd45187ba0)

---

## 📦 Supplier & Product Insights

- Analyze suppliers by country
- Identify top-priced or discontinued products
- Category-to-product relationships
- Products not sold and price-based filters

### Supplier & Products Insights Code and Output
```
-- Which country has the highest supplier
SELECT Country, COUNT(Country) AS `Number of Suppliers` FROM suppliers GROUP BY Country ORDER BY COUNT(Country) DESC LIMIT 1;
```
![Screenshot 2025-04-10 at 11 29 41](https://github.com/user-attachments/assets/bcf62ddf-9d26-4f2e-a967-b747c5aa2d8c)


```
-- Get the product name and product ID for product with unit price greater than 50
SELECT product_id, product_name, unit_price FROM products WHERE unit_price > 50 ORDER BY unit_price DESC;
```
![Screenshot 2025-04-10 at 11 30 56](https://github.com/user-attachments/assets/deaf459f-7fe3-48dd-93ab-891cd2254e0c)


```
-- Get the total number of discontinued order
SELECT SUM(discontinued) AS `Total Discontinued Orders` FROM products;
```
![Screenshot 2025-04-10 at 11 31 40](https://github.com/user-attachments/assets/e646569e-9941-43d0-9493-96c55af398ee)


```
-- Calculate the average unit_price of products in the Products table to 2dp
SELECT ROUND(AVG(unit_price), 2) AS `Average Unit Price` FROM products;
```
![Screenshot 2025-04-10 at 11 32 21](https://github.com/user-attachments/assets/6bd7b312-0501-4184-9aba-fa1338500f6d)


```
-- Display the category each product belongs to
SELECT products.category_id, products.product_name, categories.category_name
FROM products
INNER JOIN categories ON products.category_id = categories.category_id;
```
![Screenshot 2025-04-10 at 11 33 25](https://github.com/user-attachments/assets/993a3762-3521-4aa0-bad7-99b61666b6ac)


```
-- Find the total unit price for products whose categories are beverages
SELECT categories.category_name, SUM(products.unit_price) AS `Total Beverage Unit Price`
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE categories.category_name = 'Beverages';
```
![Screenshot 2025-04-10 at 11 34 28](https://github.com/user-attachments/assets/2ac9aab7-9f9b-4e55-8389-3ed55691820c)


```
-- Display the products that have between 40 to 100 worth unit price
SELECT products.product_name, products.unit_price FROM products WHERE unit_price BETWEEN 40 AND 100;
```
![Screenshot 2025-04-10 at 11 35 13](https://github.com/user-attachments/assets/9efcb503-6c78-4de1-9791-e173ff2c5895)


```
-- Find the Products Not Sold from Products table
SELECT products.product_id, products.product_name
FROM products
WHERE products.product_id NOT IN (SELECT DISTINCT order_details.product_id FROM order_details);
```
![Screenshot 2025-04-10 at 11 36 54](https://github.com/user-attachments/assets/afc834d0-7448-4429-afcd-9865d5f91e2e)

---

## 💰 Sales & Revenue Analysis

- Total freight and product revenue
- Monthly order count and revenue trends
- Categorize orders by total amount
- Rank products by revenue

```
-- What is the total freight order to 2dp
SELECT ROUND(SUM(freight), 2) AS `Total Freight` FROM orders;
```
![Screenshot 2025-04-10 at 11 43 29](https://github.com/user-attachments/assets/5c54c0dc-2180-47b8-81b6-0dd2958a9c69)


```
-- Retrieve the product_name and total_price from the order_details table, calculating the total_price as quantity multiplied by unit_price.
SELECT products.product_name, order_details.unit_price * order_details.quantity AS `Total Price`
FROM order_details
INNER JOIN products ON products.product_id = order_details.product_id;
```
![Screenshot 2025-04-10 at 11 47 30](https://github.com/user-attachments/assets/6bbc68cd-4bd5-427e-9874-ceef6e5cae49)


```
-- Calculate the total revenue generated from sales for each product category.
SELECT categories.category_name, ROUND(SUM(order_details.unit_price * order_details.quantity), 2) AS `Total Revenue`
FROM categories
JOIN products ON categories.category_id = products.category_id
JOIN order_details ON order_details.product_id = products.product_id
GROUP BY categories.category_name
ORDER BY `Total Revenue` DESC;
```
![Screenshot 2025-04-10 at 11 48 35](https://github.com/user-attachments/assets/f7f9f452-4797-4d9f-a56a-ae7e6feb84b5)


```
-- Retrieve the product name and total sales revenue for each product.
SELECT products.product_name, SUM(order_details.unit_price * order_details.quantity) AS `Total Sales Revenue`
FROM order_details
JOIN products ON order_details.product_id = products.product_id
GROUP BY products.product_name;
```
![Screenshot 2025-04-10 at 11 50 31](https://github.com/user-attachments/assets/4d26b27a-fce5-4053-8ca0-57c59e672965)
