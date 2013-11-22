SELECT Interest_Rate, Balance, Withdraws_fee, Num_Free_Withdraws
FROM Account, Cash_Account
WHERE C_ID = ?
    AND Account.A_ID = Cash_Account.A_ID
    
/* Gets cash account info with given customer name. */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Customer, Account, Cash_Account
WHERE First_Name = ? AND Last_Name = ?
    AND Account.A_ID = Cash_Account.A_ID;