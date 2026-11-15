# Day 17 – LeetCode 185: Department Top Three Salaries
## Problem Statement
Find employees who are high earners in each department. A high earner is an employee whose salary belongs to the top three unique salaries in their department. Return the Department name, Employee name, and Salary. The result can be returned in any order.
## Approach: DENSE_RANK() + JOIN
### SQL Solution
```sql
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
) e
JOIN Department d
ON e.departmentId = d.id
WHERE e.rnk <= 3;
```
## Explanation
### 1. DENSE_RANK()
```sql
DENSE_RANK() OVER (
    PARTITION BY departmentId
    ORDER BY salary DESC
)
```
- DENSE_RANK() assigns a rank to each employee based on their salary.
- PARTITION BY departmentId divides employees into separate departments.
- ORDER BY salary DESC sorts salaries from highest to lowest.
- Employees with the same salary receive the same rank.
- DENSE_RANK() does not skip ranks when duplicate salaries occur.
### 2. Subquery
```sql
SELECT
    name,
    salary,
    departmentId,
    DENSE_RANK() OVER (
        PARTITION BY departmentId
        ORDER BY salary DESC
    ) AS rnk
FROM Employee
```
The subquery calculates the salary rank of every employee within their respective department and creates a temporary result containing employee details and their ranks.
### 3. JOIN Operation
```sql
JOIN Department d
ON e.departmentId = d.id
```
- Joins the Employee and Department tables.
- Matches departmentId from Employee with id from Department.
- Retrieves the corresponding department name.
### 4. WHERE Condition
```sql
WHERE e.rnk <= 3;
```
- Filters employees whose salary rank is 1, 2, or 3.
- Includes all employees having the same salary rank.
- Excludes employees whose salary rank is greater than 3.
## Example
Consider the IT department with the following salaries:
| Employee | Salary | Rank |
|---|---:|---:|
| Max | 90000 | 1 |
| Joe | 85000 | 2 |
| Randy | 85000 | 2 |
| Will | 70000 | 3 |
| Janet | 69000 | 4 |
The query returns Max, Joe, Randy, and Will because their salaries belong to the top three distinct salary levels.
## Why DENSE_RANK()?
There are three commonly used SQL ranking functions:
| Function | Behaviour |
|---|---|
| ROW_NUMBER() | Assigns a unique sequential number to every row. |
| RANK() | Assigns equal ranks to ties but skips subsequent ranks. |
| DENSE_RANK() | Assigns equal ranks to ties without skipping subsequent ranks. |
DENSE_RANK() is the correct choice because the problem specifically asks for the top three unique salaries. Employees with equal salaries must receive the same rank.
## Complexity Analysis
- Time Complexity: Ranking requires ordering salaries within each department. The actual execution cost depends on the database engine and query optimizer.
- Space Complexity: The window function may require additional memory for sorting and ranking intermediate results. Actual usage depends on the database engine.
## Key SQL Concepts Learned
1. DENSE_RANK() – Assigns ranks without gaps.
2. PARTITION BY – Divides rows into groups for independent ranking.
3. ORDER BY DESC – Sorts salaries in descending order.
4. JOIN – Combines records from related tables.
5. Subquery – Creates an intermediate result for further processing.
6. Window Functions – Perform calculations across related rows without grouping them into a single result row.
## Learning Outcome
Learned how to use DENSE_RANK() with PARTITION BY to identify the top three distinct salaries within each department while handling duplicate salaries correctly.
**Day 17 – LeetCode Database Challenge**
