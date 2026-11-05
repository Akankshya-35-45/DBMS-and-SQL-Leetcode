1.problem link: https://leetcode.com/problems/game-play-analysis-ii/
    https://leetcode.ca/all/512.html

2. Solution:
SELECT
    a.player_id,
    a.device_id
FROM Activity a
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) b
ON a.player_id = b.player_id
AND a.event_date = b.first_login;


3.Time and Space Complexity
For SQL queries, actual performance depends on the database engine, indexes and execution plan.
- GROUP BY calculates the minimum date per player.
- JOIN matches the original records with those dates.
- The query may require scanning and grouping the Activity table.
We generally describe the approach as requiring processing of the table's records, with grouping and join overhead.

4.Day 8 – Key Learnings | LeetCode 512: Game Play Analysis II
1. MIN() – Finds the earliest login date for each player.
2. GROUP BY – Groups records belonging to the same player_id.
3. Subqueries – Allow us to calculate the first login date separately.
4. JOIN – Combines the original table with the subquery result.
5. Table Aliases (a, b) – Make SQL queries shorter and easier to read.
6. Multiple JOIN conditions (AND) – Match both the player ID and the first login date.
7. Aggregation vs. Original Data – Aggregate functions help calculate values, while JOIN helps retrieve other columns associated with those values.
Most important takeaway:

When you need to find a specific record based on an aggregate value (like the earliest date), calculate that value first and JOIN it back to the original table to retrieve the remaining details.
