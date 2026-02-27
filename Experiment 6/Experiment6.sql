CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Department (dept_name) VALUES
('HR'),
('IT'),
('Finance'),
('Sales');

select * from Department
select * from Employee
/* -----------------------------------------------------------
   Modify Employee Table
   Add dept_id and status columns
   ----------------------------------------------------------- */

ALTER TABLE Employee
ADD COLUMN dept_id INT,
ADD COLUMN status VARCHAR(20);

/* -----------------------------------------------------------
   Add Foreign Key Relationship
   ----------------------------------------------------------- */

-- ALTER TABLE Employee
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (dept_id)
-- REFERENCES Department(dept_id);

-- UPDATE Employee
-- SET dept_id = 1, status = 'Active'
-- WHERE emp_id = 1;

-- UPDATE Employee
-- SET dept_id = 2, status = 'Active'
-- WHERE emp_id = 2;

-- UPDATE Employee
-- SET dept_id = 2, status = 'Inactive'
-- WHERE emp_id = 3;

-- UPDATE Employee
-- SET dept_id = 3, status = 'Active'
-- WHERE emp_id = 4;

-- UPDATE Employee
-- SET dept_id = 4, status = 'Inactive'
-- WHERE emp_id = 5;

/* -----------------------------------------------------------
   View 1: Filter Active Employees
   ----------------------------------------------------------- */

CREATE VIEW Active_Employees AS
SELECT emp_id, emp_name, salary, dept_id
FROM Employee
WHERE status = 'Active';

select * from Active_Employees


/* -----------------------------------------------------------
   View 2: Employee with Department Details
   ----------------------------------------------------------- */

CREATE VIEW Employee_Department_View AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    e.status
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id;


select * from Employee_Department_View


/* -----------------------------------------------------------
   View 3: Department-Level Summary
   ----------------------------------------------------------- */

CREATE VIEW Department_Summary AS
SELECT 
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

select * from Department_Summary