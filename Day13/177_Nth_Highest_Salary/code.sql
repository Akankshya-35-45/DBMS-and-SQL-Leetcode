# Day 13 – LeetCode SQL: Nth Highest Salary 🚀

Problem: [177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)

Difficulty: Medium  
Language: MySQL

## 📌 Problem Overview

The task is to find the Nth highest DISTINCT salary from the Employee table.

If there are fewer than N distinct salaries, the function should return NULL.

## 💻 SQL Solution

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE offset_val INT;
    SET offset_val = N - 1;

    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT offset_val, 1
    );
END
```

## 🔍 Approach & Code Explanation

1. DECLARE offset_val INT

   Declares a local integer variable named `offset_val` inside the function. This variable stores the number of rows to skip.

2. SET offset_val = N - 1

   Calculates the offset by subtracting 1 from N.

   Since SQL OFFSET starts counting from zero, the offset for the Nth highest salary is N-1.

3. SELECT DISTINCT salary

   Retrieves unique salary values and eliminates duplicates because the problem asks for the Nth highest DISTINCT salary.

4. FROM Employee

   Specifies the Employee table from which salaries are retrieved.

5. ORDER BY salary DESC

   Sorts salaries in descending order, placing the highest salary first.

6. LIMIT offset_val, 1

   Uses the calculated offset to skip the required number of rows and retrieves exactly one salary.

   Syntax: `LIMIT offset, count`

   - offset: Number of rows to skip.
   - count: Number of rows to retrieve.

7. RETURN

   Returns the salary obtained from the query. If the requested salary does not exist, the scalar subquery returns NULL.

## 🧪 Dry Run

Example:

Employee table:

| id | salary |
|---|---|
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |

Given: N = 2

Step 1: Calculate the offset.

`offset_val = N - 1 = 2 - 1 = 1`

Step 2: Retrieve distinct salaries.

`100, 200, 300`

Step 3: Sort in descending order.

`300, 200, 100`

Step 4: Apply LIMIT.

`LIMIT 1, 1`

- Skip the first row (300).
- Retrieve one row (200).

Output: 200

## 📚 Key Concepts Learned

1. DECLARE – Creates a local variable inside a stored function.
2. SET – Assigns a value to a variable.
3. DISTINCT – Removes duplicate values.
4. ORDER BY DESC – Sorts values from highest to lowest.
5. LIMIT – Restricts the number of rows returned.
6. OFFSET – Skips a specified number of rows.
7. Scalar Subqueries – Return a single value and produce NULL when no row is found.

## 💡 Important Takeaways

- Always check whether the problem requires distinct values before applying sorting.
- OFFSET starts counting from zero, so the offset for the Nth position is N-1.
- LIMIT offset, count helps retrieve a specific position from sorted results.
- Local variables can be used to store calculated values inside stored functions.
- DECLARE and SET help separate calculations from query execution.
- A scalar subquery returning no rows evaluates to NULL.
- Understanding LIMIT, OFFSET, and ranking functions is important for SQL interviews.

## ⚙️ Important Learning: MySQL Syntax

Initially, using `LIMIT N-1, 1` directly caused a syntax error in the function.

To resolve this, the calculation was separated into two steps:

- Calculate `N-1` using a local variable.
- Use that variable inside the LIMIT clause.

This made the query compatible with the MySQL syntax used by LeetCode.

## 🎯 Today's Biggest Learning
Calculate the offset → Remove duplicates → Sort salaries → Skip N-1 rows → Retrieve the Nth highest salary.
Another day of strengthening SQL fundamentals and improving problem-solving skills through the 365 Days of LeetCode Database Challenge! 🚀

#365DaysOfSQL #LeetCode #SQL #MySQL #Database #ProblemSolving #LearningInPublic
