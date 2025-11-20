SELECT CURDATE();         -- Current date (YYYY-MM-DD)
SELECT CURTIME();         -- Current time (HH:MM:SS)
SELECT NOW();             -- Current date and time
SELECT SYSDATE();         -- Current date and time at execution
SELECT UTC_DATE();        -- Current UTC date
SELECT UTC_TIME();        -- Current UTC time
SELECT UTC_TIMESTAMP();   -- Current UTC date and time
SELECT DATE_ADD('2025-11-20', INTERVAL 7 DAY);       -- Add days
SELECT DATE_SUB('2025-11-20', INTERVAL 1 MONTH);     -- Subtract months
SELECT ADDDATE('2025-11-20', INTERVAL 10 DAY);       -- Add days (alias)
SELECT SUBDATE('2025-11-20', INTERVAL 5 DAY);        -- Subtract days (alias)
SELECT TIMESTAMPADD(DAY, 10, '2025-11-20');          -- Add using TIMESTAMPADD
SELECT TIMESTAMPDIFF(MONTH, '2025-01-01', '2025-11-20'); -- Difference in months
SELECT YEAR('2025-11-20');       -- Extract year
SELECT MONTH('2025-11-20');      -- Extract month
SELECT DAY('2025-11-20');        -- Extract day
SELECT HOUR('2025-11-20 14:30:00'); -- Extract hour
SELECT MINUTE('2025-11-20 14:30:00'); -- Extract minute
SELECT SECOND('2025-11-20 14:30:00'); -- Extract second
SELECT WEEKDAY('2025-11-20');    -- Day index (0=Monday)
SELECT DAYNAME('2025-11-20');    -- Day name
SELECT MONTHNAME('2025-11-20');  -- Month name
SELECT QUARTER('2025-11-20');    -- Quarter (1–4)
SELECT DATE_FORMAT('2025-11-20', '%Y-%m-%d');        -- Format as YYYY-MM-DD
SELECT DATE_FORMAT('2025-11-20', '%W, %M %d, %Y');   -- Full weekday and month
SELECT TIME_FORMAT('14:30:00', '%h:%i %p');          -- Format time as 02:30 PM
SELECT DATEDIFF('2025-12-01', '2025-11-20');         -- Difference in days
SELECT STR_TO_DATE('20-11-2025', '%d-%m-%Y');        -- Convert string to date
SELECT LAST_DAY('2025-11-20');                       -- Last day of the month
SELECT MAKEDATE(2025, 324);                          -- Create date from year and day-of-year
SELECT MAKETIME(14, 30, 0);                          -- Create time from hour, minute, second