INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-08-23', '09:01:00', 5, A1.C_ID, A2.C_ID
    FROM Account A1, Customer C1, Account A2, Customer C2
    WHERE C1.First_Name = "Bob" AND C1.Last_Name = "Parker" AND A1.C_ID = C1.C_ID
        AND C2.First_Name = "Bill" AND C2.Last_Name = "Job" AND A2.C_ID = C2.C_ID;