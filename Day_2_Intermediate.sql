CREATE TABLE Departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(20),
  location VARCHAR(20)
);
INSERT INTO Departments VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Mumbai'),
(3, 'Finance', 'Pune'),
(4, 'Marketing', 'Delhi');

CREATE TABLE Managers (
  emp_id INT,
  manager_id INT
);
INSERT INTO Managers VALUES (1,3), (2,3), (3,NULL), (4,3), (5,1);

-- Q6 Get employees name with their department location(INNER JOIN)
SELECT e.name, d.location FROM Employees e;
INNER JOIN department d ON e.dept = d.dept_name;
-- Q7 Find departments that have no employees(LEFT JOIN)
SELECT d.dept_name FROM Departments d;
LEFT JOIN Employees e on d.dept_name = e.dept WHERE e.emp_id IS NULL;
-- Q8 Find second highest salary without limit
SELECT MAX(salary) FROM Employees WHERE salary < (SELECT MAX(salary) FROM Employees);
-- Q9 Label employees as High/Mid/Low earner(CASE STATEMENT)
SELECT name, salary,
CASE 
WHEN salary > 80000 THEN 'High'
WHEN salary > 50000 THEN 'Mid'
ELSE 'Low'
END AS salary_band FROM Employees;
-- Q10 Find department with average salary>60000(HAVING)
SELECT dept, AVG(salary) AS avg_salary FROM Employees GROUP BY dept HAVING AVG(salary) > 60000;
-- NOTE:(WHERE used to filter data before grouping and HAVING used after grouping it used with aggregate functions like COUNT(),SUM(),AVG() )
-- Q11 Find employees who work in delhi
SELECT * FROM Employees WHERE dept IN (SELECT dept_name FROM Departments WHERE location = 'Delhi');
