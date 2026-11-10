# Day 12 – LeetCode 176: Second Highest Salary

**Difficulty:** Medium

**Concepts:** Aggregate Functions, Subqueries, DISTINCT, ORDER BY, LIMIT, OFFSET.

### Approach 1: MAX() + Subquery
- Find the highest salary using `MAX()`.
- Use a subquery to identify the maximum salary.
- Filter salaries smaller than the highest salary.
- Apply `MAX()` again to find the second-highest salary.
- Automatically handles the absence of a second-highest salary using `NULL`.
CREATE FUNCTION getSecondHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        SELECT MAX(salary)
        FROM Employee
        WHERE salary < (SELECT MAX(salary) FROM Employee)
    );
END

### Approach 2: DISTINCT + ORDER BY + LIMIT + OFFSET
- Use `DISTINCT` to eliminate duplicate salaries.
- Sort salaries in descending order using `ORDER BY`.
- Use `OFFSET 1` to skip the highest salary.
- Use `LIMIT 1` to retrieve the second-highest salary.
CREATE FUNCTION getSecondHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    );
END

  

### Key Takeaways
1. Understand the importance of finding the second-highest **distinct** value.
2. Learned how to use nested subqueries with aggregate functions.
3. Understood the difference between `LIMIT` and `OFFSET`.
4. Learned that `MAX()` returns `NULL` when no qualifying values exist.
5. Practiced two different approaches to solve the same SQL problem.

**Most important lesson:** Always consider duplicate values and edge cases while writing SQL queries.
