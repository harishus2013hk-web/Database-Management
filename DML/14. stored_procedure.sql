CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employee (emp_id, name, department, salary, hire_date) VALUES
(1, 'Alice', 'HR', 40000, '2020-01-15'),
(2, 'Bob', 'Finance', 55000, '2019-03-10'),
(3, 'Charlie', 'IT', 60000, '2021-07-01'),
(4, 'David', 'Finance', 52000, '2022-02-20'),
(5, 'Eva', 'IT', 75000, '2018-11-11'),
(6, 'Frank', 'HR', 42000, '2021-05-05'),
(7, 'Grace', 'Finance', 58000, '2020-09-09'),
(8, 'Helen', 'IT', 67000, '2019-12-25'),
(9, 'Ian', 'HR', 45000, '2022-06-30'),
(10, 'Jack', 'Finance', 50000, '2023-01-01');

-- - Write a stored procedure that returns all employees in the HR department.
DELIMITER $$
CREATE PROCEDURE hr_data()
BEGIN
	SELECT * FROM employee WHERE department="HR";
END$$
DELIMITER ;

CALL hr_data();

-- Create a stored procedure that accepts a department name as input and returns all employees in that department.
DELIMITER $$
CREATE PROCEDURE show_data(IN p_department VARCHAR(50))
BEGIN
	SELECT * FROM employee WHERE department=p_department;
END$$
DELIMITER ;

CALL show_data("HR");

-- Write a stored procedure that calculates the total salary of a given department (passed as a parameter).

DELIMITER $$
CREATE PROCEDURE get_salary(IN p_department VARCHAR(50))
BEGIN
	SELECT department,SUM(salary) as total_salary FROM employee WHERE department=p_department GROUP BY department;
END $$
DELIMITER ;

CALL get_salary("IT");

-- Create a stored procedure that accepts an employee ID and returns whether the employee’s salary is above or below the company average.

DELIMITER $$
CREATE PROCEDURE check_salary(IN p_emp_id INT)
BEGIN
	DECLARE empsalary INT ;
    DECLARE avgsalary DECIMAL(10,2);
    DECLARE ename VARCHAR(50);
    DECLARE dept_name VARCHAR(50);
    
    SELECT salary INTO empsalary FROM employee WHERE emp_id=p_emp_id;
    SELECT AVG(salary) INTO avgsalary FROM employee;
    SELECT name INTO ename FROM employee WHERE emp_id=p_emp_id;
    SELECT department INTO dept_name FROM employee WHERE emp_id=p_emp_id;
    
    IF empsalary>avgsalary THEN
		SELECT ename,dept_name,empsalary as Emp_salary, avgsalary as Avg_salary,"Above Average" as Result;
	ELSE
		SELECT ename,dept_name,empsalary as Emp_salary, avgsalary as Avg_salary, "Below Average" as Result;
	END IF;
END$$
DELIMITER ;
DROP procedure check_salary;
CALL check_salary(1);

-- Write a stored procedure that inserts a new employee record into the table, taking parameters for all columns.
DELIMITER $$
CREATE PROCEDURE insert_detail
(
	IN p_emp_id INT,
    IN p_name VARCHAR(50),
    IN p_department VARCHAR(50),
    IN p_salary INT,
    IN p_hire_date DATE
)
BEGIN
	INSERT INTO employee (emp_id, name, department, salary, hire_date)
    VALUES (p_emp_id,p_department, p_name, p_salary, p_hire_date);
END $$
DELIMITER ;

CALL insert_detail(11,"Sourav","IT",50000,"2022-06-04");
SELECT * FROM employee;

-- Create a stored procedure that increases the salary of all employees in a given department by 10%.
DELIMITER $$
CREATE PROCEDURE sal_hike (IN p_department VARCHAR (50))
BEGIN
	UPDATE employee SET salary=salary+(salary*0.1) WHERE department=p_department;
END $$
DELIMITER ;

SET SQL_SAFE_UPDATES=0;
CALL sal_hike("HR");

-- Write a stored procedure that accepts a year as input and returns all employees hired in that year.
DELIMITER $$
CREATE PROCEDURE hire_year(IN hireyear INT)
BEGIN
	SELECT * FROM employee WHERE YEAR(hire_date)=hireyear;
END $$
DELIMITER ;

CALL hire_year(2020);

-- Create a stored procedure that finds the department with the highest total salary 
DELIMITER //
CREATE PROCEDURE GetDeptWithMaxSalary()
BEGIN
    WITH DeptSalary AS (
        SELECT department, SUM(salary) AS TotalSalary
        FROM employee
        GROUP BY department ORDER BY SUM(salary) DESC
    )
    SELECT department, TotalSalary
    FROM DeptSalary
    LIMIT 1;
END //
DELIMITER ;

CALL GetDeptWithMaxSalary();

-- Create a stored procedure to return the total number of employees in a department.

DELIMITER //

CREATE PROCEDURE CountEmployees(IN dept_name VARCHAR(50), OUT emp_count INT)
BEGIN
    SELECT COUNT(*) 
    INTO emp_count
    FROM employee
    WHERE department = dept_name;
END //

DELIMITER ;

CALL CountEmployees('Finance', @total);
SELECT @total;

-- Create a stored procedure that adds 5000 bonus to the salary value passed.

DELIMITER //

CREATE PROCEDURE AddBonus(INOUT salary_value INT)
BEGIN
    SET salary_value = salary_value + 5000;
END //

DELIMITER ;

SET @salary = 40000;
CALL AddBonus(@salary);
SELECT @salary;

-- Create a stored procedure to check whether an employee salary is above or below the average salary.
DELIMITER //

CREATE PROCEDURE CheckSalary(IN empid INT)
BEGIN
    DECLARE empsalary INT;
    DECLARE avgsalary DECIMAL(10,2);

    SELECT salary INTO empsalary
    FROM employee
    WHERE emp_id = empid;

    SELECT AVG(salary) INTO avgsalary
    FROM employee;

    IF empsalary > avgsalary THEN
        SELECT 'Above Average Salary' AS Result;
    ELSE
        SELECT 'Below Average Salary' AS Result;
    END IF;

END //

DELIMITER ;

CALL CheckSalary(3);
