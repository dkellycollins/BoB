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

/* Display all accounts for a bank and the customer they belong to. */
SELECT A_ID, Balance, CONCAT(First_Name, " ", Last_Name) AS Customer, Name AS Bank
FROM Account A, Bank B, Customer C
WHERE B.Name= "Bank of Bitcoins"
    AND A.B_ID = B.B_ID
    AND C.C_ID = A.C_ID
ORDER BY C.Last_Name;
/* Expected Results
+------+---------+-------------+------------------+
| A_ID | Balance | Customer    | Bank             |
+------+---------+-------------+------------------+
|    1 |       5 | Billard Job | Bank of Bitcoins |
|    8 |     100 | Bob Parker  | Bank of Bitcoins |
+------+---------+-------------+------------------+
2 rows in set (0.00 sec)
*/