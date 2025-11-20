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
    
SELECT * FROM personal
ORDER BY age ASC;         -- Sort by age (youngest to oldest)

SELECT * FROM personal
ORDER BY name DESC;       -- Sort by name (Z to A)

SELECT * FROM personal
ORDER BY city ASC, age DESC;

SELECT * FROM personal
LIMIT 3;                  -- First 3 rows (unsorted)

SELECT * FROM personal
ORDER BY age DESC
LIMIT 2;                  -- Top 2 oldest people

SELECT * FROM personal
ORDER BY id
LIMIT 2 OFFSET 3;         -- Skip first 3 rows, return next 2

SELECT * FROM personal
LIMIT 3 OFFSET 0;   -- First 3 rows (same as LIMIT 3)

