create database learning_sql;
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