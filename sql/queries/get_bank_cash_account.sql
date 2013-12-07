/* Gets cash account info with given id. */
SELECT Interest_Rate, Balance, Withdraw_fee, Num_Free_Withdraws
FROM Bank, Account, Cash_Account
WHERE Bank.B_ID = 1
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.B_ID = Bank.B_ID;
/*Expected Result
+---------------+---------+--------------+--------------------+
| Interest_Rate | Balance | Withdraw_fee | Num_Free_Withdraws |
+---------------+---------+--------------+--------------------+
|          0.02 |       5 |           10 |                  5 |
+---------------+---------+--------------+--------------------+
1 row in set (0.00 sec)
*/
    
/* Gets cash account info with bank name. */
SELECT Interest_Rate, Balance, Withdraw_fee, Num_Free_Withdraws
FROM Bank, Account, Cash_Account
WHERE Name = "Bank of Bitcoins"
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.B_ID = Bank.B_ID;
/* Expected Result
+---------------+---------+--------------+--------------------+
| Interest_Rate | Balance | Withdraw_fee | Num_Free_Withdraws |
+---------------+---------+--------------+--------------------+
|          0.02 |       5 |           10 |                  5 |
+---------------+---------+--------------+--------------------+
1 row in set (0.00 sec)
*/