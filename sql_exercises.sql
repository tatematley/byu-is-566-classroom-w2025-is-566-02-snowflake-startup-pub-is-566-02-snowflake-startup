-- Hands On Lab: Snowflake Startup SQL Exercises
--
-- Note: If you haven't yet followed the instructions found in the assignment's README.md 
-- file, you should start there.  
-- 
-- Before we being, use the commands below to set your context to ensure that your 
-- queries are hitting the right database (and to ensure that you can simply call the 
-- tables by name and avoid lots of extra typing).

USE DATABASE IS566;
USE SCHEMA SQL_PRACTICE;

-----------||     Part 1: Basic SQL Queries      ||-------------------------------------

-- 1. 
-- Retrieve all customers' C_CUSTKEY, C_FIRSTNAME, and C_LASTNAME values from the 
-- CUSTOMER table, sorted alphabetically by C_FIRSTNAME then by C_LASTNAME.


-- 2. 
-- Display all orders from the ORDERS table where the order date (O_ORDERDATE) is 
-- after '2018-01-01', ordered by total price.


-- 3. 
-- List all parts (P_PARTKEY, P_NAME, P_SIZE, and P_RETAILPRICE) from the PART table 
-- where the part name indicates that it is a "boys" item, ordered by retail price.


-----------||     Part 2: Aggregation, Grouping, Joins      ||--------------------------

-- 4. 
-- Count the total number of orders placed by each customer, displaying the results 
-- as C_CUSTKEY and Order_Count, arranged by order count in descending order.


-- 5.
-- Calculate the total price of all orders placed in each region (name), but only for 
-- orders with an order total greater than $1,000 placed during 2018. Display the results 
-- as R_NAME and Total_Price


-- 6.
-- Find the maximum quantity of items each order that was shipped with "Urgent" priority.
-- Display the results as L_ORDERKEY, and Max_Quantity, arranged in order of Order Key.


-- 7.
-- Determine the average account balance (S_ACCTBAL) for all suppliers in each nation. 
-- Display results as N_NAME and AVG_ACCTBAL, arranged alphabetically.


-- 8.
-- List the total number of parts supplied by each supplier. Display the results as
-- S_SUPPKEY, S_NAME, and Part_Count, ordered by S_NAME.


-- 9. 
-- List all customers who have placed orders for parts with P_SIZE greater than 20.
-- Display only the first and last name of the customer, arranged by last name.


-- 10. 
-- Find all orders that include a "blue" part. Display the order key, order date, and
-- part name in the results, ordered by order date.


-- 11.
-- Display the order details (order key, part name, supplier name, quantity, and 
-- extended price) for order number 1784611.


-- 12. 
-- Find all suppliers that have provided parts for orders placed in the AMERICA region. 
-- Display only the supplier names, ordered alphabetically.


-----------||     Part 3: Fun with CTEs                     ||--------------------------

-- Note: If you haven't yet watched the two CTE tutorial videos linked in the assignment 
-- README file, I would go watch those first. Then come back here and complete the rest
-- of the exercises.

-- 13. 
-- Create a CTE to filter customers with an account balance (C_ACCTBAL) greater than 
-- 9,000. Use this CTE to retrieve the names of these customers along with their 
-- C_CUSTKEY, ordered by first name.


-- 14. 
-- Create a CTE that calculates the total quantity (L_QUANTITY) of items for each order 
-- in the LINEITEM table. Use this CTE to find orders where the total quantity exceeds 100. 
-- Order the results by order key.


-- 15. 
-- Using the CTEs you created for the previous two problems as a starting point, now calculate
-- the average order value (Avg_Order_Val, or the average of O_TOTALPRICE), average order 
-- quantity (Avg_Order_Qty, or the average of the Total_Quantity column you calculated above), 
-- and the date of the first order placed (Customer_Since, or the earliest O_ORDERDATE value) 
-- for each of the customers with high account balances (above 9,000) you calculated above. 
-- Display only the customer key, first and last name, and the Avg_Order_Val, Avg_Order_Qty, 
-- and Customer_Since columns in the result, with results ordered by `Avg_Order_Val`.


-- 16. 
-- Write a CTE-based query that identifies customers from Germany who place a large 
-- number of small orders. Assume that a small order is defines as any order with a 
-- total price less than $1,000, and that the company wants to find German customers 
-- who have placed more than 10 such orders over the span of time represented in the 
-- dataset. Start with a CTE that finds a count of orders (grouped by customer key)
-- where the total price is less than $1,000. Then write a CTE that assembles the 
-- customer data, including the N_NAME field so you can later filter to German 
-- customers. Finally, join those two CTEs and apply appropriate filters to provide 
-- the requested results, which should display the following columns: C_CUSTKEY, 
-- C_FIRSTNAME, C_LASTNAME, and Small_Order_Count, ordered by last name.


-- 17. 
-- Use a CTE to calculate the average account balance (S_ACCTBAL) of suppliers from 
-- each nation. Use another CTE to find suppliers with an account balance above their nation's
-- national average. Display these suppliers' info (S_SUPPKEY, S_NAME, S_ACCTBAL), the nation 
-- where each supplier is located (N_NAME), along with a column (LOW_INVENTORY_PARTS) 
-- representing a count of the parts for which that supplier's available quantity is less 
-- than 500 units. 


-- 18.
-- Write a query to evaluate whether there are systematic shipping delays for customers in 
-- the 5 different regions. Assume that the company calculates "days to ship" for each item as 
-- the difference between the ship date and the order date for each line item. Assume further 
-- that the company treats an order's overall shipping time as the longest "days to ship" value
-- among all of the items on an order. (In other words, the order isn't considered to be shipped
-- until the last item on the order is shipped.) Write a series of CTEs to assemble the 
-- information needed to display a summarized table that shows each region name, the count of 
-- orders to customers in that region (Order_Count), and the average overall shipping time for 
-- orders to customers in that region (Avg_Shipping_Days).

