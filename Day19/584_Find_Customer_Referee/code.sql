# Day 19 – LeetCode 584: Find Customer Referee

## Problem
- **Platform:** LeetCode
- **Problem Number:** 584
- **Difficulty:** Easy
- **Topic:** SQL, Filtering, WHERE Clause, NULL Handling

## Problem Statement
Find the names of customers who were either:
1. Not referred by the customer with `id = 2`.
2. Not referred by any customer (`referee_id IS NULL`).

Return the result in any order.

## Table Structure

**Customer**

| Column Name | Type |
|---|---|
| id | int |
| name | varchar |
| referee_id | int |

## SQL Solution

```sql
SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
```

## Approach: Filtering Using WHERE and OR

1. Use `SELECT name` to retrieve only the customer names.
2. Use `FROM Customer` to access the Customer table.
3. Apply `referee_id != 2` to exclude customers referred by customer ID 2.
4. Apply `referee_id IS NULL` to include customers who have no referee.
5. Use `OR` because satisfying either condition is sufficient.

## Example

**Input:**

| id | name | referee_id |
|---|---|---|
| 1 | Will | NULL |
| 2 | Jane | NULL |
| 3 | Alex | 2 |
| 4 | Bill | NULL |
| 5 | Zack | 1 |
| 6 | Mark | 2 |

**Output:**

| name |
|---|
| Will |
| Jane |
| Bill |
| Zack |

## Complexity Analysis

- **Time Complexity:** O(N) – The query scans the Customer table to evaluate the filtering conditions.
- **Auxiliary Space Complexity:** O(1), excluding the space required to store the output.

## SQL Concepts Learned

1. `SELECT` – Retrieves specific columns from a table.
2. `FROM` – Specifies the table from which data is retrieved.
3. `WHERE` – Filters rows based on specified conditions.
4. `!=` – Checks whether two values are not equal.
5. `IS NULL` – Checks whether a column contains a NULL value.
6. `OR` – Returns rows when at least one condition is satisfied.

## Important Learning: NULL Handling

SQL uses three-valued logic: TRUE, FALSE, and UNKNOWN.

- `referee_id != 2` does not return TRUE when `referee_id` is NULL.
- Therefore, `IS NULL` is necessary to include customers without a referee.
- Always use `IS NULL` instead of `= NULL` when checking for NULL values.

## Key Takeaway

This problem demonstrates how to combine multiple filtering conditions using `OR` and handle NULL values correctly in SQL.

**Day 19/365 – Database Challenge Completed!**
