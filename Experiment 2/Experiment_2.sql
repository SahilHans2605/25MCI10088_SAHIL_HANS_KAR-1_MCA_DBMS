/* =========================================================
   EXPERIMENT 2
   Filtering, Sorting, Grouping and Aggregation in SQL
   ========================================================= */

/* =========================================================
   STEP 1: TABLE CREATION
   Purpose: Create table to store customer order details
   ========================================================= */

CREATE TABLE CustomerOrders (
    OrderID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);

/* =========================================================
   STEP 1.1: INSERT SAMPLE RECORDS
   Purpose: Insert sufficient data for analysis
   ========================================================= */

INSERT INTO CustomerOrders 
(CustomerName, Product, Quantity, Price, OrderDate)
VALUES
('Aarav', 'Laptop', 1, 65000, '2025-01-10'),
('Neha', 'Mobile', 2, 40000, '2025-01-12'),
('Rohit', 'Laptop', 1, 70000, '2025-01-15'),
('Priya', 'Tablet', 3, 45000, '2025-01-18'),
('Karan', 'Mobile', 1, 20000, '2025-01-20'),
('Simran', 'Laptop', 2, 130000, '2025-01-22'),
('Aman', 'Tablet', 2, 30000, '2025-01-25'),
('Riya', 'Mobile', 3, 60000, '2025-01-26'),
('Vikas', 'Laptop', 1, 68000, '2025-01-28'),
('Pooja', 'Tablet', 1, 15000, '2025-01-30');

/* =========================================================
   STEP 2: FILTERING DATA USING CONDITIONS
   ========================================================= */

/* ---------------------------------------------------------
   Query without CASE statement
   Purpose: Display orders with price greater than 50000
   --------------------------------------------------------- */

SELECT *
FROM CustomerOrders
WHERE Price > 50000;

/* ---------------------------------------------------------
   Query using CASE statement
   Purpose: Perform filtering using conditional logic
   --------------------------------------------------------- */

SELECT *
FROM CustomerOrders
WHERE 
    CASE 
        WHEN Price > 50000 THEN 1
        ELSE 0
    END = 1;

/* =========================================================
   STEP 3: SORTING QUERY RESULTS
   ========================================================= */

/* ---------------------------------------------------------
   Sort orders by price in ascending order
   --------------------------------------------------------- */

SELECT *
FROM CustomerOrders
ORDER BY Price ASC;

/* ---------------------------------------------------------
   Sort orders by price in descending order
   --------------------------------------------------------- */

SELECT *
FROM CustomerOrders
ORDER BY Price DESC;

/* ---------------------------------------------------------
   Sort using multiple columns
   First by Product name, then by Price descending
   --------------------------------------------------------- */

SELECT *
FROM CustomerOrders
ORDER BY Product ASC, Price DESC;

/* =========================================================
   STEP 4: GROUPING DATA FOR AGGREGATION
   ========================================================= */

/* ---------------------------------------------------------
   Total sales for each product
   --------------------------------------------------------- */

SELECT 
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product;

/* ---------------------------------------------------------
   Average price of each product
   --------------------------------------------------------- */

SELECT 
    Product,
    AVG(Price) AS AveragePrice
FROM CustomerOrders
GROUP BY Product;

/* =========================================================
   STEP 5: APPLYING CONDITIONS ON AGGREGATED DATA
   ========================================================= */

/* ---------------------------------------------------------
   Column-Level / Group-Level Filtering
   Uses HAVING clause
   --------------------------------------------------------- */

SELECT 
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;

/* ---------------------------------------------------------
   Row-Level Filtering
   Uses WHERE clause before grouping
   --------------------------------------------------------- */

SELECT 
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
WHERE Price > 50000
GROUP BY Product;

/* =========================================================
   STEP 6: FILTERING VS AGGREGATION CONDITIONS
   ========================================================= */

/* ---------------------------------------------------------
   INCORRECT USAGE
   Aggregate functions cannot be used in WHERE clause
   --------------------------------------------------------- */

-- This query will produce an error
SELECT Product, SUM(Price)
FROM CustomerOrders
WHERE SUM(Price) > 100000
GROUP BY Product;

/* ---------------------------------------------------------
   CORRECT USAGE
   HAVING must be used for aggregate conditions
   --------------------------------------------------------- */

SELECT 
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;


