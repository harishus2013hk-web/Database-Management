This repository showcases essential SQL control and aggregation techniques used in real-world data analysis:
**DDL (Data Definition Language)** 
These commands are used to define, modify, and manage the structure of database objects such as tables, views, indexes, and constraints. Common DDL statements include:
- CREATE – to create new tables, schemas, or other database objects
- ALTER – to modify existing table structures or constraints
- DROP – to delete tables or other objects permanently
- TRUNCATE – to quickly remove all data from a table while keeping its structure
- RENAME – to change the name of a table or column
  **IN and LIKE commands**
- IN is used to match a value against a list of possible values. It simplifies multiple OR conditions and is ideal for filtering categorical data.
- LIKE is used for pattern matching with wildcards:
- % matches any sequence of characters
- _ matches a single character
**Text Functions Summary**
Text functions in MySQL are used to manipulate, format, and analyze string data. They allow you to:
- Combine and format strings (CONCAT, CONCAT_WS, FORMAT)
- Change case (LOWER, UPPER)
- Extract substrings (SUBSTRING, LEFT, RIGHT, MID)
- Search within strings (INSTR, LOCATE, POSITION, LIKE, REGEXP)
- Trim or pad strings (TRIM, LTRIM, RTRIM, LPAD, RPAD)
- Convert and encode (ASCII, CHAR, HEX, UNHEX, BIN, CONV)
- Replace or insert content (REPLACE, INSERT)
- Work with sets and lists (FIND_IN_SET, FIELD, MAKE_SET, EXPORT_SET)

**Date Functions Summary
MySQL date functions are used to retrieve, manipulate, and format date and time values. They help with:
- Getting current values: NOW(), CURDATE(), CURTIME()
- Extracting parts: YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND()
- Date arithmetic: DATE_ADD(), DATE_SUB(), TIMESTAMPDIFF()
- Formatting: DATE_FORMAT(), TIME_FORMAT()
- Comparisons and differences: DATEDIFF(), LAST_DAY(), MAKEDATE()
These functions are essential for filtering by time, generating reports, scheduling, and handling time-based logic in queries.

 **LIMIT and OFFSET Summary**
- LIMIT restricts the number of rows returned by a query. It’s commonly used to fetch the top N results.
- OFFSET skips a specified number of rows before starting to return results. It’s useful for pagination.

**- WHERE: Filters rows based on specific conditions to refine query results.**

**Logical Operators Summary**
Logical operators are used to combine or modify conditions in SQL queries, especially within the WHERE clause. The main operators include:
- AND – Returns true if all conditions are true.
- OR – Returns true if any condition is true.
- NOT – Reverses the result of a condition (true becomes false, and vice versa).
  
**- IF-ELSE (MySQL): Inline decision-making for binary conditions and branching logic.
**- CASE WHEN: Conditional logic for dynamic column values and categorization.

- **GROUP BY: Aggregates data by categories to compute metrics like SUM, AVG, COUNT.
- ORDER BY: Sorts query results by one or more columns in ascending or descending order, enabling ranked outputs, chronological listings, and prioritized views.
**
