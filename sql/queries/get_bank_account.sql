/* Get the total balance in each that the bank owns. */
SELECT A_ID, Balance, Interest_Rate
FROM Account
WHERE B_ID = 1;
/* Expected Results
+------+---------+---------------+
| A_ID | Balance | Interest_Rate |
+------+---------+---------------+
|    1 |       5 |          0.02 |
|    8 |     100 |          1.15 |
+------+---------+---------------+
2 rows in set (0.00 sec)
*/

SELECT A_ID, Balance, Interest_Rate
FROM Account A, Bank B
WHERE B.Name = "Bank of Bitcoins"
    AND A.B_ID = B.B_ID;
/* Expected Results
+------+---------+---------------+
| A_ID | Balance | Interest_Rate |
+------+---------+---------------+
|    1 |       5 |          0.02 |
|    8 |     100 |          1.15 |
+------+---------+---------------+
2 rows in set (0.01 sec)
*/