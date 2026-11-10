# Day 13 – LeetCode SQL: Nth Highest Salary 🚀

**Problem:** [177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)

**Difficulty:** Medium  
**Language:** MySQL

## 📌 Problem Overview

The task is to find the Nth highest **distinct salary** from the Employee table.

If the Nth highest salary does not exist, the result should be `NULL`.

## 💻 SQL Solution

```sql
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT N-1, 1;
```

## 🔍 Approach & Query Explanation

1. **SELECT DISTINCT:** Retrieves unique salary values and eliminates duplicates.
2. **FROM Employee:** Specifies the table from which salary records are retrieved.
3. **ORDER BY salary DESC:** Sorts salaries in descending order, placing the highest salary first.
4. **LIMIT N-1, 1:** Skips the first N-1 rows and retrieves exactly one row.
   - `N-1` represents the offset (number of rows to skip).
   - `1` represents the number of rows to retrieve.

## 📚 Key Concepts Learned

- `DISTINCT` – Removes duplicate values from query results.
- `ORDER BY` – Sorts records in ascending or descending order.
- `DESC` – Arranges values from highest to lowest.
- `LIMIT` – Restricts the number of rows returned.
- **OFFSET** – Skips a specified number of rows before retrieving results.

## 💡 Important Takeaways

- Always use `DISTINCT` when a problem specifically asks for distinct values.
- Sorting in descending order helps identify the highest values.
- SQL OFFSET starts from zero, which is why we use `N-1`.
- `LIMIT offset, count` allows us to retrieve a specific row from sorted results.
- When the requested salary does not exist, the scalar subquery returns `NULL`.
- Understanding the difference between row positions and distinct rankings is important in SQL problems.

## 🎯 Today's Biggest Learning

**Remove duplicates → Sort salaries in descending order → Skip N-1 rows → Retrieve the Nth highest salary.**

Another day of learning SQL, strengthening database concepts, and building consistency through the 365 Days of LeetCode Database Challenge! 🚀

**#365DaysOfSQL #LeetCode #SQL #MySQL #Database #LearningInPublic**
