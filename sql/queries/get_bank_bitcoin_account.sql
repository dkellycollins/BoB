SELECT Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Acount, Cash_Account
WHERE B_ID = ?
    AND Account.A_ID = Cash_Account.A_ID