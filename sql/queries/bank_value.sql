/* A query to find the value of all the account's in a bank, give a bank's B_ID*/
SELECT SUM(a.Balance)
FROM Account a
WHERE a.B_ID = 1;
/* Expected Result
+----------------+
| SUM(a.Balance) |
+----------------+
|              5 |
+----------------+
1 row in set (0.01 sec)
*/

/* A query to find the value of all the account's in a bank given a bank's name*/
SELECT SUM(a.Balance)
FROM Account a, Bank b
WHERE b.Name = 'Bank of Bitcoins' AND b.B_ID = a.B_ID
/* Expected Result
+----------------+
| SUM(a.Balance) |
+----------------+
|              5 |
+----------------+
1 row in set (0.00 sec)
*/
