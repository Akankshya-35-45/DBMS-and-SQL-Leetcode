# Day 14 – Rank Scores (LeetCode 178)
## Problem Statement
Write a solution to find the rank of each score in the Scores table. The ranking should follow these rules:
- Scores are ranked from highest to lowest.
- Equal scores receive the same rank.
- After a tie, the next rank must be the next consecutive integer (no gaps).
- Return the result ordered by score in descending order.
**Problem Link:** https://leetcode.com/problems/rank-scores/
**Difficulty:** Medium
**Topic:** SQL, Window Functions, DENSE_RANK(), Subqueries
## Table Schema
**Scores**
| Column | Type |
|---|---|
| id | int |
| score | decimal |
## Approach 1 – Using DENSE_RANK()
### SQL Query
```sql
SELECT
    score,
    DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS `rank`
FROM Scores
ORDER BY score DESC;
```
### Explanation
- `DENSE_RANK()` assigns ranks to scores without leaving gaps.
- `OVER()` defines the window for ranking.
- `ORDER BY score DESC` inside `OVER()` ranks scores from highest to lowest.
- `AS rank` assigns the output column name.
- `FROM Scores` retrieves records from the Scores table.
- The final `ORDER BY score DESC` sorts the result in descending order.
### Key Concept
`DENSE_RANK()` assigns the same rank to duplicate values and does not skip ranks after ties.
## Approach 2 – Using a Correlated Subquery
### SQL Query
```sql
SELECT
    s1.score,
    (
        SELECT COUNT(DISTINCT s2.score)
        FROM Scores s2
        WHERE s2.score > s1.score
    ) + 1 AS `rank`
FROM Scores s1
ORDER BY s1.score DESC;
```
### Explanation
- `s1` represents the current score being ranked.
- `s2` represents the Scores table used for comparison.
- `WHERE s2.score > s1.score` finds scores greater than the current score.
- `COUNT(DISTINCT s2.score)` counts only unique higher scores.
- `+ 1` calculates the final rank.
- `ORDER BY s1.score DESC` sorts the results from highest to lowest.
### Key Concept
The rank of a score is equal to the number of distinct scores greater than it, plus one.
## Difference Between Ranking Functions
| Function | Behaviour |
|---|---|
| ROW_NUMBER() | Assigns a unique number to every row |
| RANK() | Assigns the same rank to ties but skips subsequent ranks |
| DENSE_RANK() | Assigns the same rank to ties without skipping ranks |
## Complexity Analysis
**Approach 1 – DENSE_RANK()**
- Time Complexity: O(n log n), typically dominated by sorting.
- Space Complexity: O(n) in a typical sorting/window execution.
**Approach 2 – Correlated Subquery**
- Time Complexity: Typically O(n²) in a straightforward execution.
- Space Complexity: Depends on the execution plan and indexing.
## Key Learnings
- Understanding SQL window functions.
- Difference between ROW_NUMBER(), RANK(), and DENSE_RANK().
- Using OVER() with ORDER BY.
- Understanding ascending and descending order.
- Handling duplicate values while ranking.
- Using COUNT(DISTINCT) in correlated subqueries.
## Conclusion
Today's problem helped me understand SQL ranking functions and how DENSE_RANK() handles duplicate scores without leaving gaps in rankings. I also explored an alternative solution using correlated subqueries.
**Day 14 of 365 Days of Database Challenge – Completed!**
