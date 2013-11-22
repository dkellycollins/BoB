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
FROM Transaction, Customer Buyer, Customer Seller
WHERE (Buyer.First_Name = ? 
        AND Buyer.Last_Name = ? 
        AND Transaction.Buyer_A_ID = Buyer.C_ID)
    OR (Seller.First_Name = ? 
        AND Seller.Last_Name = ? 
        AND Transaction.Seller_A_ID = Seller.C_ID);
        
/* Get transactions for a specific day. */

/* Get transactions for a date range */