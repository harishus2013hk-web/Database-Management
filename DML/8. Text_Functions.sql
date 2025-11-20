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
    
-- Combine name and city into a single string
SELECT CONCAT(name, ' from ', city) AS full_identity FROM personal;

-- Convert all characters in name to lowercase
SELECT LOWER(name) AS lowercase_name FROM personal;

-- Convert all characters in city to uppercase
SELECT UPPER(city) AS uppercase_city FROM personal;

-- Reverse the characters in the name
SELECT REVERSE(name) AS reversed_name FROM personal;

-- Repeat the name twice (e.g., "Ram KumarRam Kumar")
SELECT REPEAT(name, 2) AS name_twice FROM personal;

-- Return a string with 3 blank spaces
SELECT SPACE(3) AS blank_space;

-- Extract the first 5 characters from the name
SELECT SUBSTRING(name, 1, 5) AS short_name FROM personal;

-- Extract the first 4 characters from the name (same as LEFT)
SELECT LEFT(name, 4) AS name_start FROM personal;

-- Extract the last 4 characters from the name
SELECT RIGHT(name, 4) AS name_end FROM personal;

-- Extract 5 characters starting from position 7 in the name
SELECT MID(name, 7, 5) AS mid_name FROM personal;

-- Find the position of the substring 'Kumar' in the name (0 if not found)
SELECT LOCATE('Kumar', name) AS position_kumar FROM personal;

-- Find the position of the substring 'Khan' in the name (0 if not found)
SELECT INSTR(name, 'Khan') AS position_khan FROM personal;

-- Find the position of 'Kapoor' in the name using POSITION syntax
SELECT POSITION('Kapoor' IN name) AS position_kapoor FROM personal;

-- Remove leading and trailing spaces from a padded name string
SELECT TRIM('   ' || name || '   ') AS trimmed_name FROM personal;

-- Remove leading spaces from a padded name string
SELECT LTRIM('   ' || name) AS left_trimmed FROM personal;

-- Remove trailing spaces from a padded name string
SELECT RTRIM(name || '   ') AS right_trimmed FROM personal;

-- Pad the name on the left with '*' to make it 20 characters long
SELECT LPAD(name, 20, '*') AS padded_left FROM personal;

-- Pad the name on the right with '-' to make it 20 characters long
SELECT RPAD(name, 20, '-') AS padded_right FROM personal;

-- Return the position of city in the comma-separated list ('Agra'=1, 'Delhi'=2, etc.)
SELECT FIND_IN_SET(city, 'Agra,Delhi,Bhopal') AS city_rank FROM personal;

-- Return the index of city in the list ('Agra'=1, 'Delhi'=2, etc.)
SELECT FIELD(city, 'Agra', 'Delhi', 'Bhopal') AS city_index FROM personal;

-- Return the 2nd element from the list (always returns 'Delhi')
SELECT ELT(2, 'Agra', 'Delhi', 'Bhopal') AS second_city;