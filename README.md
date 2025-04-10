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






