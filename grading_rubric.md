# Self-Grading Rubric


Use [this Google Form](https://docs.google.com/forms/d/e/1FAIpQLSdWZwDxBxA2GFlPBg9Yj5-KMBxT5qlNOfr6WfpVkoTnHVbfNw/viewform?usp=dialog) to self-grade your work on this assignment according to the rubric items below.

(Total Points Possible: 20)

---

## Snowflake Setup and Tutorial (Parts 1, 2, and 3)

### Snowflake Account Setup (1 Point)
**Criteria:**
- Successfully activated your Snowflake account, updated your password, and bookmarked the account page. (0.5 points)
- You provide evidence of successful login by including a screenshot of Snowflake's home screen. (0.5 points)

### The `introduction_to_snowflake.sql` Tutorial (1 Point)
**Criteria:**
- Completed (or skipped if you didn't need) the provided SQL tutorial file. (1 points)
 
---

## SQL Exercises in the `sql_exercises.sql` File

### Query 1 (1 point)
**Prompt:**
Retrieve all customers' `C_CUSTKEY`, `C_FIRSTNAME`, and `C_LASTNAME` values from the `CUSTOMER` table, sorted alphabetically by `C_FIRSTNAME` then by `C_LASTNAME`.

**Results Preview:**
|C_CUSTKEY|C_FIRSTNAME|C_LASTNAME|
|---|---|---|
|1|Aaron|Abbott|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 2 (1 point) 
**Prompt:**
Display all orders from the `ORDERS` table where the order date (`O_ORDERDATE`) is after `2018-01-01`, ordered by total price.

**Results Preview:**
|O_ORDERKEY|O_CUSTKEY|O_TOTALPRICE|O_ORDERDATE|O_ORDERPRIORITY|O_SHIPPRIORITY|
|---|---|---|---|---|---|
|2159139|3115|8.58|2018-04-23|5-LOW|0|


**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 3 (1 point)
**Prompt:**
List all parts (`P_PARTKEY`, `P_NAME`, `P_SIZE`, `P_RETAILPRICE`) from the `PART` table where the part name indicates it is a "boys" item, ordered by retail price.

**Results Preview:**
|P_PARTKEY|P_NAME|P_SIZE|P_RETAILPRICE|
|---|---|---|---|
|1|Boys - Large - Acid green - Baseball cap|7|9.01|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 4 (1 point)
**Prompt:**
Count the total number of orders placed by each customer, displaying the results as `C_CUSTKEY` and `Order_Count`, arranged by order count in descending order.

**Results Preview:**
|O_CUSTKEY|ORDER_COUNT|
|---|---|
|3451|41|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 5 (1 point)
**Prompt:**
Calculate the total price of all orders placed in each region, but only for orders with an order total greater than $1,000 placed during 2018. Display the results as `R_NAME` and `Total_Price`.

**Results Preview:**
|R_NAME|TOTAL_PRICE|
|---|---|
|AFRICA|35328995.99|


**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 6 (1 point)
**Prompt:**
Find the maximum quantity of items for each order that was shipped with "Urgent" priority. Display the results as `L_ORDERKEY` and `Max_Quantity`, arranged in order of Order Key.

**Results Preview:**
|L_ORDERKEY|MAX_QUANTITY|
|---|---|
|1|36|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 7 (1 point)
**Prompt:**
Determine the average account balance (`S_ACCTBAL`) for all suppliers in each nation. Display the results as `N_NAME` and `AVG_ACCTBAL`, arranged alphabetically.

**Results Preview:**
|N_NAME|AVG_ACCTBAL|
|---|---|
|PERU|4684.25235154|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 8 (1 point)
**Prompt:**
List the total number of parts supplied by each supplier. Display the results as `S_SUPPKEY`, `S_NAME`, and `Part_Count`, ordered by `S_NAME`.

**Results Preview:**
|S_SUPPKEY|S_NAME|PART_COUNT|
|---|---|---|
|1|Antique Alpaca Accouterments|80|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 9 (1 point)
**Prompt:**
List all customers who have placed orders for parts with `P_SIZE` greater than 20. Display only the first and last name of the customer, arranged by last name.

**Results Preview:**
|C_FIRSTNAME|C_LASTNAME|
|---|---|
|Walter|Abbott|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 10 (1 point)
**Prompt:**
Find all orders that include a "blue" part. Display the `O_ORDERKEY`, `O_ORDERDATE`, and `P_NAME` in the results, ordered by order date.

**Results Preview:**
|O_ORDERKEY|O_ORDERDATE|P_NAME|
|---|---|---|
|23010|2012-01-01|Mens - X-Large - Columbia Blue - Scarf|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 11 (1 point)
**Prompt:**
Display the order details (`O_ORDERKEY`, `P_NAME`, `S_NAME`, `L_QUANTITY`, `L_EXTENDEDPRICE`) for order number `1784611`.

**Results Preview:**
|L_ORDERKEY|P_NAME|S_NAME|L_QUANTITY|L_EXTENDEDPRICE|
|---|---|---|---|---|
|1784611|Mens - Small - Dark cornflower blue - Deluxe Sweater|Antique Sky Garb|44|846.52|


**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 12 (1 point)
**Prompt:**
Find all suppliers that have provided parts for orders placed in the AMERICA region. Display only the supplier names, ordered alphabetically.

**Results Preview:**
|S_NAME|
|---|
|Antique Alpaca Accouterments|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 13 (1 point)
**Prompt:**
Create a CTE to filter customers with an account balance (`C_ACCTBAL`) greater than 9,000. Use this CTE to retrieve the names of these customers along with their `C_CUSTKEY`, ordered by first name.

**Results Preview:**
|C_CUSTKEY|C_FIRSTNAME|C_LASTNAME|
|---|---|---|
|128311|Aaron|Ryusaki|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 14 (1 point)
**Prompt:**
Create a CTE that calculates the total quantity (`L_QUANTITY`) of items for each order in the `LINEITEM` table. Use this CTE to find orders where the total quantity exceeds 100. Order the results by order key.

**Results Preview:**
|L_ORDERKEY|TOTAL_QUANTITY|
|---|---|
|1|145|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 15 (1 point)
**Prompt:**
Using the CTEs created in Queries 13 and 14, calculate the average order value (`Avg_Order_Val`), average order quantity (`Avg_Order_Qty`), and the date of the first order placed (`Customer_Since`) for customers with account balances above 9,000, with results ordered by `Avg_Order_Val`.

**Results Preview:**
|C_CUSTKEY|C_FIRSTNAME|C_LASTNAME|AVG_ORDER_VAL|AVG_ORDER_QTY|CUSTOMER_SINCE|
|---|---|---|---|---|---|
|86177|Wayne|Ming|240.205|17.5|2012-12-11|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 16 (1 point)
**Prompt:**
Identify German customers who have placed more than 10 "small" orders (total price < $1,000). Use a series of CTEs to filter and calculate the results, ordered by last name.

**Results Preview:**
|C_CUSTKEY|C_FIRSTNAME|C_LASTNAME|SMALL_ORDER_COUNT|
|---|---|---|---|
|1798|Noah|Adams|13|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 17 (1 point)
**Prompt:**
Use a CTE to calculate the average account balance of suppliers (`S_ACCTBAL`) in each nation. Find suppliers with an account balance above their nation's average and display their info, along with a count of low-inventory parts (< 500 units).

**Results Preview:**
|S_SUPPKEY|S_NAME|S_ACCTBAL|N_NAME|LOW_INVENTORY_PARTS|
|---|---|---|---|---|
|9139|Chic Butterfly Frippery|4107.34|MOZAMBIQUE|5|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)

---

### Query 18 (1 point)
**Prompt:**
Evaluate whether there are systematic shipping delays for customers in the 5 different regions. Summarize by region the count of orders (`Order_Count`) and the average shipping time (`Avg_Shipping_Days`).

**Results Preview:**
|"R_NAME"|"ORDER_COUNT"|"AVG_SHIPPING_DAYS"|
|---|---|---|
|"MIDDLE EAST"|"296877"|91.|

**Criteria:**
- Your query runs successfully. (0.33 points)
- The output matches the requirements specified in the prompt. (0.33 points)
- You provide evidence of your solution pasting the first few rows of the results. (0.33 points)
