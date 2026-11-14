# Day 16 – Department Highest Salary (LeetCode 184)
## Problem Statement
Find employees who have the highest salary in each department. If multiple employees share the highest salary in a department, return all of them.
**Problem Link:** https://leetcode.com/problems/department-highest-salary/
**Difficulty:** Medium
**Topics:** SQL, JOIN, GROUP BY, MAX(), Subqueries, CTE
## Tables
**Employee**
| Column | Type |
|---|---|
| id | int |
| name | varchar |
| salary | int |
| departmentId | int |
**Department**
| Column | Type |
|---|---|
| id | int |
| name | varchar |
## Approach 1: Correlated Subquery
### SQL Code
```sql
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
);
```
### Explanation
1. `FROM Employee e`: Selects the Employee table and assigns it the alias `e`.
2. `JOIN Department d`: Joins the Department table to retrieve department names.
3. `ON e.departmentId = d.id`: Matches employees with their respective departments.
4. `SELECT MAX(e2.salary)`: Finds the maximum salary.
5. `WHERE e2.departmentId = e.departmentId`: Calculates the maximum salary within the current employee's department.
6. `WHERE e.salary = (...)`: Returns only employees whose salary equals the maximum salary in their department.
### Complexity
- Time Complexity: Depends on the database optimizer; a naive repeated subquery can be expensive, while an optimized execution plan may avoid repeated scans.
- Space Complexity: Depends on the execution plan and temporary storage used by the database.
## Approach 2: JOIN with GROUP BY Subquery
### SQL Code
```sql
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
JOIN (
    SELECT
        departmentId,
        MAX(salary) AS maxSalary
    FROM Employee
    GROUP BY departmentId
) m
    ON e.departmentId = m.departmentId
    AND e.salary = m.maxSalary;
```
### Explanation
1. The inner query groups employees by `departmentId`.
2. `MAX(salary)` calculates the highest salary in each department.
3. The subquery result is assigned the alias `m`.
4. The first JOIN connects Employee and Department to retrieve department names.
5. The second JOIN matches each employee's department with the corresponding maximum salary.
6. Both department ID and salary must match, ensuring only highest-paid employees are returned.
### Complexity
- Time Complexity: Typically involves aggregation and joining; actual performance depends on indexes and the query execution plan.
- Space Complexity: May require temporary storage for the grouped results and join operations.
## Approach 3: Using CTE (Common Table Expression)
### SQL Code
```sql
WITH DepartmentMaxSalary AS (
    SELECT
        departmentId,
        MAX(salary) AS maxSalary
    FROM Employee
    GROUP BY departmentId
)
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
JOIN DepartmentMaxSalary m
    ON e.departmentId = m.departmentId
    AND e.salary = m.maxSalary;
```
### Explanation
1. `WITH DepartmentMaxSalary AS`: Creates a Common Table Expression (CTE).
2. The CTE groups employees by department and calculates the maximum salary using `MAX()`.
3. The main query joins Employee with Department to retrieve employee and department details.
4. The final JOIN matches employee department IDs and salaries with the CTE results.
5. All employees earning the department's highest salary are returned, including ties.
### Complexity
- Time Complexity: Similar logical aggregation and joining work to Approach 2; actual execution depends on the optimizer.
- Space Complexity: Depends on whether the database materializes the CTE and how it executes the joins.
## Example
**Employee Table**
| id | name | salary | departmentId |
|---|---|---|---|
| 1 | Joe | 70000 | 1 |
| 2 | Jim | 90000 | 1 |
| 3 | Henry | 80000 | 2 |
| 4 | Sam | 60000 | 2 |
| 5 | Max | 90000 | 1 |
**Department Table**
| id | name |
|---|---|
| 1 | IT |
| 2 | Sales |
**Output**
| Department | Employee | Salary |
|---|---|---|
| IT | Jim | 90000 |
| IT | Max | 90000 |
| Sales | Henry | 80000 |
## Important SQL Concepts
- `MAX()`: Returns the maximum value from a column.
- `GROUP BY`: Groups rows based on a specified column.
- `JOIN`: Combines records from multiple tables using related columns.
- `Subquery`: A query nested inside another query.
- `CTE`: A named temporary result defined using the `WITH` keyword.
- `Table Alias`: Provides a shorter name for a table.
## Key Learning
- Learned how to find the highest salary department-wise using `GROUP BY` and `MAX()`.
- Understood how to retrieve employee details corresponding to aggregate results using JOIN.
- Practiced correlated subqueries and CTEs.
- Learned how to handle multiple employees sharing the same highest salary.
- Understood the difference between finding a maximum value and retrieving the complete records associated with it.
## Conclusion
Solved LeetCode 184 – Department Highest Salary as part of the 365 Days of LeetCode Database Challenge. Practiced three SQL approaches using correlated subqueries, JOIN with GROUP BY, and
