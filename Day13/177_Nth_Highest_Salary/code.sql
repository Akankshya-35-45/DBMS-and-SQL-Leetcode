# Day 13 – LeetCode SQL: Nth Highest Salary 🚀
Problem: [177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)

Difficulty: Medium  
Language: MySQL

## 📌 Problem Overview
The task is to find the Nth highest DISTINCT salary from the Employee table.
If the Nth highest salary does not exist, the result should be NULL.

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

## 🔍 Approach & Query Explanation

1. DISTINCT – Removes duplicate salary values to ensure that only unique salaries are considered.
2. ORDER BY DESC – Sorts salaries in descending order, placing the highest salary first.
3. LIMIT – Retrieves the required salary using offset and count.
4. N-1 – Calculates the offset because SQL OFFSET starts counting from zero.
5. Count = 1 – Retrieves only one salary after skipping the required number of rows.

## 📚 Key Concepts Learned

- DISTINCT – Eliminates duplicate values.
- ORDER BY – Sorts records in ascending or descending order.
- DESC – Arranges values from highest to lowest.
- LIMIT – Restricts the number of rows returned.
- OFFSET – Skips a specified number of rows.
- Scalar Subqueries – Help return a single value and produce NULL when no row is found.

## 💡 Important Takeaways

- Always check whether the problem requires distinct values before applying sorting.
- LIMIT offset, count helps retrieve specific positions from sorted results.
- SQL OFFSET starts from zero, so the offset for the Nth position is N-1.
- Duplicate values can affect ranking if DISTINCT is not used.
- A scalar subquery returning no rows evaluates to NULL.
- Understanding the difference between LIMIT, OFFSET, and ranking functions is important for SQL interviews.

## 🎯 Today's Biggest Learning

Remove duplicates → Sort salaries → Skip N-1 rows → Retrieve the Nth highest salary.
Another day of strengthening SQL fundamentals and improving problem-solving skills through the 365 Days of LeetCode Database Challenge! 🚀
 #LeetCode #SQL #MySQL #Database #ProblemSolving #LearningInPublic
