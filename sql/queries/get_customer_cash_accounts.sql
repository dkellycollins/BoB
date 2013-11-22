SELECT Interest_Rate, Balance, Withdraws_fee, Num_Free_Withdraws
FROM Account, Cash_Account
WHERE C_ID = 1
    AND Account.A_ID = Cash_Account.A_ID
    
/* Gets cash account info with given customer name. */
SELECT Interest_Rate, Balance, Withdraws_fee, Num_Free_Withdraws
FROM Customer, Account, Cash_Account
WHERE First_Name = "Sue" AND Last_Name = "Parker"
    AND Account.A_ID = Cash_Account.A_ID;