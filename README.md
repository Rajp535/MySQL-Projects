# 🍽️ Restaurant Management System - SQL Project

This SQL project simulates a mini Restaurant Management System. It manages restaurants, menus, and orders with simple yet powerful relational queries and operations.

## 🗂️ Datasets/Tables Created

1. **restaurants5**
   - 📌 Features:
     - `restaurant_id` – Unique ID for each restaurant.
     - `restaurant_name` – Name of the restaurant.
     - `cuisine_type` – Type of cuisine offered (e.g., Italian, Mexican).
     - `address` – Restaurant location.
     - `phone` – Contact number.

2. **menutable5**
   - 📌 Features:
     - `item_id` – Unique ID for each menu item.
     - `restaurant_id` – Associated restaurant (foreign key).
     - `item_name` – Name of the menu item.
     - `description` – Brief description of the item.
     - `price` – Price of the item.

3. **orders5**
   - 📌 Features:
     - `order_id` – Unique ID for each order.
     - `item_id` – Menu item ordered (foreign key).
     - `customer_name` – Name of the customer.
     - `delivery_address` – Address for delivery.
     - `order_date` – Date of order placed.
     - `total_amt` – Total amount paid.

## 🔎 Key SQL Operations Performed

- **Filtering**: Retrieve restaurants offering specific cuisines (e.g., Italian).
- **Joins**: 
  - List menu items with corresponding restaurant details.
  - Fetch orders linked with menu items.
- **Aggregation**:
  - Calculate total revenue generated in a month.
  - Find top-selling menu items based on number of orders.
  - Count total orders per customer.
- **Updating Records**:
  - Update descriptions of specific menu items.
- **Cross Join**:
  - Explore cartesian products between menu and orders tables.

## 📊 Sample Queries Included

- Retrieve all Italian restaurants.
- Calculate monthly revenue.
- Identify top-selling menu items.
- Update menu item details.
- Fetch order histories by delivery addresses.
- Total number of orders per customer.

## 🧰 Tools Used

- MySQL 8.0
- SQL Workbench
- DDL (Data Definition Language)
- DML (Data Manipulation Language)

---

