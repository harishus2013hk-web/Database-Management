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

SELECT * FROM personal;
SELECT id AS name_id,name AS std_name
from personal;

SELECT * FROM personal													#AND operator
WHERE gender in("M","F") AND age in(20,18,19);

SELECT * FROM personal													#NOT IN operator
WHERE city NOT IN ("Delhi","BHOPAL");

SELECT * FROM personal													#IN operator
WHERE age IN (21,18);

SELECT * FROM personal													#IN operator
WHERE name BETWEEN "a" AND "k";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "ram%";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal													#LIKE operator
WHERE name NOT LIKE "ram%" OR name LIKE "j_h%";

SELECT * FROM personal													#LIKE operator
WHERE phone LIKE "%5%";

SELECT * FROM personal													#LIKE operator
WHERE name LIKE "j%m%";