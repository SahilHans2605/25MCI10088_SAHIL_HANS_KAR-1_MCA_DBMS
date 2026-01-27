
/* ============================================================
   WORKSHEET 3
   Conditional Logic Using CASE and IF–ELSE in PostgreSQL
   ============================================================



/* ============================================================
   STEP 1: TABLE CREATION
   Purpose:
   - Store schema/entity details
   - Track violation count for each entity
   ============================================================ */

CREATE TABLE Violations (
    id INT PRIMARY KEY,              -- Unique identifier
    entity_name VARCHAR(100),        -- Schema or entity name
    violation_count INT              -- Number of violations/issues
);


/* ============================================================
   STEP 1.1: INSERT SAMPLE DATA
   Purpose:
   - Populate table with multiple records
   - Use different violation counts for testing logic
   ============================================================ */

INSERT INTO Violations (id, entity_name, violation_count) VALUES
(1, 'Finance_Department', 12),
(2, 'HR_Department', 5),
(3, 'IT_Department', 20),
(4, 'Sales_Department', 0),
(5, 'Admin_Department', 0),
(6, 'Security_Team', 15);


/* ============================================================
   DISPLAY ALL RECORDS
   ============================================================ */

SELECT * FROM Violations;


/* ============================================================
   STEP 2: DATA CLASSIFICATION USING CASE EXPRESSION
   Purpose:
   - Classify entities based on violation severity
   ============================================================ */

SELECT 
    entity_name,
    violation_count,
    CASE
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        ELSE 'Critical Violation'
    END AS Violation_Status
FROM Violations;


/* ============================================================
   STEP 3: APPLYING CASE LOGIC IN DATA UPDATES
   Purpose:
   - Store approval status based on violation count
   ============================================================ */


/* Add new column for approval status */

ALTER TABLE Violations
ADD COLUMN approval_status VARCHAR(30);


/* Update approval status using conditional logic */

UPDATE Violations
SET approval_status =
    CASE
        WHEN violation_count = 0 THEN 'Approved'
        WHEN violation_count BETWEEN 1 AND 15 THEN 'Needs Review'
        ELSE 'Rejected'
    END;


/* ============================================================
   STEP 4: IMPLEMENTING IF–ELSE USING PL/pgSQL
   Purpose:
   - Demonstrate procedural decision making
   - No SELECT statement used
   ============================================================ */

DO $$
DECLARE
    v_violation_count INT := 12;   -- Change value to test output
BEGIN

    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Status: Approved — No violations found';

    ELSIF v_violation_count BETWEEN 1 AND 5 THEN
        RAISE NOTICE 'Status: Needs Review — Minor violations detected';

    ELSIF v_violation_count BETWEEN 6 AND 15 THEN
        RAISE NOTICE 'Status: Needs Review — Moderate violations detected';

    ELSE
        RAISE NOTICE 'Status: Rejected — Critical violations detected';

    END IF;

END $$;


/* ============================================================
   STEP 5: REAL-WORLD CLASSIFICATION SCENARIO
   GRADING SYSTEM
   ============================================================ */


/* Create table to store student marks */

CREATE TABLE StudentGrades (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);


/* Insert sample student records */

INSERT INTO StudentGrades (student_name, marks) VALUES
('Aarav', 95),
('Neha', 82),
('Rohit', 68),
('Priya', 91),
('Karan', 56),
('Simran', 45),
('Aman', 77),
('Riya', 88),
('Vikas', 35);


/* ============================================================
   STEP 5.2: GRADE CLASSIFICATION USING CASE
   ============================================================ */

SELECT 
    student_name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A+ Grade'
        WHEN marks BETWEEN 80 AND 89 THEN 'A Grade'
        WHEN marks BETWEEN 70 AND 79 THEN 'B Grade'
        WHEN marks BETWEEN 60 AND 69 THEN 'C Grade'
        WHEN marks BETWEEN 40 AND 59 THEN 'D Grade'
        ELSE 'Fail'
    END AS Grade
FROM StudentGrades;


/* ============================================================
   STEP 6: CASE-BASED CUSTOM SORTING
   Purpose:
   - Apply priority-based ordering
   - Critical violations appear first
   ============================================================ */

SELECT 
    entity_name,
    violation_count,
    CASE
        WHEN violation_count > 15 THEN 'Critical Violation'
        WHEN violation_count BETWEEN 6 AND 15 THEN 'Moderate Violation'
        WHEN violation_count BETWEEN 1 AND 5 THEN 'Minor Violation'
        ELSE 'No Violation'
    END AS Violation_Severity
FROM Violations
ORDER BY
    CASE
        WHEN violation_count > 15 THEN 1   -- Highest priority
        WHEN violation_count BETWEEN 6 AND 15 THEN 2
        WHEN violation_count BETWEEN 1 AND 5 THEN 3
        ELSE 4                              -- Lowest priority
    END;

select * from Violations
/* ============================================================
   END OF WORKSHEET 3
   ============================================================ */
