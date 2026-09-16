CREATE DATABASE company_db;
USE company_db;
CREATE TABLE Employees (
emp_id INT AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(50),
dept VARCHAR(20),
salary INT,
join_date DATE,
email VARCHAR(50)
);

INSERT INTO Employees VALUES 
(1, 'Amit Sharma', 'IT', 80000, '2024-08-01', 'amit@gmail.com'),
(2, 'Anjali Verma', 'HR', 45000, '2024-09-10', 'anjali@gmail.com'),
(3, 'Rohan Singh', 'IT', 90000, '2023-01-15', 'rohan@gmail.com'),
(4, 'Sneha Gupta', 'Finance', 60000, '2024-08-25', 'sneha@gmail.com'),
(5, 'Aman Kumar', 'IT', 70000, '2022-11-01', 'amit@gmail.com'),
(6, 'Priya Das', 'HR', 55000, '2024-09-01', 'priya@gmail.com');

Select * FROM Employees;

-- Q1 Retrive all the employees with salary>60000 and whose name start with 'A'(SELECT+WHERE+LIKE OPERATOR)
SELECT * FROM Employees WHERE salary > 60000 AND name LIKE 'A%';
-- Q2 Get unique departments and sort employees by salary high to low and get top 3 highest paod employees(DISTINCT+ORDER BY+LIMIT/TOP)
SELECT DISTINCT dept FROM Employees;
SELECT * FROM Employees ORDER BY salary DESC LIMIT 3;
-- Q3 count number of employees in each department(COUNT+GROUP BY)
SELECT dept, COUNT(*) AS total_emp FROM Employees GROUP BY dept;
-- Q4 Find employees who joined in last 30 days(DATA FILTERING)
SELECT * FROM Employees WHERE join_date >= CURRENT_DATE - INTERVAL 30 DAY;
-- Q5 Find duplicate emails(DUPLICATE DETECTION)
SELECT email, COUNT(*) FROM Employees GROUP BY email HAVING COUNT(*) > 1;
