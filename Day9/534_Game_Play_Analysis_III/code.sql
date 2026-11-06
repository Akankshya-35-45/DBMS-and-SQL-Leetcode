1.problem link: https://leetcode.ca/all/534.html
                https://leetcode.com/problems/game-play-analysis-iii/

2. solution:
(a)using WINDOW function:
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER (
        PARTITION BY player_id
        ORDER BY event_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS games_played_so_far
FROM Activity;

(b) without WINDOW function using a correlated subquery:
SELECT
    a.player_id,
    a.event_date,
    (
        SELECT SUM(b.games_played)
        FROM Activity b
        WHERE b.player_id = a.player_id
          AND b.event_date <= a.event_date
    ) AS games_played_so_far
FROM Activity a;

3.Time and space complexity (conceptual):
- Window-function approach: typically \(O(n\log n)\) when sorting is required, with \(O(n)\) intermediate storage possible.
- Exact performance depends on indexes and the database execution plan.


4.Day 9 — Key Learnings for your notes
1. Learned about SQL Window Functions.
2. Understood the difference between GROUP BY and PARTITION BY.
3. Learned how to calculate a cumulative sum using SUM() OVER().
4. Understood how ORDER BY controls the order of window calculations.
5. Learned how ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW defines a running window.
6. Solved a running-total problem using a correlated subquery as an alternative.
Today's biggest takeaway: Whenever a SQL question asks for a running total, cumulative sum, or total so far, think about SUM() OVER(PARTITION BY ... ORDER BY ...).
