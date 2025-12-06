CREATE DATABASE joins_concept;
USE joins_concept;

CREATE TABLE students
	(
		student_id INT PRIMARY KEY AUTO_INCREMENT,
        student_name VARCHAR(50),
        course_id INT
    );
INSERT INTO students(student_name,course_id)
VALUES
("John",101),
("Emma",102),
("Raj",103),
("Sara",NULL),
("Alex",101);

SELECT * FROM instructors;

CREATE TABLE courses
	(
		course_id INT PRIMARY KEY,
        course_name VARCHAR(50),
        instructor_id INT UNIQUE
    );
INSERT INTO courses(course_id,course_name,instructor_id)
VALUES
(101,"Data Science",1),
(102,"Machine Learning",2),
(103,"Database Systems",3),
(104,"Web Development",4);

SELECT * FROM courses;

CREATE TABLE instructors
	(
		instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(50)
	);
INSERT INTO instructors(instructor_id, instructor_name)
VALUES
(1,"Dr. Smith"),
(2,"Dr Miller"),
(3,"Dr Patel"),
(4,"Dr Brown"),
(5,"Dr Jones");

SELECT * FROM courses;

-- Inner Join Display students with their course names
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE course_name="Machine Learning";

-- Display student, course and instructor name
SELECT
	s.student_id,
    s.student_name,
    c.course_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id;

SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
INNER JOIN courses c ON s.course_id=c.course_id
WHERE course_name="Machine Learning";

-- display courses atleast having 1 student
SELECT
    c.course_name,
    COUNT(s.student_id) AS total_students
FROM courses c
INNER JOIN students s ON c.course_id = s.course_id
GROUP BY c.course_name
HAVING COUNT(s.student_id) >= 1;

-- show instructor and corresponding students
SELECT
	s.student_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON c.course_id=s.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id;

-- List all students with instructors whose names starts with Dr. P
SELECT
	s.student_name,
    i.instructor_name
FROM students s
INNER JOIN courses c ON c.course_id=s.course_id
INNER JOIN instructors i ON i.instructor_id=c.instructor_id
WHERE i.instructor_name LIKE 'Dr P%';

-- select all students and their courses
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s LEFT JOIN courses c ON s.course_id=c.course_id;

-- Right Join
SELECT
	c.course_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;

-- Find the students who are not enrolled in any subjects
SELECT
	s.student_id,
    s.student_name,
    c.course_name
FROM students s
LEFT JOIN courses c ON s.course_id=c.course_id
WHERE c.course_name IS NULL;

-- Display all courses and instructors, even if no instructors is assigned
SELECT 
    i.instructor_name,
    c.course_name
FROM courses c LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;

-- Show all instructors with their courses (even if no course)
SELECT 
    i.instructor_name,
    c.course_name
FROM instructors i
LEFT JOIN courses c 
    ON c.instructor_id = i.instructor_id;

-- Alternate with right joins
SELECT 
    i.instructor_name,
    c.course_name
FROM courses c
RIGHT JOIN instructors i 
    ON c.instructor_id = i.instructor_id;

-- Display students and instructors (even if no course assigned)
SELECT
	s.student_name,
    i.instructor_name
FROM courses c
RIGHT JOIN instructors i on i.instructor_id=c.instructor_id
RIGHT JOIN students s ON c.course_id=s.course_id;

-- Simulate FULL OUTER JOIN in MySQL
SELECT *
FROM students s
LEFT JOIN courses c
    ON s.course_id = c.course_id
UNION
SELECT *
FROM students s
RIGHT JOIN courses c
    ON s.course_id = c.course_id;

-- Dilsplay all students and courses using RIGHT JOIN
SELECT
	s.student_name,
    c.course_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;

-- Show all Instructors and courses (ensure all courses are displayed)
SELECT
	i.instructor_name,
	c.course_name
FROM courses c
LEFT JOIN instructors i ON c.instructor_id=i.instructor_id;

-- Find all instructors with students (use RIGHT JOIN)
SELECT
	i.instructor_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id
RIGHT JOIN instructors i on i.instructor_id=c.instructor_id;

-- Display all courses and corresponding students; show NULL if no student
SELECT
	c.course_name,
    s.student_name
FROM students s
RIGHT JOIN courses c ON c.course_id=s.course_id;