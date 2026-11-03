problem link: https://leetcode.com/problems/rising-temperature/

1.
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

2.
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATE_SUB(w2.recordDate, INTERVAL -1 DAY)
WHERE w1.temperature > w2.temperature;

   or
SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

3.Key learnings – Day 6
SELF JOIN: Joining a table with itself.
Aliases: w1 and w2 represent two copies of the same table.
DATEDIFF(): Finds the difference between two dates in days.
DATE_SUB(): Subtracts a specified interval from a date.
WHERE: Filters records based on a condition.
Comparison operator (>): Checks whether today's temperature is higher.
