SELECT Date, Time, Cash_Transfer, Buyer_A_ID, Seller_A_ID
FROM Transaction
WHERE Buyer_A_ID = ?
    OR Seller_A_ID = ?