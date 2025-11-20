#create database learning_sql;
use learning_sql;
CREATE TABLE student
	(
		first_name varchar(30),
		last_name varchar(30),
		roll_no int,
		dob date
	);
INSERT INTO student(first_name,last_name,roll_no,dob) 
VALUES
("Harish","Kumar",1, "1990-05-29"),
("Harsh","Kumar",2, "1989-11-19"),
("Nitin","Singh",3,"1995-11,15");
-- #SET SQL_SAFE_UPDATES=0;
-- #delete from student where roll_no=2;
SELECT * FROM student_1;
ALTER TABLE student ADD email varchar(30);      					-- to add a new column
ALTER TABLE student MODIFY email int;								-- to change data type of a column
ALTER TABLE student CHANGE email email_id varchar(30);				-- to rename the column
ALTER TABLE student MODIFY email_id varchar(30) AFTER last_name;	-- modifying the column position
ALTER TABLE student DROP COLUMN email_id;							-- to delete a column
ALTER TABLE student RENAME COLUMN roll_no to roll_id;				-- to rename a column using rename
ALTER TABLE student RENAME student_1;								-- to rename table
TRUNCATE TABLE student_1;											-- to delete the rows in table
DROP TABLE student_1;												-- to delete the whole table

--/*create table using contraints
CREATE TABLE student_2
	(
		std_id INT NOT NULL UNIQUE,
        std_name VARCHAR(30) NOT NULL,
        age INT NOT NULL CHECK(age>=18),
        mobile VARCHAR(10) NOT NULL UNIQUE,
        city VARCHAR(30) DEFAULT "Delhi",
        gender VARCHAR(1) NOT NULL
	);
INSERT INTO student_2(std_id,std_name,age,mobile,city,gender)
VALUES
	(1,"ABC",18,876547,"Agra","M"),
    (2,"DEF",21,765413,"Noida","F"),
    (3,"GHI",23,765414,"Noida","F");
INSERT INTO student_2(std_id,std_name,age,mobile,gender)
VALUES(4,"JKL",23,765418,"F");
SELECT * FROM student_2
ALTER TABLE student_2 RENAME COLUMN std_name TO name;
ALTER TABLE student_2 CHANGE name std_name VARCHAR(30);
ALTER TABLE student_2 MODIFY gender VARCHAR(1) NOT NULL AFTER age;
ALTER TABLE student_2 MODIFY std_name VARCHAR(30) NOT NULL FIRST;

CREATE TABLE personal
	(
    id INT NOT NULL UNIQUE,
    name VARCHAR(30) NOT NULL,
    age int NOT NULL CHECK(age>17),
    gender VARCHAR(1) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    city VARCHAR(20) DEFAULT "Delhi"
    );
INSERT INTO personal(id,name,age,gender,phone,city)
values
	(1,"Ram Kumar",19,"M",4022155,"Agra"),
    (2,"Sarita Kumari",21,"F",4034421,"Delhi"),
    (3,"Salman Khan",20,"M",4056221,"Agra"),
    (4,"Juhi Chawla",18,"F",4089821,"Bhopal"),
    (5,"Anil Kapoor",22,"M",4025221,"Agra"),
    (6,"John Abraham",21,"M",4033776,"Delhi");

SELECT * FROM personal;
SELECT id AS name_id,name AS std_name

SELECT * FROM personal													#AND operator
WHERE gender="M" AND age>20;

SELECT * FROM personal													#NOT IN operator
WHERE city NOT IN ("Delhi","BHOPAL");

SELECT * FROM personal													#IN operator
WHERE age IN (21,18);

SELECT * FROM personal													#IN operator
WHERE name BETWEEN "a" AND "k";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "ram%";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal													#LIKE operator
WHERE name NOT LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal													#LIKE operator
WHERE phone LIKE "%5%";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "j%m%";