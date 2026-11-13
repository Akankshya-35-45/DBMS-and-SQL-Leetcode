# Day 15 – Consecutive Numbers (LeetCode 180)

## Problem Statement
Given a table `Logs` containing two columns, `id` and `num`, find all numbers that appear at least three times consecutively.

Return the result in a column named `ConsecutiveNums`.

Problem Link: https://leetcode.com/problems/consecutive-numbers/

Difficulty: Medium  
Topic: Database, SQL, Self JOIN

## Table Structure

| Column | Type |
|---|---|
| id | int |
| num | int |

The `id` column is the primary key, and each row represents a number recorded at a particular ID.

## Example

Input:

| id | num |
|---|---|
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |
| 4 | 2 |
| 5 | 1 |
| 6 | 2 |
| 7 | 2 |

Output:

| ConsecutiveNums |
|---|
| 1 |

Explanation:

The number 1 appears consecutively at IDs 1, 2, and 3.

The number 2 does not appear three times consecutively. Therefore, the output contains only 1.

## Approach: Self JOIN

We use Self JOIN to compare three consecutive rows from the same table.

The table is joined with itself three times using three different aliases: `l1`, `l2`, and `l3`.

### SQL Solution

```sql
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2
    ON l1.id = l2.id - 1
JOIN Logs l3
    ON l2.id = l3.id - 1
WHERE l1.num = l2.num
AND l2.num = l3.num;
```

## Code Explanation

1. `SELECT DISTINCT l1.num AS ConsecutiveNums`

   Selects the number that appears consecutively and removes duplicate results.

2. `FROM Logs l1`

   Uses the Logs table with the alias `l1`.

3. `JOIN Logs l2 ON l1.id = l2.id - 1`

   Joins the table with itself and ensures that `l2` represents the row immediately after `l1`.

4. `JOIN Logs l3 ON l2.id = l3.id - 1`

   Ensures that `l3` represents the row immediately after `l2`.

5. `WHERE l1.num = l2.num`

   Checks whether the first and second numbers are equal.

6. `AND l2.num = l3.num`

   Checks whether the second and third numbers are equal.

   Both conditions together ensure that all three consecutive rows contain the same number.

## Dry Run

For the input:

| id | num |
|---|---|
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |

The Self JOIN produces a matching combination:

| l1.id | l2.id | l3.id | l1.num | l2.num | l3.num |
|---|---|---|---|---|---|
| 1 | 2 | 3 | 1 | 1 | 1 |

Since all three numbers are equal, the number 1 satisfies the condition.

Therefore, the final output is:

| ConsecutiveNums |
|---|
| 1 |

## Why Use DISTINCT?

A number may appear in more than three consecutive rows.

For example, if 5 appears at IDs 1, 2, 3, and 4, the joins can generate multiple matching combinations:

- IDs 1, 2, 3
- IDs 2, 3, 4

Both combinations produce the number 5.

`DISTINCT` ensures that the number appears only once in the final result.

## Complexity Analysis

- Time Complexity: Approximately O(n³) for a straightforward nested-loop join model; actual performance depends on the database engine, indexes, and query optimizer.
- Space Complexity: Depends on the execution plan and intermediate join results.

## Key Learnings

- Understanding Self JOIN and how to join a table with itself.
- Using multiple aliases to compare different rows.
- Identifying consecutive records using ID differences.
- Applying multiple conditions to validate matching values.
- Using DISTINCT to eliminate duplicate results.

## Concepts Practiced

- Self JOIN
- Table Aliases
- WHERE Clause
- DISTINCT
- Consecutive Row Comparison

---

Day 15 of 365 Days of LeetCode Database Challenge.

Consistency is the key to mastering SQL, one problem at a time!
