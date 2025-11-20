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

-- Select all records where city is Delhi
SELECT * FROM personal 
WHERE city = 'Delhi';

-- Select all records where age is greater than 20
SELECT * FROM personal 
WHERE age > 20;

-- Select all female records from the table
SELECT * FROM personal 
WHERE gender = 'F';

-- Select records where phone number starts with '403'
SELECT * FROM personal 
WHERE phone LIKE '403%';

-- Select records where age is greater than 18 AND city is 'Agra'
SELECT * FROM personal 
WHERE age > 18 AND city = 'Agra';

-- Select the record where id equals 3
SELECT * FROM personal 
WHERE id = 3;