/* Showcases queries that can be used to get a list of all account for a user.
    In the first query 1 is the Id parameter.
    In the second query "Bob" is the first name parameter and "Parker" last_name.
*/

SELECT A_ID, Balance, Interest_Rate
FROM Account
WHERE C_ID = 1;
/* Expected Result
+------+---------+---------------+
| A_ID | Balance | Interest_Rate |
+------+---------+---------------+
|    7 |       5 |          0.03 |
+------+---------+---------------+
1 row in set (0.04 sec)
*/

SELECT A_ID, Balance, Interest_Rate
FROM Account A, Customer C
WHERE C.First_Name = "Bob" AND C.Last_Name = "Parker"
    AND A.C_ID = C.C_ID;
/* Expected Result
+------+---------+---------------+
| A_ID | Balance | Interest_Rate |
+------+---------+---------------+
|    7 |       5 |          0.03 |
+------+---------+---------------+
1 row in set (0.03 sec)
*/