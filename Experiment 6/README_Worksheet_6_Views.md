
# WORKSHEET 6 – SQL Views Implementation

## Student Information
- Name: Sahil Hans  
- UID: 25MCI10088  
- Branch: MCA (AI & ML)  
- Section: MAM-1 A  
- Semester: Second Semester  
- Subject: Technical Skills  
- Date of Performance: 12/01/2026  

---

## AIM
Learn how to create, query, and manage views in SQL to simplify database queries and provide a layer of abstraction for end-users.

---

## Software Requirement
- Oracle Database Express Edition  
- PostgreSQL  
- pgAdmin  

---

## OBJECTIVES
- Data Abstraction: Hide complex joins and logic behind simple virtual tables.  
- Enhanced Security: Restrict access to sensitive columns using views.  
- Query Simplification: Pre-join multiple tables for easier reporting.  
- View Management: Understand creation, alteration, and deletion of views.  

---

# Practical / Experiment Steps

---

## Step 0: Setup (Creation of Tables)

```sql
CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

```sql
INSERT INTO Department (dept_name) VALUES
('HR'),
('IT'),
('Finance'),
('Sales');
```

### Department Table Employee Table


![](![](images/department_output.png))
![](mages/employee.png)

---

## Step 1: Creating a Simple View for Data Filtering

```sql
CREATE VIEW Active_Employees AS
SELECT emp_id, emp_name, salary, dept_id
FROM Employee
WHERE status = 'Active';
```

### Output
![](mages/simple.png)

---

## Step 2: Creating a View for Joining Multiple Tables

```sql
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
```

### Output
![](images/multiple.png)

---

## Step 3: Advanced Summarization View

```sql
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
```

### Output
![](mages/summary.png)

---

## Outcomes
- Abstraction Proficiency: Create and query views for efficient data abstraction.  
- Security Implementation: Use views for restricted access and data masking.  
- Syntactic Accuracy: Demonstrate correct view creation and management syntax.  
- Real-world Application: Design views for practical domains like Payroll or Library Systems.  

---

## Conclusion
This experiment demonstrated how SQL views provide abstraction, simplify queries, enhance security, and support efficient reporting in enterprise-level database systems.
