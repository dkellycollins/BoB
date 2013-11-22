/* Gets cash account info with given id. */
SELECT Interest_Rate, Balance, Withdraws_fee, Num_Free_Withdraws
FROM Bank, Acount, Cash_Account
WHERE Bank.B_ID = 1
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.B_ID = Bank.B_ID;
    
/* Gets cash account info with given customer name. */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Bank, Account, Cash_Account
WHERE Name = "Bank of Bitcoin"
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.B_ID = Bank.B_ID;