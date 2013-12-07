/* 1.This query will get all information about the customer requiring no other input but username and password
    This will be used when a customer logs in.*/
SELECT First_Name, Last_Name, Phone_num, Address_1, Address_2, Z.Zip, City, zState
FROM Customer_Log_In CLI, Customer C, Contact_Info CI, Zipcode Z
WHERE LOWER(CLI.Username) = LOWER("bobp") AND CLI.Password = "orange"
    AND CLI.C_ID = C.C_ID
    AND C.CI_ID = CI.CI_ID
    AND CI.Zip = Z.Zip;
/* Expected Result 
+------------+-----------+--------------+--------------------------------------+-----------+-------+----------+--------+
| First_Name | Last_Name | Phone_num    | Address_1                            | Address_2 | Zip   | City     | zState |
+------------+-----------+--------------+--------------------------------------+-----------+-------+----------+--------+
| Sue        | Parker    | 111-222-3333 | 11213 Arch St. Louis, Missouri 77879 |           | 77775 | St Louis | MO     |
+------------+-----------+--------------+--------------------------------------+-----------+-------+----------+--------+
1 row in set (0.00 sec)
*/

/* 2.Query to total a customer's value give the customer's First and last name
    This will be used to sumerize the customer's accounts on the main web page.*/
SELECT SUM(a.Balance) 
FROM Customer c, Account a
WHERE c.First_name = 'Sue' AND c.Last_Name='Parker' AND
    a.C_ID = c.C_ID;
/* Expected Result
+----------------+
| SUM(a.Balance) |
+----------------+
|              5 |
+----------------+
1 row in set (0.35 sec)
*/

/* 3.Display all accounts for a bank and the customer they belong to. 
    This will be used when we are logged in as a bank. This gets and organizes all accounts the bank manages. */
SELECT A_ID, Balance, CONCAT(First_Name, " ", Last_Name) AS Customer, Name AS Bank
FROM Account A, Bank B, Customer C
WHERE B.Name= "Bank of Bitcoins"
    AND A.B_ID = B.B_ID
    AND C.C_ID = A.C_ID
ORDER BY C.Last_Name;
/* Expected Results
+------+---------+-------------+------------------+
| A_ID | Balance | Customer    | Bank             |
+------+---------+-------------+------------------+
|    1 |       5 | Billard Job | Bank of Bitcoins |
|    8 |     100 | Bob Parker  | Bank of Bitcoins |
+------+---------+-------------+------------------+
2 rows in set (0.00 sec)
*/

/* 4.Get transactions for a date range 
    This will be used to filter the complete list of transactions.*/
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

/* 5.Select transactions and buyer and seller names with a given name. 
    This will be used to give more details on transactions concerning single customer.*/
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

/* 6.Gets bitcoin account info with given customer name.
    This will be used to retrive all the details of bitcoin accounts for a single customer.*/
SELECT Account.A_ID, Interest_Rate, Balance, Wallet_Type, Processing_Fee
FROM Customer, Account, Bitcoin_Account
WHERE First_Name = "Billard" AND Last_Name = "Job"
    AND Account.A_ID = Bitcoin_Account.A_ID
    AND Customer.C_ID = Account.C_ID;
/* Expected Result
+------+---------------+---------+-------------+----------------+
| A_ID | Interest_Rate | Balance | Wallet_Type | Processing_Fee |
+------+---------------+---------+-------------+----------------+
|    2 |          0.03 |       5 | 2           |             10 |
+------+---------------+---------+-------------+----------------+
1 row in set (0.00 sec)
*/

/* 7.Gets cash account info with given customer name and a balance greater then the given amount. 
    This will be used to filter cash accounts for a given customer. */
SELECT Account.A_ID, Interest_Rate, Balance, Withdraw_fee, Num_Free_Withdraws
FROM Customer, Account, Cash_Account
WHERE First_Name = "Billard" AND Last_Name = "Job"
    AND Account.A_ID = Cash_Account.A_ID
    AND Account.C_ID = Customer.C_ID
    AND Account.Balance > 3;
/* Expected Result
+------+---------------+---------+--------------+--------------------+
| A_ID | Interest_Rate | Balance | Withdraw_fee | Num_Free_Withdraws |
+------+---------------+---------+--------------+--------------------+
|    1 |          0.02 |       5 |           10 |                  5 |
+------+---------------+---------+--------------+--------------------+
1 row in set (0.00 sec)
*/

/* 8.This query will be used to change a customers contact information given a Customers name */
UPDATE `Contact_Info` AS ci SET `Phone_num` = '111-111-1111',
    `Address_1` = '123 Steet Street', `Address_2` = 'Apt 123', `Zip`=66502
WHERE ci.CI_ID = (SELECT c.CI_ID
                   FROM Customer AS c
                    WHERE c.First_Name = "Bob" AND c.Last_Name = "Parker");
/* Expected Result
Query OK, 0 rows affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0
*/
                    
/* 9.Creates a new bitcoin account with provided InterestRate Balance, Customer name, and Bank name. */
INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 1.15, 100, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Sue" AND Customer.Last_Name = "Parker"
        AND Bank.Name = "Bank of Bitcoins";
INSERT INTO Cash_Account 
    VALUES (LAST_INSERT_ID(), 10, 3);
    
/* 10. Retrives all contact info for customers within a zipcode.
    This query can be used to find all customer within a given area. */
SELECT First_Name, Last_Name, Phone_Num, Address_1, Address_2, Z.Zip, City, zState
FROM Customer C, Contact_Info CI, Zipcode Z
WHERE Z.Zip = 66502
    AND C.CI_ID = CI.CI_ID
    AND CI.Zip = Z.Zip
ORDER BY Z.zState, Z.City;
/* Expected Results
+------------+-----------+--------------+------------------+-----------+-------+-----------+--------+
| First_Name | Last_Name | Phone_Num    | Address_1        | Address_2 | Zip   | City      | zState |
+------------+-----------+--------------+------------------+-----------+-------+-----------+--------+
| Bob        | Parker    | 111-111-1111 | 123 Steet Street | Apt 123   | 66502 | Manhattan | KS     |
+------------+-----------+--------------+------------------+-----------+-------+-----------+--------+
1 row in set (0.00 sec)
*/