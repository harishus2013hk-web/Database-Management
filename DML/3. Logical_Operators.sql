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
    
    -- 1. Males from Agra
SELECT * FROM personal WHERE gender = 'M' AND city = 'Agra';

-- 2. Age > 20 AND city is Delhi
SELECT * FROM personal WHERE age > 20 AND city = 'Delhi';

-- 3. Name contains 'Kumar' AND age < 22
SELECT * FROM personal WHERE name LIKE '%Kumar%' AND age < 22;

-- 4. Phone starts with '403' AND gender is 'F'
SELECT * FROM personal WHERE phone LIKE '403%' AND gender = 'F';

-- 5. Age is 21 AND city is not Agra
SELECT * FROM personal WHERE age = 21 AND city <> 'Agra';

-- 1. City is Agra OR Bhopal
SELECT * FROM personal WHERE city = 'Agra' OR city = 'Bhopal';

-- 2. Age is 18 OR 22
SELECT * FROM personal WHERE age = 18 OR age = 22;

-- 3. Name contains 'Kumar' OR 'Khan'
SELECT * FROM personal WHERE name LIKE '%Kumar%' OR name LIKE '%Khan%';

-- 4. Gender is 'F' OR city is 'Delhi'
SELECT * FROM personal WHERE gender = 'F' OR city = 'Delhi';

-- 5. Phone ends with '21' OR starts with '402'
SELECT * FROM personal WHERE phone LIKE '%21' OR phone LIKE '402%';

-- 1. Not from Delhi
SELECT * FROM personal WHERE NOT city = 'Delhi';

-- 2. Not male
SELECT * FROM personal WHERE NOT gender = 'M';

-- 3. Name does not contain 'Kumar'
SELECT * FROM personal WHERE NOT name LIKE '%Kumar%';

-- 4. Age not between 19 and 21
SELECT * FROM personal WHERE NOT age BETWEEN 19 AND 21;

-- 5. City not in Agra or Delhi
SELECT * FROM personal WHERE NOT city IN ('Agra', 'Delhi');