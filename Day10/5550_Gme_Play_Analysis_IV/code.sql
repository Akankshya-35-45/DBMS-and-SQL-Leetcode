1.solution:
SELECT
ROUND(
    COUNT(DISTINCT a.player_id)*1.0/
    (SELECT COUNT(DISTINCT player_id)
    FROM Activity),2)
    AS fraction
    FROM Activity AS a
    JOIN(
    SELECT
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id)
AS f
ON a.player_id=f.player_id
AND a.event_date= DATE_ADD(f.first_login,INTERVAL 1 DAY);


2. Day 10 – LeetCode SQL: Key Learnings & Takeaways 🚀
Problem: 550. Game Play Analysis IV
Key concepts learned
1. MIN() – Finds the earliest login date of each player.
2. GROUP BY – Groups records player-wise to calculate individual first login dates.
3. Subqueries – Helps create an intermediate result containing each player's first login.
4. JOIN – Matches players from the original table with their first login records.
5. DATE_ADD() – Adds one day to the first login date to check next-day activity.
6. COUNT(DISTINCT) – Counts unique players without duplicates.
7. ROUND() – Rounds the final fraction to two decimal places.
8. * 1.0 – Ensures decimal division instead of integer division.
  
Important takeaways
- Always identify the first occurrence before checking subsequent events.
- The next login is not necessarily the next-day login.
- Date arithmetic is extremely useful for time-based SQL problems.
- JOIN can be used to verify whether an expected record exists.
- Understand the difference between counting rows and counting distinct entities.
- Break complex SQL queries into smaller subqueries to understand their execution.
Today's biggest learning
Find the first login → Calculate the next date → Verify the login → Calculate the fraction.
