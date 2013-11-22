/* Select 1 transaction with given id. */
SELECT Date, Time, Cash_Transfer, Buyer_A_ID, Seller_A_ID
FROM Transaction
WHERE Buyer_A_ID = ?
    OR Seller_A_ID = ?;
    
/* Select transactions with given name. */
SELECT Date, Time, Cash_Transfer, Buyer_A_ID, Seller_A_ID
FROM Transaction, Customer
WHERE Customer.First_Name = ? AND Customer.Last_Name = ?
    AND (Transaction.Buyer_A_ID = Customer.C_ID
        OR Transaction.Seller_A_ID = Customer.C_ID);

/* Select transactions and buyer and seller names with a given name. */
SELECT Date, Time, Cash_Transfer, Buyer_First_Name, Buyer_Last_Name, Seller_First_Name, Seller_Last_Name
FROM Transaction, Account ABuyer, Customer CBuyer, Account ASeller, Customer CSeller
WHERE (CBuyer.First_Name = ? 
        AND CBuyer.Last_Name = ? 
        AND Transaction.Buyer_A_ID = ABuyer.A_ID
        AND CBuyer.C_ID = ABuyer.C_ID)
    OR (Seller.First_Name = ? 
        AND Seller.Last_Name = ? 
        AND Transaction.Seller_A_ID = ASeller.A_ID
        AND CSeller.C_ID = ASeller.C_ID);
        
/* Get transactions for a specific day. */
SELECT Date, Time, Cash_Transfer, Buyer_First_Name, Buyer_Last_Name, Seller_First_Name, Seller_Last_Name
FROM Transaction, Account ABuyer, Customer CBuyer, Account ASeller, Customer CSeller
WHERE Transaction.Date = ?
    AND ABuyer.A_ID = Transaction.Buyer_A_ID
    AND CBuyer.C_ID = ABuyer.C_ID
    AND ASeller.A_ID = Transaction.Seller_A_ID
    AND CSeller.C_ID = ASeller.C_ID

/* Get transactions for a date range */
SELECT Date, Time, Cash_Transfer, Buyer_First_Name, Buyer_Last_Name, Seller_First_Name, Seller_Last_Name
FROM Transaction, Account ABuyer, Customer CBuyer, Account ASeller, Customer CSeller
WHERE Transaction.Date <= ? AND Transaction.Date >= ?
    AND ABuyer.A_ID = Transaction.Buyer_A_ID
    AND CBuyer.C_ID = ABuyer.C_ID
    AND ASeller.A_ID = Transaction.Seller_A_ID
    AND CSeller.C_ID = ASeller.C_ID