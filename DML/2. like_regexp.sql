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

SELECT * FROM personal	WHERE name LIKE "ram%";

SELECT * FROM personal WHERE name LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal WHERE name NOT LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal WHERE phone LIKE "%5%";

SELECT * FROM personal WHERE name LIKE "j%m%";

-- Select names ending with 'Kumar'
SELECT * FROM personal
WHERE name REGEXP 'Kumar$';  -- '$' anchors the pattern to the end of the string

-- Select names starting with 'J' or 'S'
SELECT * FROM personal
WHERE name REGEXP '^[JS]';  -- '^' anchors to start; [JS] matches either 'J' or 'S'

-- Select phone numbers starting with '403'
SELECT * FROM personal
WHERE phone REGEXP '^403';  -- '^403' matches numbers that begin with 403

-- Select names containing 'an' (case-insensitive)
SELECT * FROM personal
WHERE name REGEXP '(?i)an';  -- '(?i)' makes the match case-insensitive

-- Select names with double vowels like 'aa', 'ee'
SELECT * FROM personal
WHERE name REGEXP '[aeiou]{2}';  -- Matches any two consecutive vowels

-- Select names ending in 'n' or 'r'
SELECT * FROM personal
WHERE name REGEXP '[nr]$';  -- Matches names ending with 'n' or 'r'

-- Select phone numbers with repeating digits (e.g., '22', '33')
SELECT * FROM personal
WHERE phone REGEXP '(.)\\1';  -- Captures a digit and checks if it repeats

-- Select names containing 'Kapoor' or 'Khan'
SELECT * FROM personal
WHERE name REGEXP 'Kapoor|Khan';  -- Matches either 'Kapoor' or 'Khan'

-- Names that contain both 'a' and 'n' in any order
SELECT * FROM personal
WHERE name REGEXP 'a.*n|n.*a';