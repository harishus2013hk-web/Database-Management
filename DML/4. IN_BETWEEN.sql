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
    
-- 1. People from Agra or Delhi
SELECT * FROM personal
WHERE city IN ('Agra', 'Delhi');

-- 2. People aged 19, 21, or 22
SELECT * FROM personal
WHERE age IN (19, 21, 22);

-- 3. Names in a specific list
SELECT * FROM personal
WHERE name IN ('Ram Kumar', 'Juhi Chawla');

-- 4. Phone numbers in a given set
SELECT * FROM personal
WHERE phone IN ('4022155', '4033776');

-- 5. Gender is either male or female (basic validation)
SELECT * FROM personal
WHERE gender IN ('M', 'F');

-- 1. People aged between 19 and 21
SELECT * FROM personal
WHERE age BETWEEN 19 AND 21;

-- 2. Phone numbers between 4030000 and 4040000
SELECT * FROM personal
WHERE phone BETWEEN '4030000' AND '4040000';

-- 3. Age between 18 and 20 AND city is Agra
SELECT * FROM personal
WHERE age BETWEEN 18 AND 20 AND city = 'Agra';

-- 4. Age not between 20 and 22
SELECT * FROM personal
WHERE age NOT BETWEEN 20 AND 22;

-- 5. Phone numbers between '4020000' and '4030000' for males
SELECT * FROM personal
WHERE phone BETWEEN '4020000' AND '4030000' AND gender = 'M';