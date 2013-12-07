/* These queries showcase how we can get specific information for Cash accounts.
    In the first query 4 is the Id parameter.
    In the second query "Billard" is the First_Name parameter and "Job" is the last name parameter.
*/

SELECT Account.A_ID, Interest_Rate, Balance, Withdraw_fee, Num_Free_Withdraws
FROM Account, Cash_Account
WHERE C_ID = 4
    AND Account.A_ID = Cash_Account.A_ID;
/* Expected Result
+------+---------------+---------+--------------+--------------------+
| A_ID | Interest_Rate | Balance | Withdraw_fee | Num_Free_Withdraws |
+------+---------------+---------+--------------+--------------------+
|    1 |          0.02 |       5 |           10 |                  5 |
+------+---------------+---------+--------------+--------------------+
1 row in set (0.00 sec)
*/
    
/* Gets cash account info with given customer name. */
SELECT Account.A_ID, Interest_Rate, Balance, Withdraw_fee, Num_Free_Withdraws
FROM Customer, Account, Cash_Account
WHERE First_Name = "Billard" AND Last_Name = "Job"
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.C_ID = Customer.C_ID;
/* Expected Result
+------+---------------+---------+--------------+--------------------+
| A_ID | Interest_Rate | Balance | Withdraw_fee | Num_Free_Withdraws |
+------+---------------+---------+--------------+--------------------+
|    1 |          0.02 |       5 |           10 |                  5 |
+------+---------------+---------+--------------+--------------------+
3 rows in set (0.00 sec)
*/