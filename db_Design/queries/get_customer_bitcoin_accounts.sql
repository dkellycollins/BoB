/* These queries showcase how we can get specific information for Bitcoin accounts.
    In the first query 4 is the Id parameter.
    In the second query "Billard" is the First_Name parameter and "Job" is the last name parameter.
*/

/* Gets bitcoin account info with given customer id */
SELECT Account.A_ID, Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Account, Bitcoin_Account
WHERE Account.C_ID = 4
    AND Account.A_ID = Bitcoin_Account.A_ID;
/* Expected Result
+------+---------------+---------+-------------+----------------+
| A_ID | Interest_Rate | Balance | Wallet_Type | Processing_Fee |
+------+---------------+---------+-------------+----------------+
|    2 |          0.03 |       5 | 2           |             10 |
+------+---------------+---------+-------------+----------------+
1 row in set (0.00 sec)
*/
    
/* Gets bitcoin account info with given customer name. */
SELECT Account.A_ID, Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Customer, Account, Bitcoin_Account
WHERE First_Name = "Billard" AND Last_Name = "Job"
    AND Account.A_ID = Bitcoin_Account.A_ID
    AND Customer.C_ID = Account.C_ID;
/* Expected Result
+------+---------------+---------+-------------+----------------+
| A_ID | Interest_Rate | Balance | Wallet_Type | Processing_Fee |
+------+---------------+---------+-------------+----------------+
|    2 |          0.03 |       5 | 2           |             10 |
+------+---------------+---------+-------------+----------------+
1 row in set (0.00 sec)
*/