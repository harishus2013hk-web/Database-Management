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
WHERE city = 'Agra' AND gender = 'M';

SELECT * FROM personal
WHERE city = 'Agra' OR city = 'Delhi';

SELECT * FROM personal
WHERE NOT gender = 'F';

SELECT * FROM personal
WHERE (city = 'Agra' OR city = 'Delhi') AND age > 20;

SELECT * FROM personal
WHERE city IN ('Agra', 'Bhopal') AND age BETWEEN 18 AND 21;

SELECT * FROM personal
WHERE city IN ('Agra', 'Bhopal') AND age BETWEEN 18 AND 21;

-- Names starting with 'S'
SELECT * FROM personal
WHERE name LIKE 'S%';

-- Names ending with 'Kumar'
SELECT * FROM personal
WHERE name LIKE '%Kumar';

-- Names containing 'an'
SELECT * FROM personal
WHERE name LIKE '%an%';

-- Check if phone is missing
SELECT * FROM personal
WHERE phone IS NULL;

-- Ensure phone is present
SELECT * FROM personal
WHERE phone IS NOT NULL;