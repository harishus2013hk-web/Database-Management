-- Insert 200 realistic Nigerian customers
CREATE TABLE first_names(name VARCHAR(50));
INSERT INTO first_names VALUES
('Chinedu'),('Aisha'),('Tunde'),('Ngozi'),('Bola'),('Obinna'),('Fatima'),('Yakubu'),
('Emeka'),('Zainab'),('Ifeanyi'),('Uche'),('Abubakar'),('Lilian'),('Segun'),('Halima'),
('Adesuwa'),('Kehinde'),('Mercy'),('Emmanuel');

CREATE TABLE last_name (name VARCHAR(50));
INSERT INTO last_name VALUES
('Okonkwo'),('Balogun'),('Adegoke'),('Nwachukwu'),('Danjuma'),('Adelaja'),('Ibrahim'),
('Umeh'),('Ogunleye'),('Abiola'),('Mohammed'),('Eze'),('Lawal'),('Obi'),('Ahmed'),('Onyeka'),
('Nwabueze'),('Ajibade'),('Suleman'),('Johnson');

CREATE TABLE cities (name VARCHAR(50));
INSERT INTO cities VALUES
('Lagos'),('Abuja'),('Port Harcourt'),('Enugu'),('Kano'),('Ibadan'),('Jos'),('Abeokuta'),
('Calabar'),('Owerri'),('Benin City'),('Kaduna');

INSERT INTO customers (name, gender, dob, signup_date, city)
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM seq WHERE n < 200
)
SELECT
    CONCAT(
        (SELECT name FROM first_names ORDER BY RAND() LIMIT 1),
        ' ',
        (SELECT name FROM last_name ORDER BY RAND() LIMIT 1)
    ),
    CASE 
        WHEN RAND() < 0.5 THEN 'M' 
        ELSE 'F' 
    END,
    DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND() * 10000) DAY),
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1095) DAY),
    (SELECT name FROM cities ORDER BY RAND() LIMIT 1)
FROM seq;

SELECT * FROM customers;
SHOW TABLES;

-- Insert accounts (1-2 per customer) with realistic 10-digit account numbers and random balances
INSERT INTO accounts(customer_id,account_number,account_type,open_date,balance)
SELECT 
	c.customer_id,
    LPAD(FLOOR(RAND()*100000000000),10,'0'),
    ELT(FLOOR(1+RAND()*3),'savings', 'current', 'loan'),
    DATE_ADD(c.signup_date,INTERVAL FLOOR(RAND()*90) DAY),
    ROUND(1000+RAND()*499000,2)
FROM customers c
CROSS JOIN (
	SELECT 1 AS n
    UNION ALL
    SELECT 2
) dup
WHERE RAND()<0.75
LIMIT 1000;

SELECT * FROM accounts;

INSERT INTO transactions (
    account_id,
    transaction_type,
    amount,
    transaction_date,
    description
)
SELECT
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,

    CASE
        WHEN t.transaction_type = 'credit' THEN
            ELT(FLOOR(1 + RAND() * 11),
                'Salary credited',
                'Bank transfer from GTBank',
                'Credit alert from Zenith',
                'Reversal of failed transaction',
                'Loan disbursement',
                'Wallet top-up',
                'Refund from vendor',
                'POS reversal',
                'Received from customer',
                'Online payment received',
                'Cash deposit'
            )
        ELSE
            ELT(FLOOR(1 + RAND() * 11),
                'POS payment at Shoprite',
                'MTN Airtime recharge',
                'Fuel purchase at Mobil',
                'Electricity bill payment',
                'Loan EMI debit',
                'House rent payment',
                'Online purchase at Jumia',
                'Cash withdrawal from ATM',
                'Subscription payment',
                'Insurance premium debit',
                'Bank transfer to Fidelity Bank'
            )
    END AS description

FROM (
    SELECT
        a.account_id,

        CASE
            WHEN RAND() < 0.5 THEN 'debit'
            ELSE 'credit'
        END AS transaction_type,

        ROUND(500 + RAND() * 249500, 2) AS amount,

        NOW() - INTERVAL FLOOR(RAND() * 730) DAY AS transaction_date

    FROM accounts a
    CROSS JOIN (
        SELECT 1
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
    ) gs
) t

ORDER BY RAND()
LIMIT 1000;

SELECT * FROM transactions;

-- Confirm balanced transaction type
SELECT 
	transaction_type, 
	COUNT(*) 
FROM transactions 
GROUP BY transaction_type;

-- See variety of descriptions
SELECT 
	description, 
	COUNT(*) 
FROM transactions 
GROUP BY description 
ORDER BY COUNT(*) DESC;

-- Count total rows
SELECT 
	COUNT(*) 
FROM transactions;

