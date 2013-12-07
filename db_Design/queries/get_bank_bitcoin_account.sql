SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Bank, Account, Bitcoin_Account
WHERE Bank.B_ID = 1
    AND Account.A_ID = Bitcoin_Account.A_ID
    AND Bank.B_ID = Account.B_ID;
/* Expected Results
+---------------+---------+-------------+----------------+
| Interest_Rate | Balance | Wallet_Type | Processing_Fee |
+---------------+---------+-------------+----------------+
|          1.15 |     100 | 10          |              3 |
+---------------+---------+-------------+----------------+
1 row in set (0.00 sec)
*/
    
/* Gets bitcoin account info with given customer name. */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Bank, Account, Bitcoin_Account
WHERE Name = "Bank of Bitcoins"
    AND Account.B_ID = Bank.B_ID
    AND Account.A_ID = Bitcoin_Account.A_ID;
/* Expected Results
+---------------+---------+-------------+----------------+
| Interest_Rate | Balance | Wallet_Type | Processing_Fee |
+---------------+---------+-------------+----------------+
|          1.15 |     100 | 10          |              3 |
+---------------+---------+-------------+----------------+
1 row in set (0.00 sec)
*/