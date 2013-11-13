SELECT Interest_Rate, Balance, Withdraws_fee, Num_Free_Withdraws
FROM Acount, Cash_Account
WHERE C_ID = ?
    AND Account.A_ID = Cash_Account.A_ID