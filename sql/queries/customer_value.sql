/* Query to total a customer's value given the customer's C_ID */
SELECT SUM(a.Balance)
FROM Account a
WHERE a.C_ID =2;
/* Expected Result
+----------------+
| SUM(a.Balance) |
+----------------+
|              5 |
+----------------+
1 row in set (0.01 sec)
*/

/* Query to total a customer's value give the customer's First and last name*/
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