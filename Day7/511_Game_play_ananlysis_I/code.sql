1. problem link: https://leetcode.com/problems/game-play-analysis-i/
2.Solution:
SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

3.What you learned today
- MIN() – Finds the earliest date.
- GROUP BY – Groups records by player.
- AS – Gives a column an alias.
- Aggregate functions – Perform calculations over groups of rows.

4. Day 7 takeaway: Whenever a question asks for the earliest date for each person, employee, player, or customer, think:
GROUP BY + MIN()
