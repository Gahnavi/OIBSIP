# Task 3: SQL Injection on DVWA

## Objective
To demonstrate SQL injection on the locally hosted Damn Vulnerable Web Application (DVWA) using Low security.

## Environment
- Application: DVWA
- Local URL: `http://localhost:8081/DVWA/`
- Module: Vulnerability: SQL Injection
- Security level: Low
- Database: MariaDB/MySQL through XAMPP

## Test 1: Normal Input
**Input:** `2`

**Observed result:** Only one record was displayed:
- ID: 2
- First name: Gordon
- Surname: Brown

Screenshot: `sqli_normal_input.png`

## Test 2: Boolean-Based SQL Injection
**Payload:** `' OR '1'='1`

**Observed result:** Five records were displayed: admin, Gordon, Hack, Pablo, and Bob.

**Explanation:** The condition `'1'='1'` is always true. Because the application inserts the input directly into its SQL query, the injected condition changes the query logic and returns multiple records.

Screenshot: `sqli_payload1_result.png`

## Test 3: SQL Comment Injection
**Payload:** `' OR '1'='1' #`

**Observed result:** The same five records were displayed.

**Explanation:** In MySQL/MariaDB, `#` starts a single-line comment. It can cause the remaining portion of the SQL statement to be ignored, depending on how the application constructs the query.

Screenshot: `sqli_payload2_result.png`

## Impact
The vulnerable application returned records beyond the single record requested. This demonstrates that unsanitized input can alter SQL query logic and expose data that should not be returned for an ordinary lookup.

## Prevention
1. Use parameterized queries or prepared statements.
2. Validate user input according to the expected data type.
3. Apply least-privilege database permissions.
4. Avoid building SQL queries by concatenating raw user input.
5. Perform security testing before deployment.

## Conclusion
The tests demonstrated SQL injection in DVWA at Low security. Normal input returned one record, while the two injection payloads returned five records. Parameterized queries are a primary defense against this vulnerability.

**Scope:** All tests were performed on a locally hosted DVWA lab for educational purposes.
