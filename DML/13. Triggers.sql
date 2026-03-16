CREATE DATABASE trigg_ers;
USE trigg_ers;
CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT
);

INSERT INTO inventory (product_id, product_name, quantity) VALUES
(1, 'Product A', 100),
(2, 'Product B', 150),
(3, 'Product C', 200);

SELECT * FROM inventory;

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    amount DECIMAL(10, 2),
    sale_date DATE,
    quantity_sold INT
);

DELIMITER //
CREATE TRIGGER after_sales_insert
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE inventory
    SET quantity = quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

INSERT INTO sales (product_id, amount, sale_date, quantity_sold) VALUES
(1, 50.00, '2024-07-01', 10);

SHOW TRIGGERS;

DROP TRIGGER IF EXISTS after_sales_insert;

-- --------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);

CREATE TABLE deleted_employees_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    deleted_at DATETIME
);

INSERT INTO employees (emp_id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'IT'),
(3, 'Charlie', 'Finance');

Select * from employees; 

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees_log(emp_id, name, department, deleted_at)
    VALUES (OLD.emp_id, OLD.name, OLD.department, NOW());
END //
DELIMITER ;

DELETE FROM employees WHERE emp_id = 2;

SELECT * FROM deleted_employees_log;

-- --------------------------------------------------------------------------------------------------------------------

CREATE TABLE STUDENTS(
st_id INT auto_increment PRIMARY KEY ,
name varchar(20),
grade varchar(2)
);

INSERT INTO STUDENTS(name,grade)
VALUES
("ABC","A"),
("DEF","B"),
("GHI","A");

SELECT * FROM STUDENTS;

CREATE TABLE STUDENTS_LOG(
st_id INT auto_increment PRIMARY KEY ,
name VARCHAR(20),
action_time datetime,
action varchar(50)
);

DELIMITER //
CREATE TRIGGER student_log
AFTER INSERT ON STUDENTS
FOR EACH ROW
BEGIN
    INSERT INTO students_log(st_id,name, action_time, action)
    VALUES (NEW.st_id,NEW.name, NOW(), "INSERTED");
END //
DELIMITER ;

INSERT INTO STUDENTS(name,grade)
VALUES
("ABCD","A");

SELECT * FROM STUDENTS;
SELECT * FROM students_log;

-- --------------------------------------------------------------------------------------------
CREATE TABLE employees_2
	(
		employee_id INT,
        name VARCHAR(50),
        hourly_pay INT
	);
    
INSERT INTO employees_2 ( employee_id, name, hourly_pay)
VALUES
(1, "Ria", 1000),
(2, "Raj", 2000),
(3, "Ajay", 3000);

SELECT * FROM employees_2;

ALTER TABLE employees_2 ADD COLUMN salary DECIMAL (10,2) AFTER hourly_pay;

UPDATE employees_2
SET salary=2080*hourly_pay;

DELIMITER //
CREATE TRIGGER hourly_pay_update
BEFORE UPDATE ON employees_2
FOR EACH ROW
BEGIN
	SET NEW.salary=(NEW.hourly_pay*2080);
END //
DELIMITER ;

UPDATE employees_2 SET hourly_pay=100 WHERE employee_id=1;

-- ---------------------------------------------------------------------------------------------------------------
CREATE TABLE employee_3
	(
		emp_id INT PRIMARY KEY,
        name VARCHAR(20),
        salary int
	);
    
DELIMITER //

CREATE TRIGGER set_default_salary
BEFORE INSERT ON employee_3
FOR EACH ROW
BEGIN
    SET NEW.salary = IFNULL(NEW.salary, 10000);
END //

DELIMITER ;

INSERT INTO employee_3 VALUES(1,"Amit",NULL);
SELECT * FROM employee_3;

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE student_1
	(
		sid INT PRIMARY KEY,
        name VARCHAR(100)
	);
    
INSERT INTO student_1 VALUES(1,"ABC");

CREATE TABLE student_log_1
	(
		message VARCHAR(100)
	);

DELIMITER //

CREATE TRIGGER message
AFTER INSERT ON student_1
FOR EACH ROW
BEGIN
	INSERT INTO student_log_1 VALUES (CONCAT("New Student added", NOW()));
END //

DELIMITER ;

DROP TRIGGER IF EXISTS message;

INSERT INTO student_1 VALUES (2, "DEF");
SELECT * FROM student_log_1;
TRUNCATE student_1;
SHOW triggers;

DROP TABLE student_log_1;

-- -------------------------------------------------------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER prevent_salary_cut
BEFORE UPDATE ON employee_3
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary reduction not allowed';
    END IF;
END //

DELIMITER ;

INSERT INTO employee_3 VALUES (2, 'Ravi', 50000);

UPDATE employee_3 SET salary = 45900 WHERE emp_id = 1;

SELECT * FROM employee_3;

