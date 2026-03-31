CREATE TABLE Studentss (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT
);

INSERT INTO Studentss VALUES (1, 'Aman', 101);
INSERT INTO Studentss VALUES (2, 'Sahil', 102);
INSERT INTO Studentss VALUES (3, 'Riya', 101);
INSERT INTO Studentss VALUES (4, 'Karan', NULL);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO Courses VALUES (201, 'DBMS');
INSERT INTO Courses VALUES (202, 'Machine Learning');
INSERT INTO Courses VALUES (203, 'Operating Systems');

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Studentss(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments VALUES (1, 201);
INSERT INTO Enrollments VALUES (1, 202);
INSERT INTO Enrollments VALUES (2, 201);
INSERT INTO Enrollments VALUES (3, 203);

CREATE TABLE Departmentss (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departmentss VALUES (101, 'Computer Science');
INSERT INTO Departmentss VALUES (102, 'Information Technology');
INSERT INTO Departmentss VALUES (103, 'Electronics');

--1. Write queries to list students with their enrolled courses (INNER JOIN).

select a.student_name,c.course_name
from Studentss a
inner join Enrollments b on 
a.student_id=b.student_id
inner join Courses c on 
b.course_id=c.course_id

-- Find students not enrolled in any course (LEFT JOIN).

select a.student_name
from Studentss a
left join Enrollments b on 
a.student_id=b.student_iD
WHERE course_id is null

-- Display all courses with or without enrolled students 

select DISTINCT a.course_name from
courses a 
right join Enrollments b on
a.course_id=b.course_id

-- Show students with department info using SELF JOIN or multiple joins.

select a.student_name,b.department_id, c.department_name from studentss a
join Studentss b
on a.student_id=b.student_id
join Departmentss c on
b.department_id=c.department_id

-- Display all possible student-course combinations (CROSS JOIN). (Oracle, SAP, IBM, Microsoft)
select *
from Studentss cross join Courses