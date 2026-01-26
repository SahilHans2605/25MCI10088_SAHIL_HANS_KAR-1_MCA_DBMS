
/* =========================================================
   WORKSHEET 1.2
   CASE STATEMENT AND AGGREGATE FUNCTIONS
   ========================================================= */

/* =========================================================
   AIM:
   To design and implement SQL queries using CASE statements
   and aggregate functions on the Students table.
   ========================================================= */


/* =========================================================
   STEP 1: TABLE CREATION
   Purpose: Create Students table to store academic details
   ========================================================= */

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    City VARCHAR(50),
    Percentage DECIMAL(5,2)
);

/* =========================================================
   STEP 2: INSERT SAMPLE DATA
   Purpose: Insert student records for analysis
   ========================================================= */

INSERT INTO Students (StudentID, StudentName, City, Percentage) VALUES
(1, 'Aarav',   'Delhi',      96.5),
(2, 'Neha',    'Mumbai',     89.2),
(3, 'Rohit',   'Delhi',      91.0),
(4, 'Priya',   'Chandigarh', 97.3),
(5, 'Karan',   'Mumbai',     95.8),
(6, 'Simran',  'Chandigarh', 88.4),
(7, 'Aman',    'Delhi',      99.1),
(8, 'Riya',    'Mumbai',     92.6),
(9, 'Sahil',   'Chandigarh', 85.9),
(10,'Ananya',  'Delhi',      94.7),
(11,'Vikas',   'Mumbai',     97.9),
(12,'Pooja',   'Chandigarh', 90.5);

/* =========================================================
   DISPLAY ALL STUDENT RECORDS
   ========================================================= */

SELECT * FROM Students;

/* =========================================================
   QUESTION (i)
   Count of students with percentage greater than 95
   ========================================================= */

/* ---------------------------------------------------------
   Using CASE statement
   --------------------------------------------------------- */

SELECT 
    COUNT(
        CASE 
            WHEN Percentage > 95 THEN 1 
        END
    ) AS CountAbove95
FROM Students;

/* ---------------------------------------------------------
   Without using CASE statement
   --------------------------------------------------------- */

SELECT 
    COUNT(*) AS CountAbove95
FROM Students
WHERE Percentage > 95;

/* =========================================================
   QUESTION (ii)
   Find average percentage of students in each city
   whose percentage is greater than 95
   ========================================================= */

/* ---------------------------------------------------------
   Using CASE statement
   Group city-wise and sort in descending order
   --------------------------------------------------------- */

SELECT 
    City,
    AVG(
        CASE 
            WHEN Percentage > 95 THEN Percentage
        END
    ) AS AvgPercentage
FROM Students
GROUP BY City
ORDER BY AvgPercentage DESC;

/* =========================================================
   END OF WORKSHEET 1.2
   ========================================================= */
