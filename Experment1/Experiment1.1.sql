/* =========================================================
   WORKSHEET 1.1
   DDL, DML AND DCL COMMANDS
   ========================================================= */

/* =========================================================
   AIM:
   To design and implement a sample database system using
   DDL, DML and DCL commands including role-based security.
   ========================================================= */


/* =========================================================
   STEP 1: TABLE CREATION (DDL COMMANDS)
   Purpose: Create tables with constraints
   ========================================================= */

/* -------------------- DEPARTMENTS TABLE ------------------ */

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

/* -------------------- EMPLOYEES TABLE -------------------- */

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT NOT NULL
        REFERENCES Departments(dept_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    role VARCHAR(50) NOT NULL
);

/* -------------------- PROJECTS TABLE --------------------- */

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    proj_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    dept_id INT NOT NULL
        REFERENCES Departments(dept_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

/* =========================================================
   STEP 2: DATA MANIPULATION (DML COMMANDS)
   ========================================================= */

/* -------------------- INSERT INTO DEPARTMENTS ------------ */

INSERT INTO Departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Delhi');

/* -------------------- INSERT INTO EMPLOYEES -------------- */

INSERT INTO Employees (emp_id, fullname, salary, dept_id, role) VALUES
(101, 'Amit Sharma', 50000, 1, 'HR Executive'),
(102, 'Neha Verma', 70000, 2, 'Software Engineer'),
(103, 'Rohit Mehta', 90000, 2, 'Project Manager'),
(104, 'Priya Singh', 60000, 3, 'Accountant');

/* -------------------- INSERT INTO PROJECTS --------------- */

INSERT INTO Projects (project_id, proj_name, start_date, end_date, dept_id) VALUES
(201, 'Payroll System', '2025-01-10', '2025-06-30', 1),
(202, 'E-Commerce App', '2025-02-01', '2025-12-31', 2),
(203, 'Budget Analysis', '2025-03-15', NULL, 3);

/* =========================================================
   STEP 3: UPDATE OPERATIONS
   Purpose: Modify existing records
   ========================================================= */

/* Change employee department */

UPDATE Employees
SET dept_id = 3
WHERE emp_id = 101;

/* Extend project deadline */

UPDATE Projects
SET end_date = '2026-03-31'
WHERE project_id = 202;

/* =========================================================
   STEP 4: DELETE OPERATIONS
   Purpose: Remove records while maintaining integrity
   ========================================================= */

/* Delete employees of IT department */

DELETE FROM Employees
WHERE dept_id = 2;

/* Delete projects of IT department */

DELETE FROM Projects
WHERE dept_id = 2;

/* Delete department record */

DELETE FROM Departments
WHERE dept_id = 2;

/* =========================================================
   STEP 5: ACCESS CONTROL AND SECURITY (DCL COMMANDS)
   ========================================================= */

/* Create reporting user */

CREATE ROLE reporting_user
LOGIN
PASSWORD 'report123';

/* Grant read-only access */

GRANT SELECT ON Departments TO reporting_user;
GRANT SELECT ON Employees TO reporting_user;
GRANT SELECT ON Projects TO reporting_user;

/* Prevent object creation */

REVOKE CREATE ON SCHEMA public FROM reporting_user;

/* Revoke data modification privileges */

REVOKE INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
FROM reporting_user;

/* =========================================================
   STEP 6: SCHEMA MODIFICATION
   ========================================================= */

/* Add new column to Employees table */

ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);

/* Drop table no longer required */

DROP TABLE Projects;

/* =========================================================
   END OF WORKSHEET 1.1
   ========================================================= */
