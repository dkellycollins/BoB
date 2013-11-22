SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Bank, Acount, Cash_Account
WHERE B_ID = ?
    AND Account.A_ID = Cash_Account.A_ID
    
/* Gets bitcoin account info with given customer name. */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Bank, Account, Cash_Account
WHERE Name = ? 
    AND Account.A_ID = Cash_Account.A_ID;