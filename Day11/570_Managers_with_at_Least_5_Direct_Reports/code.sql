1.problem link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/

2.Solution:
(a)SELECT m.name
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;


(b)(using Subquery):
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);


3.Time and space complexity
Let N be the number of rows in the Employee table.
Complexity	Analysis
Time	Typically O(N) expected for a hash-based join and grouping
Space	O(N) for intermediate join/grouping data

Actual execution depends on the database optimizer, indexes, and execution plan.

4.Key SQL concepts learned today

SELF JOIN- Joining a table with itself
Aliases-	Using e and m for the same table
GROUP BY-Grouping employees by manager
COUNT()-	Counting direct reports
HAVING-	Filtering grouped results
Subquery	-Finding qualifying manager IDs first
NULL- Excluding employees without managers

5.Day 11 – Key learnings and takeaways
Today's biggest learning was understanding how a single table can represent two different roles using SELF JOIN.
- Learned how to perform a SELF JOIN.
- Understood the relationship between employees and managers.
- Practised grouping records using GROUP BY.
- Understood the difference between WHERE and HAVING.
- Learned how to count direct reports using COUNT().
- Explored both SELF JOIN and subquery approaches.
Today's important takeaway:
WHERE filters rows, GROUP BY creates groups, and HAVING filters those groups.
