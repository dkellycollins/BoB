/* Gets bitcoin account info with given customer id */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Customer, Account, Bitcoin_Account
WHERE C_ID = ?
    AND Account.A_ID = Cash_Account.A_ID
    
/* Gets bitcoin account info with given customer name. */
SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Customer, Account, Bitcoin_Account
WHERE First_Name = ? AND Last_Name = ?
    AND Account.A_ID = Cash_Account.A_ID;