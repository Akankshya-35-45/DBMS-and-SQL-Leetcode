# Day 18 - LeetCode 577: Employee Bonus
  problem link: https://leetcode.com/problems/employee-bonus/description/

## Problem Description
Write an SQL query to report the name and bonus amount of each employee who satisfies either of the following conditions:
- The employee has a bonus less than 1000.
- The employee did not receive any bonus.
Return the result in any order.

## Approach: LEFT JOIN
Use a LEFT JOIN to combine the Employee and Bonus tables based on their common empId column.
A LEFT JOIN ensures that all employees are included, even if they do not have a corresponding record in the Bonus table. For employees without a bonus record, the bonus column will contain NULL.
Apply a WHERE condition to select employees whose bonus is less than 1000 or whose bonus is NULL.

## SQL Solution
```sql
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000
OR b.bonus IS NULL;
```

## Explanation
1. SELECT e.name, b.bonus: Retrieves the employee's name and corresponding bonus amount.
2. FROM Employee e: Uses the Employee table as the primary table and assigns it the alias e.
3. LEFT JOIN Bonus b: Combines the Employee table with the Bonus table while retaining all employees.
4. ON e.empId = b.empId: Matches employees in both tables using empId.
5. WHERE b.bonus < 1000 OR b.bonus IS NULL: Filters employees whose bonus is less than 1000 or who have not received a bonus.

## Example
### Employee Table
| empId | name | supervisor | salary |
|---|---|---|---|
| 3 | Brad | NULL | 4000 |
| 1 | John | 3 | 1000 |
| 2 | Dan | 3 | 2000 |
| 4 | Thomas | 3 | 4000 |

### Bonus Table
| empId | bonus |
|---|---|
| 2 | 500 |
| 4 | 2000 |

### Output
| name | bonus |
|---|---|
| Brad | NULL |
| John | NULL |
| Dan | 500 |

## Complexity Analysis
- Time Complexity: Depends on the database execution plan. A hash join typically takes O(N + M), where N and M are the number of rows in the Employee and Bonus tables.
- Space Complexity: A hash join may require O(M) auxiliary memory.

## Key Concepts Learned
- LEFT JOIN
- Table Aliases
- WHERE Clause
- NULL Handling using IS NULL
- Joining tables using a common column

## Important Takeaway
LEFT JOIN is useful when we need all records from the left table, even when there is no matching record in the right table.
When checking for missing values in SQL, use IS NULL instead of = NULL.

Problem: LeetCode 577 - Employee Bonus
