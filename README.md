# 📟 Northwind Data Analysis Using MySQL

This project contains a detailed SQL analysis of the Northwind sample database, covering various business aspects like customer behavior, product performance, revenue, and order trends.

![northwind](https://github.com/user-attachments/assets/d00d865f-5f57-4ea0-89f2-8ea120a7fe97)

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
9. [Conclusion](#conclusion)
10. [License](#license)  

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
<br />
<br />
```
-- Retrieve all columns from the employees table.
SELECT * FROM employees;
```
![Screenshot 2025-04-10 at 10 31 19](https://github.com/user-attachments/assets/d22b61b0-0f0d-43aa-9066-084a7b7fa5ef)
<br />
<br />
```
-- Retrieve all columns from the categories table.
SELECT * FROM categories;
```
![Screenshot 2025-04-10 at 10 33 45](https://github.com/user-attachments/assets/6e3dc2cb-74c0-431f-a84d-13fe74b58940)
<br />
<br />
```
-- Retrieve all columns from the shippers table.
SELECT * FROM shippers;
```
![Screenshot 2025-04-10 at 10 34 58](https://github.com/user-attachments/assets/ba42948c-255a-45ea-bb07-67a9fa68e370)
<br />
<br />
```
-- Retrieve all columns from the suppliers table.
SELECT * FROM suppliers;
```
![Screenshot 2025-04-10 at 10 35 59](https://github.com/user-attachments/assets/78d4d597-72a6-4717-a443-f1e5a976ed52)
<br />
<br />
```
-- Retrieve all columns from the products table.
SELECT * FROM products;
```
![Screenshot 2025-04-10 at 10 39 36](https://github.com/user-attachments/assets/b2f7ee12-5192-404c-8f11-b8a43eab6f3c)
<br />
<br />
```
-- Retrieve all columns from the orders table.
SELECT * FROM orders;
```
![Screenshot 2025-04-10 at 10 40 43](https://github.com/user-attachments/assets/c8ea695a-8e98-4e6d-b50e-f89a2cd588ab)
<br />
<br />
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
<br />
<br />
```
-- Display info about each employee
SELECT first_name, Notes FROM employees;
```
![Screenshot 2025-04-10 at 11 02 22](https://github.com/user-attachments/assets/b7ae84cc-65ee-4915-80ad-0b5cf3f2d4a7)
<br />
<br />
```
-- Display detail of the customer(s) who has Maria Larsson as their contact name
SELECT * FROM customers WHERE contact_name = 'Maria Larsson';
```
![Screenshot 2025-04-10 at 11 03 06](https://github.com/user-attachments/assets/95580334-73cb-4460-a90b-824cd7a5d1cc)
<br />
<br />
```
-- Get the phone number of Federal Shipping and United Package
SELECT company_name, Phone FROM shippers WHERE company_name IN('Federal Shipping', 'United Package');
```
![Screenshot 2025-04-10 at 11 04 42](https://github.com/user-attachments/assets/b4124331-5b4c-460a-a9ab-a840e687f6c0)
<br />
<br />
```
-- Count the number of customers we have in each country
SELECT Country, COUNT(Country) AS `Number of Customers` FROM customers GROUP BY Country ORDER BY `Number of Customers` DESC;
```
![Screenshot 2025-04-10 at 11 06 24](https://github.com/user-attachments/assets/f2504e5d-1b7c-4ad6-89da-2d72d56419cc)
<br />
<br />
```
-- Calculate the total number of countries with customers
SELECT COUNT(DISTINCT Country) AS `Total Number of Countries` FROM customers;
```
![Screenshot 2025-04-10 at 11 07 50](https://github.com/user-attachments/assets/f3356868-5315-429c-8a1e-ce1043aaffa9)
<br />
<br />
```
-- Count the number of customers we have in London and Madrid City
SELECT City, COUNT(City) AS `Number of Customers` FROM customers WHERE City IN('London', 'Madrid') GROUP BY City;
```
![Screenshot 2025-04-10 at 11 08 35](https://github.com/user-attachments/assets/9babc495-5909-4021-a097-e02b6355ddaa)
<br />
<br />
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
<br />
<br />
```
-- Get the product name and product ID for product with unit price greater than 50
SELECT product_id, product_name, unit_price FROM products WHERE unit_price > 50 ORDER BY unit_price DESC;
```
![Screenshot 2025-04-10 at 11 30 56](https://github.com/user-attachments/assets/deaf459f-7fe3-48dd-93ab-891cd2254e0c)
<br />
<br />
```
-- Get the total number of discontinued order
SELECT SUM(discontinued) AS `Total Discontinued Orders` FROM products;
```
![Screenshot 2025-04-10 at 11 31 40](https://github.com/user-attachments/assets/e646569e-9941-43d0-9493-96c55af398ee)
<br />
<br />
```
-- Calculate the average unit_price of products in the Products table to 2dp
SELECT ROUND(AVG(unit_price), 2) AS `Average Unit Price` FROM products;
```
![Screenshot 2025-04-10 at 11 32 21](https://github.com/user-attachments/assets/6bd7b312-0501-4184-9aba-fa1338500f6d)
<br />
<br />
```
-- Display the category each product belongs to
SELECT products.category_id, products.product_name, categories.category_name
FROM products
INNER JOIN categories ON products.category_id = categories.category_id;
```
![Screenshot 2025-04-10 at 11 33 25](https://github.com/user-attachments/assets/993a3762-3521-4aa0-bad7-99b61666b6ac)
<br />
<br />
```
-- Find the total unit price for products whose categories are beverages
SELECT categories.category_name, SUM(products.unit_price) AS `Total Beverage Unit Price`
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE categories.category_name = 'Beverages';
```
![Screenshot 2025-04-10 at 11 34 28](https://github.com/user-attachments/assets/2ac9aab7-9f9b-4e55-8389-3ed55691820c)
<br />
<br />
```
-- Display the products that have between 40 to 100 worth unit price
SELECT products.product_name, products.unit_price FROM products WHERE unit_price BETWEEN 40 AND 100;
```
![Screenshot 2025-04-10 at 11 35 13](https://github.com/user-attachments/assets/9efcb503-6c78-4de1-9791-e173ff2c5895)
<br />
<br />
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
<br />
<br />
```
-- Retrieve the product_name and total_price from the order_details table, calculating the total_price as quantity multiplied by unit_price.
SELECT products.product_name, order_details.unit_price * order_details.quantity AS `Total Price`
FROM order_details
INNER JOIN products ON products.product_id = order_details.product_id;
```
![Screenshot 2025-04-10 at 11 47 30](https://github.com/user-attachments/assets/6bbc68cd-4bd5-427e-9874-ceef6e5cae49)
<br />
<br />
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
<br />
<br />
```
-- Retrieve the product name and total sales revenue for each product.
SELECT products.product_name, SUM(order_details.unit_price * order_details.quantity) AS `Total Sales Revenue`
FROM order_details
JOIN products ON order_details.product_id = products.product_id
GROUP BY products.product_name;
```
![Screenshot 2025-04-10 at 11 50 31](https://github.com/user-attachments/assets/4d26b27a-fce5-4053-8ca0-57c59e672965)

---

## 📊 Order Analysis

- Orders on specific dates
- Weekday vs weekend sales
- Time since orders were placed
- Sales with above-average quantities

```
-- Get data for all orders that were shipped on 1997-02-14
SELECT * FROM orders WHERE shipped_date = '1997-02-14';
```
![Screenshot 2025-04-10 at 14 29 00](https://github.com/user-attachments/assets/ae570754-c8a4-4fb5-8299-914ee69e317f)
<br />
<br />
```
-- Count order per day from the orders table
SELECT order_date, COUNT(order_date) AS `Order Count` FROM orders GROUP BY order_date ORDER BY `Order Count` DESC;
```
![Screenshot 2025-04-10 at 14 45 12](https://github.com/user-attachments/assets/47b3af78-e9ae-4395-b0ea-7ed33692e35c)
<br />
<br />
```
-- Display the order id and full date in letter format
SELECT order_id, DATE_FORMAT(order_date, '%a %D %M, %Y') AS `Date` FROM orders LIMIT 20;
```
![Screenshot 2025-04-10 at 18 29 23](https://github.com/user-attachments/assets/e80e4c29-a0ca-4f60-bb02-6c977c83fc4d)
<br />
<br />
```
-- Count the number of orders made in each month.
SELECT DATE_FORMAT(orders.order_date, '%Y-%m') AS month, COUNT(*) AS `Order Count`
FROM orders
GROUP BY month;
```
![Screenshot 2025-04-10 at 18 34 33](https://github.com/user-attachments/assets/97e355ec-23ef-4a8d-a03c-3bb42c514163)
<br />
<br />
```
-- Extract the month and year from the sale date and count the number of sales for each month.
SELECT DATE_FORMAT(orders.order_date, '%Y-%m') AS `Month`, COUNT(*) AS `Number of Sales per Month`
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY `Month`;
```
![Screenshot 2025-04-10 at 18 37 16](https://github.com/user-attachments/assets/90348591-69a3-4165-aa4b-9049e47ead72)
<br />
<br />
```
-- Calculate the number of days between the current date and the sale date for each sale.
SELECT order_details.order_id, DATEDIFF(NOW(), orders.order_date) AS `Day since sold`
FROM order_details
JOIN orders ON orders.order_id = order_details.order_id;
```
![Screenshot 2025-04-10 at 18 38 58](https://github.com/user-attachments/assets/5bf173c3-9f62-4625-a9d8-2cadcde5c521)
<br />
<br />
```
-- Identify sales made during weekdays versus weekends
SELECT order_details.order_id,
    CASE
        WHEN DAYOFWEEK(orders.order_date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS `Day type`
FROM order_details
JOIN orders ON order_details.order_id = orders.order_id;
```
![Screenshot 2025-04-10 at 18 42 56](https://github.com/user-attachments/assets/98921069-d1b0-46cc-b668-0bd65025f008)

---

## 📊 Order Analysis

- Orders on specific dates
- Weekday vs weekend sales
- Time since orders were placed
- Sales with above average quantities

```
-- Get data for all orders that were shipped on 1997-02-14
SELECT * FROM orders WHERE shipped_date = '1997-02-14';
```
![Screenshot 2025-04-10 at 21 38 10](https://github.com/user-attachments/assets/65bf14c3-9ff9-48e6-a9b2-4e36a46ea4f7)
<br />
<br />
```
-- Count order per day from the orders table
SELECT order_date, COUNT(order_date) AS `Order Count` FROM orders GROUP BY order_date ORDER BY `Order Count` DESC;
```
![Screenshot 2025-04-10 at 21 38 58](https://github.com/user-attachments/assets/8c88c874-4334-461d-a83c-2fba276b6563)

```
-- Display the order id and full date in letter format
SELECT order_id, DATE_FORMAT(order_date, '%a %D %M, %Y') AS `Date` FROM orders LIMIT 20;
```
![Screenshot 2025-04-10 at 21 39 55](https://github.com/user-attachments/assets/ad991f32-c456-4eb2-a1f7-2f47a7fc8b07)
<br />
<br />
```
-- Count the number of orders made in each month.
SELECT DATE_FORMAT(orders.order_date, '%Y-%m') AS month, COUNT(*) AS `Order Count`
FROM orders
GROUP BY month;
```
![Screenshot 2025-04-10 at 21 40 52](https://github.com/user-attachments/assets/893d4752-b1c6-497f-a857-efde547edcd8)
<br />
<br />
```
-- Extract the month and year from the sale date and count the number of sales for each month.
SELECT DATE_FORMAT(orders.order_date, '%Y-%m') AS `Month`, COUNT(*) AS `Number of Sales per Month`
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY `Month`;
```
![Screenshot 2025-04-10 at 21 41 54](https://github.com/user-attachments/assets/4eee6c23-bdee-4cd2-8eea-fab86e36c920)
<br />
<br />
```
-- Calculate the number of days between the current date and the sale date for each sale.
SELECT order_details.order_id, DATEDIFF(NOW(), orders.order_date) AS `Day since sold`
FROM order_details
JOIN orders ON orders.order_id = order_details.order_id;
```
![Screenshot 2025-04-10 at 21 42 46](https://github.com/user-attachments/assets/20b9d9b1-e7bf-417f-89cc-f7cbfa93ceaa)
<br />
<br />
```
-- Identify sales made during weekdays versus weekends
SELECT order_details.order_id,
    CASE
        WHEN DAYOFWEEK(orders.order_date) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS `Day type`
FROM order_details
JOIN orders ON order_details.order_id = orders.order_id;
```
![Screenshot 2025-04-10 at 21 44 02](https://github.com/user-attachments/assets/74542d52-335d-4115-995d-631f24855995)

---


## 🔍 Performance Metrics

- Top 3 products by revenue percentage
- Most frequently sold products
- Average quantity sold for high-value items

```
-- Calculate average shipping time per order in days
SELECT AVG(DATEDIFF(shipped_date, order_date)) AS `Avg Shipping Days`
FROM orders
WHERE shipped_date IS NOT NULL;
```
![Screenshot 2025-04-10 at 21 53 45](https://github.com/user-attachments/assets/a9fcda5e-8bfc-401c-9894-7600bfe56b00)
<br />
<br />
```
-- Calculate order fulfillment time per employee
SELECT employee_id, AVG(DATEDIFF(shipped_date, order_date)) AS `Avg Fulfillment Time`
FROM orders
WHERE shipped_date IS NOT NULL
GROUP BY employee_id;
```
![Screenshot 2025-04-10 at 21 54 57](https://github.com/user-attachments/assets/d2b7aeef-1e94-47a3-a9c2-4b69e2dee1e2)
<br />
<br />
```
-- Total orders per employee
SELECT employee_id, COUNT(order_id) AS `Total Orders`
FROM orders
GROUP BY employee_id
ORDER BY `Total Orders` DESC;
```
![Screenshot 2025-04-10 at 21 55 44](https://github.com/user-attachments/assets/ba6bf634-a689-418e-8bb9-013674699558)

---

📄 Conclusion

This analysis highlights how SQL can be used to derive meaningful insights from the Northwind database. From customer trends and order analysis to performance metrics and indexing strategies, these queries can be adapted and expanded for real world data applications.

##  License

See the <a href="https://github.com/DevAdedoyin/Northwind-SQL-Analysis/blob/master/LICENSE.MD">LICENSE.md</a> file for license rights and limitations (MIT).
