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
    
SELECT CONCAT(name, ' from ', city) AS full_identity FROM personal;
SELECT LOWER(name) AS lowercase_name FROM personal;
SELECT UPPER(city) AS uppercase_city FROM personal;
SELECT REVERSE(name) AS reversed_name FROM personal;
SELECT REPEAT(name, 2) AS name_twice FROM personal;
SELECT SPACE(3) AS blank_space;
SELECT SUBSTRING(name, 1, 5) AS short_name FROM personal;
SELECT LEFT(name, 4) AS name_start FROM personal;
SELECT RIGHT(name, 4) AS name_end FROM personal;
SELECT MID(name, 7, 5) AS mid_name FROM personal;
SELECT LOCATE('Kumar', name) AS position_kumar FROM personal;
SELECT INSTR(name, 'Khan') AS position_khan FROM personal;
SELECT POSITION('Kapoor' IN name) AS position_kapoor FROM personal;
SELECT TRIM('   ' || name || '   ') AS trimmed_name FROM personal;
SELECT LTRIM('   ' || name) AS left_trimmed FROM personal;
SELECT RTRIM(name || '   ') AS right_trimmed FROM personal;
SELECT LPAD(name, 20, '*') AS padded_left FROM personal;
SELECT RPAD(name, 20, '-') AS padded_right FROM personal;
SELECT FIND_IN_SET(city, 'Agra,Delhi,Bhopal') AS city_rank FROM personal;
SELECT FIELD(city, 'Agra', 'Delhi', 'Bhopal') AS city_index FROM personal;
SELECT ELT(2, 'Agra', 'Delhi', 'Bhopal') AS second_city;