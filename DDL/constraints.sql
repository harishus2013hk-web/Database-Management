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
    
    CREATE TABLE personal_1 (
    id INT NOT NULL UNIQUE PRIMARY KEY,                       -- Primary key enforces NOT NULL and UNIQUE
    name VARCHAR(30) NOT NULL CHECK(length(name) > 1),       -- Name cannot be null and must be more than 1 character
    age INT NOT NULL CHECK(age > 17 AND age < 100),          -- Age between 18 and 99
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F')),    -- Only 'M' or 'F' allowed
    phone VARCHAR(10) NOT NULL UNIQUE CHECK(length(phone) = 10),  -- Phone unique, exactly 10 chars
    city VARCHAR(20) DEFAULT 'Delhi'                          -- Default value for city
);
