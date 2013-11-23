/* Select transactions with given ids. */
SELECT TDate, TTime, Cash_Transfer, Buyer_A_ID, Seller_A_ID
FROM Transfer
WHERE Buyer_A_ID = 2
    OR Seller_A_ID = 4;
/*
+------------+----------+---------------+------------+-------------+
| TDate      | TTime    | Cash_Transfer | Buyer_A_ID | Seller_A_ID |
+------------+----------+---------------+------------+-------------+
| 2013-08-23 | 09:00:00 |       5132.25 |          2 |           4 |
+------------+----------+---------------+------------+-------------+
1 row in set (0.00 sec)
*/
    
/* Select transactions with given name. */
SELECT TDate, TTime, Cash_Transfer, Buyer_A_ID, Seller_A_ID
FROM Transfer, Customer
WHERE Customer.First_Name = "Sue" AND Customer.Last_Name = "Parker"
    AND (Transfer.Buyer_A_ID = Customer.C_ID
        OR Transfer.Seller_A_ID = Customer.C_ID);
/* Expected Result
+------------+----------+---------------+------------+-------------+
| TDate      | TTime    | Cash_Transfer | Buyer_A_ID | Seller_A_ID |
+------------+----------+---------------+------------+-------------+
| 2013-01-01 | 12:12:00 |             1 |          1 |           2 |
| 2013-05-14 | 23:00:00 |       1000000 |          5 |           2 |
| 2013-08-23 | 09:00:00 |       5132.25 |          2 |           4 |
+------------+----------+---------------+------------+-------------+
3 rows in set (0.07 sec)
*/

/* Select transactions and buyer and seller names with a given name. */
SELECT TDate, TTime, Cash_Transfer, 
    CONCAT(Buyer.First_Name, " ", Buyer.Last_Name) AS Buyer_Name,
    CONCAT(Seller.First_Name, " ", Seller.Last_Name) AS Seller_Name
FROM Transfer, 
    (SELECT A_ID, First_Name, Last_Name
    FROM Account A, Customer C
    WHERE A.C_ID = C.C_ID) AS Buyer,
    (SELECT A_ID, First_Name, Last_Name
    FROM Account A, Customer C
    WHERE A.C_ID = C.C_ID) AS Seller
WHERE (Buyer.First_Name = "Sue" AND Buyer.Last_Name = "Parker"
        AND Transfer.Buyer_A_ID = Buyer.A_ID
        AND Transfer.Seller_A_ID = Seller.A_ID)
    OR (Seller.First_Name = "Sue" AND Seller.Last_Name = "Parker"
        AND Transfer.Seller_A_ID = Seller.A_ID
        AND Transfer.Buyer_A_ID = Buyer.A_ID)
ORDER BY TDate, TTime;
/* Expected Results
+------------+----------+---------------+------------+-------------+
| TDate      | TTime    | Cash_Transfer | Buyer_Name | Seller_Name |
+------------+----------+---------------+------------+-------------+
| 2013-01-01 | 12:12:00 |             1 | Bob Parker | Sue Parker  |
| 2013-05-14 | 23:00:00 |       1000000 | Rob Job    | Sue Parker  |
| 2013-08-23 | 09:00:00 |       5132.25 | Sue Parker | Billard Job |
+------------+----------+---------------+------------+-------------+
3 rows in set (0.00 sec)
*/
        
/* Get transactions for a specific day. */
SELECT TDate, TTime, Cash_Transfer, 
    CBuyer.First_Name AS Buyer_First_Name, CBuyer.Last_Name AS Buyer_Last_Name, 
    CSeller.First_Name AS Seller_First_Name, CSeller.Last_NAme AS Seller_Last_Name
FROM Transfer, Account ABuyer, Customer CBuyer, Account ASeller, Customer CSeller
WHERE Transfer.TDate = '2013-05-14'
    AND ABuyer.A_ID = Transfer.Buyer_A_ID
    AND CBuyer.C_ID = ABuyer.C_ID
    AND ASeller.A_ID = Transfer.Seller_A_ID
    AND CSeller.C_ID = ASeller.C_ID;
/* Expected Result
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
| TDate      | TTime    | Cash_Transfer | Buyer_First_Name | Buyer_Last_Name | Seller_First_Name | Seller_Last_Name |
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
| 2013-05-14 | 23:00:00 |       1000000 | Bill             | Job             | Billard           | Job              |
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
1 row in set (0.00 sec)
*/

/* Get transactions for a date range */
SELECT TDate, TTime, Cash_Transfer, 
    CBuyer.First_Name AS Buyer_First_Name, CBuyer.Last_Name AS Buyer_Last_Name, 
    CSeller.First_Name AS Seller_First_Name, CSeller.Last_NAme AS Seller_Last_Name
FROM Transfer, Account ABuyer, Customer CBuyer, Account ASeller, Customer CSeller
WHERE Transfer.TDate BETWEEN '2013-05-01' AND '2013-05-31' 
    AND ABuyer.A_ID = Transfer.Buyer_A_ID
    AND CBuyer.C_ID = ABuyer.C_ID
    AND ASeller.A_ID = Transfer.Seller_A_ID
    AND CSeller.C_ID = ASeller.C_ID
ORDER BY Transfer.TDate, Transfer.TTime;
/* Expected Results
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
| TDate      | TTime    | Cash_Transfer | Buyer_First_Name | Buyer_Last_Name | Seller_First_Name | Seller_Last_Name |
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
| 2013-05-12 | 08:00:00 |        123.01 | Sue              | Parker          | Rob               | Job              |
| 2013-05-14 | 23:00:00 |       1000000 | Bill             | Job             | Billard           | Job              |
+------------+----------+---------------+------------------+-----------------+-------------------+------------------+
2 rows in set (0.00 sec)
*/

