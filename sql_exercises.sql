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
SELECT C_CUSTKEY, C_FIRSTNAME, C_LASTNAME 
FROM CUSTOMER
ORDER BY C_FIRSTNAME, C_LASTNAME;

-- 2. 
-- Display all orders from the ORDERS table where the order date (O_ORDERDATE) is 
-- after '2018-01-01', ordered by total price.

SELECT * 
FROM ORDERS
WHERE O_ORDERDATE > '2018-01-01'
ORDER BY O_TOTALPRICE; 


-- 3. 
-- List all parts (P_PARTKEY, P_NAME, P_SIZE, and P_RETAILPRICE) from the PART table 
-- where the part name indicates that it is a "boys" item, ordered by retail price.

SELECT *
FROM PART
WHERE P_NAME LIKE 'Boys%'
ORDER BY P_RETAILPRICE;

-----------||     Part 2: Aggregation, Grouping, Joins      ||--------------------------

-- 4. 
-- Count the total number of orders placed by each customer, displaying the results 
-- as C_CUSTKEY and Order_Count, arranged by order count in descending order.

SELECT O_CUSTKEY AS C_CUSTKEY,
       COUNT(O_ORDERKEY) AS Order_Count
FROM ORDERS
GROUP BY O_CUSTKEY
ORDER BY Order_Count DESC;


-- 5.
-- Calculate the total price of all orders placed in each region (name), but only for 
-- orders with an order total greater than $1,000 placed during 2018. Display the results 
-- as R_NAME and Total_Price

SELECT R.R_NAME AS R_NAME, SUM(O.O_TOTALPRICE) AS Total_Price
FROM REGION R
JOIN NATION N ON N.N_REGIONKEY = R.R_REGIONKEY 
JOIN CUSTOMER C ON C.C_NATIONKEY = N.N_NATIONKEY
JOIN ORDERS O ON O.O_CUSTKEY = C.C_CUSTKEY
WHERE O.O_TOTALPRICE > 1000 
    AND O.O_ORDERDATE >= '2018-01-01'
    AND O.O_ORDERDATE <  '2019-01-01'
GROUP BY R.R_NAME;


-- 6.
-- Find the maximum quantity of items each order that was shipped with "Urgent" priority.
-- Display the results as L_ORDERKEY, and Max_Quantity, arranged in order of Order Key.

SELECT L.L_ORDERKEY AS L_ORDERKEY, MAX(L.L_QUANTITY) AS Max_Quantity
FROM ORDERS O
JOIN LINEITEM L ON O.O_ORDERKEY = L.L_ORDERKEY
WHERE O.O_ORDERPRIORITY = '1-URGENT' 
GROUP BY L.L_ORDERKEY
ORDER BY L.L_ORDERKEY; 


-- 7.
-- Determine the average account balance (S_ACCTBAL) for all suppliers in each nation. 
-- Display results as N_NAME and AVG_ACCTBAL, arranged alphabetically.

SELECT N.N_NAME, AVG(S.S_ACCTBAL) AS AVG_ACCTBAL 
FROM SUPPLIER S
JOIN NATION N ON N.N_NATIONKEY = S.S_NATIONKEY
GROUP BY N.N_NAME 
ORDER BY N.N_NAME;


-- 8.
-- List the total number of parts supplied by each supplier. Display the results as
-- S_SUPPKEY, S_NAME, and Part_Count, ordered by S_NAME.

SELECT S.S_SUPPKEY, S.S_NAME, COUNT(PS.PS_PARTKEY) AS Part_Count
FROM PARTSUPP PS
JOIN SUPPLIER S ON S.S_SUPPKEY = PS.PS_SUPPKEY
GROUP BY S.S_SUPPKEY, S.S_NAME
ORDER BY S_NAME;

-- 9. 
-- List all customers who have placed orders for parts with P_SIZE greater than 20.
-- Display only the first and last name of the customer, arranged by last name.

SELECT C.C_FIRSTNAME, C.C_LASTNAME
FROM CUSTOMER C
JOIN ORDERS O ON O.O_CUSTKEY = C.C_CUSTKEY
JOIN LINEITEM L ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN PART P ON P.P_PARTKEY = L.L_PARTKEY
WHERE P_SIZE > 20
GROUP BY C.C_LASTNAME, C.C_FIRSTNAME
ORDER BY C.C_LASTNAME;

-- 10. 
-- Find all orders that include a "blue" part. Display the order key, order date, and
-- part name in the results, ordered by order date.

SELECT O.O_ORDERKEY, O.O_ORDERDATE, P.P_NAME
FROM ORDERS O
JOIN LINEITEM L ON L.L_ORDERKEY = O.O_ORDERKEY
JOIN PART P ON P.P_PARTKEY = L.L_PARTKEY
WHERE LOWER(P.P_NAME) LIKE '%blue%'
ORDER BY O.O_ORDERDATE;

-- 11.
-- Display the order details (order key, part name, supplier name, quantity, and 
-- extended price) for order number 1784611.

SELECT L.L_ORDERKEY, P.P_NAME, S.S_NAME, L.L_QUANTITY, L.L_EXTENDEDPRICE
FROM LINEITEM L 
JOIN PART P ON P.P_PARTKEY = L.L_PARTKEY
JOIN SUPPLIER S ON S.S_SUPPKEY = L.L_SUPPKEY
WHERE L.L_ORDERKEY = 1784611;

-- 12. 
-- Find all suppliers that have provided parts for orders placed in the AMERICA region. 
-- Display only the supplier names, ordered alphabetically.

SELECT DISTINCT S.S_NAME 
FROM SUPPLIER S
JOIN NATION N ON N.N_NATIONKEY = S.S_NATIONKEY 
JOIN REGION R ON R.R_REGIONKEY = N.N_REGIONKEY
WHERE R.R_NAME = 'AMERICA'
ORDER BY S.S_NAME; 


-----------||     Part 3: Fun with CTEs                     ||--------------------------

-- Note: If you haven't yet watched the two CTE tutorial videos linked in the assignment 
-- README file, I would go watch those first. Then come back here and complete the rest
-- of the exercises.

-- 13. 
-- Create a CTE to filter customers with an account balance (C_ACCTBAL) greater than 
-- 9,000. Use this CTE to retrieve the names of these customers along with their 
-- C_CUSTKEY, ordered by first name.

WITH HIGHBALANCECUSTOMERS AS (
    SELECT C_FIRSTNAME, C_LASTNAME, C_CUSTKEY
    FROM CUSTOMER 
    WHERE C_ACCTBAL > 9000
) 
SELECT C_FIRSTNAME, C_LASTNAME, C_CUSTKEY
FROM HIGHBALANCECUSTOMERS
ORDER BY C_FIRSTNAME;


-- 14. 
-- Create a CTE that calculates the total quantity (L_QUANTITY) of items for each order 
-- in the LINEITEM table. Use this CTE to find orders where the total quantity exceeds 100. 
-- Order the results by order key.

WITH TOTALQUANT AS (
    SELECT L_ORDERKEY, SUM(L_QUANTITY) AS TOTAL_QUANT
    FROM LINEITEM 
    GROUP BY L_ORDERKEY
)
SELECT L_ORDERKEY, TOTAL_QUANT 
FROM TOTALQUANT 
WHERE TOTAL_QUANT > 100 
ORDER BY L_ORDERKEY;


-- 15. 
-- Using the CTEs you created for the previous two problems as a starting point, now calculate
-- the average order value (Avg_Order_Val, or the average of O_TOTALPRICE), average order 
-- quantity (Avg_Order_Qty, or the average of the Total_Quantity column you calculated above), 
-- and the date of the first order placed (Customer_Since, or the earliest O_ORDERDATE value) 
-- for each of the customers with high account balances (above 9,000) you calculated above. 
-- Display only the customer key, first and last name, and the Avg_Order_Val, Avg_Order_Qty, 
-- and Customer_Since columns in the result, with results ordered by `Avg_Order_Val`.

WITH HighBalanceCustomers AS (
  SELECT C_CUSTKEY, C_FIRSTNAME, C_LASTNAME
  FROM CUSTOMER
  WHERE C_ACCTBAL > 9000
),
OrderQty AS (
  SELECT L_ORDERKEY, SUM(L_QUANTITY) AS Total_Quantity
  FROM LINEITEM
  GROUP BY L_ORDERKEY
)
SELECT
  h.C_CUSTKEY,
  h.C_FIRSTNAME,
  h.C_LASTNAME,
  AVG(o.O_TOTALPRICE) AS Avg_Order_Val,
  AVG(q.Total_Quantity) AS Avg_Order_Qty,
  MIN(o.O_ORDERDATE) AS Customer_Since
FROM HighBalanceCustomers h
JOIN ORDERS o
  ON o.O_CUSTKEY = h.C_CUSTKEY
JOIN OrderQty q
  ON q.L_ORDERKEY = o.O_ORDERKEY
GROUP BY
  h.C_CUSTKEY, h.C_FIRSTNAME, h.C_LASTNAME
ORDER BY Avg_Order_Val;


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

WITH SMALLORDERCOUNT AS (
    SELECT O.O_CUSTKEY as C_CUSTKEY, COUNT(O.O_ORDERKEY) AS Small_Order_Count
    FROM ORDERS O
    WHERE O.O_TOTALPRICE < 1000
    GROUP BY O.O_CUSTKEY
    HAVING COUNT(O.O_ORDERKEY) > 10
),
CUSTOMERDATA AS (
    SELECT C.C_CUSTKEY, C.C_FIRSTNAME, C.C_LASTNAME, N.N_NAME
    FROM CUSTOMER C
    JOIN NATION N ON N.N_NATIONKEY = C.C_NATIONKEY
)
SELECT
  CD.C_CUSTKEY,
  CD.C_FIRSTNAME,
  CD.C_LASTNAME,
  SOC.Small_Order_Count
FROM CustomerData CD
JOIN SmallOrderCount SOC
  ON SOC.C_CUSTKEY = CD.C_CUSTKEY
WHERE CD.N_NAME = 'GERMANY'
ORDER BY CD.C_LASTNAME;


-- 17. 
-- Use a CTE to calculate the average account balance (S_ACCTBAL) of suppliers from 
-- each nation. Use another CTE to find suppliers with an account balance above their nation's
-- national average. Display these suppliers' info (S_SUPPKEY, S_NAME, S_ACCTBAL), the nation 
-- where each supplier is located (N_NAME), along with a column (LOW_INVENTORY_PARTS) 
-- representing a count of the parts for which that supplier's available quantity is less 
-- than 500 units. 

WITH NationAvg AS (
  SELECT
    S.S_NATIONKEY,
    AVG(S.S_ACCTBAL) AS Nation_Avg_Acctbal
  FROM SUPPLIER S
  GROUP BY S.S_NATIONKEY
),
AboveNationAvg AS (
  SELECT
    S.S_SUPPKEY,
    S.S_NAME,
    S.S_ACCTBAL,
    S.S_NATIONKEY
  FROM SUPPLIER S
  JOIN NationAvg NA
    ON NA.S_NATIONKEY = S.S_NATIONKEY
  WHERE S.S_ACCTBAL > NA.Nation_Avg_Acctbal
)
SELECT
  A.S_SUPPKEY,
  A.S_NAME,
  A.S_ACCTBAL,
  N.N_NAME,
  SUM(CASE WHEN PS.PS_AVAILQTY < 500 THEN 1 ELSE 0 END) AS LOW_INVENTORY_PARTS
FROM AboveNationAvg A
JOIN NATION N
  ON N.N_NATIONKEY = A.S_NATIONKEY
LEFT JOIN PARTSUPP PS
  ON PS.PS_SUPPKEY = A.S_SUPPKEY
GROUP BY
  A.S_SUPPKEY, A.S_NAME, A.S_ACCTBAL, N.N_NAME;


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

WITH OrderShipDays AS (
  SELECT
    L.L_ORDERKEY,
    MAX(DATEDIFF('day', O.O_ORDERDATE, L.L_SHIPDATE)) AS Shipping_Days
  FROM LINEITEM L
  JOIN ORDERS O
    ON O.O_ORDERKEY = L.L_ORDERKEY
  GROUP BY L.L_ORDERKEY
),
OrderRegions AS (
  SELECT
    O.O_ORDERKEY,
    R.R_NAME
  FROM ORDERS O
  JOIN CUSTOMER C
    ON C.C_CUSTKEY = O.O_CUSTKEY
  JOIN NATION N
    ON N.N_NATIONKEY = C.C_NATIONKEY
  JOIN REGION R
    ON R.R_REGIONKEY = N.N_REGIONKEY
)
SELECT
  ORG.R_NAME,
  COUNT(*) AS Order_Count,
  AVG(OSD.Shipping_Days) AS Avg_Shipping_Days
FROM OrderRegions ORG
JOIN OrderShipDays OSD
  ON OSD.L_ORDERKEY = ORG.O_ORDERKEY
GROUP BY ORG.R_NAME;
