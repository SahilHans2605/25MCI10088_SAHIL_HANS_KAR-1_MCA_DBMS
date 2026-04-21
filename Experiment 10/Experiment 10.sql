-- =========================================
-- 📌 Experiment: Transactions in PostgreSQL
-- =========================================

-- Step 1: Create Table
CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0)
);

-- Step 2: Insert Initial Data
INSERT INTO Payroll VALUES
(1, 'Amit', 30000),
(2, 'Neha', 40000),
(3, 'Ravi', 50000);

-- Step 3: View Initial Data
SELECT * FROM Payroll;


-- =========================================
-- 🔁 Transaction Demonstration
-- =========================================

BEGIN;

-- Step 4: Update Salary (Valid Update)
UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

-- Step 5: Create Savepoint
SAVEPOINT sp1;

-- Step 6: Another Valid Update
UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;

-- Step 7: Error Simulation (Violates CHECK constraint)
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

-- Step 8: Rollback to Savepoint (Undo Step 6 & 7)
ROLLBACK TO sp1;

-- Step 9: Commit Remaining Valid Changes
COMMIT;


-- Step 10: Final Data Check
SELECT * FROM Payroll;

