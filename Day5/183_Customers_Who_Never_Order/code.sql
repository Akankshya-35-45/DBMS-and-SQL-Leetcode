1.problem link: https://leetcode.com/problems/customers-who-never-order/description/

2.Solution:-
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

3. Explanation:
Line 1:
DELETE p1
We are telling SQL that we want to delete rows from p1.
Remember, p1 is just another name for the Person table.

Line 2:
FROM Person p1
We are using the Person table and giving it the temporary name p1.

Line 3:
JOIN Person p2
We are joining the same Person table again, but this time calling it p2.
Now we have two references to the same table:
- p1 → First reference.
- p2 → Second reference.
Line 4:
ON p1.email = p2.email
This checks whether the email addresses in both references are the same.

For example:
p1.id	p1.email	p2.id	p2.email
1	john@example.com	3	john@example.com
The emails match!
  
Line 5:
AND p1.id > p2.id;
This is the MOST IMPORTANT condition.
It checks whether the ID of p1 is greater than the ID of p2.
Why?
Because we want to delete the row with the bigger ID and retain the smaller ID.
  
For example:
p1.id	p2.id	Condition
1	3	1 > 3 ❌
3	1	3 > 1 ✅
When the condition is true, SQL deletes the p1 row.
Therefore, ID 3 gets deleted, and ID 1 remains!

4. Dry run – Let's understand with an example
Initially:
id	email
1	john@example.com
2	bob@example.com
3	john@example.com
4	bob@example.com
5	alice@example.com

Let's compare duplicate emails.

First: john@example.com
p1.id	p2.id	p1.id > p2.id
1	3	False
3	1	True

Delete ID 3.
Second: bob@example.com
p1.id	p2.id	p1.id > p2.id
2	4	False
4	2	True

Delete ID 4.
Third: alice@example.com

There is no duplicate, so nothing gets deleted.

FINAL OUTPUT
id	email
1	 john@example.com
2	 bob@example.com
5	 alice@example.com

That's it! We have successfully removed duplicate emails.

5. Why does this approach work?
Remember this simple rule:
- Same email + bigger ID = DELETE.
- Same email + smaller ID = KEEP.
- Unique email = KEEP.
The condition:
p1.email = p2.email
AND p1.id > p2.id - ensures that only duplicate rows with larger IDs are deleted.
Even if an email appears 5 times, all rows except the one with the smallest ID will be deleted.

  
6. Time and Space Complexity
For the self-join approach:
- Time Complexity: Conceptually, comparing rows through a join can take \(O(n^2)\) without useful indexing. Actual performance depends on the database optimizer and indexes.
- Auxiliary Space: Depends on the execution plan and join strategy; the query itself doesn't create a separate permanent table.

  
7. Key learnings from Day 5
1. DELETE removes existing records from a table.
2. SELF JOIN allows us to compare rows within the same table.
3. Aliases like p1 and p2 help us refer to the same table twice.
4. WHERE and ON conditions determine which records match and which records get deleted.
5. p1.id > p2.id helps retain the record with the smallest ID.
6.A primary key uniquely identifies each row, even when other column values are repeated.
