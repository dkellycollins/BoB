/* This query will be used to get the ID of the bank */
SELECT B_ID
FROM Bank_Log_In
WHERE LOWER(Username) = LOWER("dog") AND Password = "birds";
/* Expected Results
+------+
| B_ID |
+------+
|    3 |
+------+
1 row in set (0.00 sec)
*/
    
/* This query will be used to get all the info for the bank. */
SELECT Name, Current_Bitcoin_Value, CI_ID
FROM Bank_Log_In BLI, Bank B
WHERE LOWER(BLI.Username) = LOWER("dog") AND BLI.Password = "birds"
    AND BLI.B_ID = B.B_ID;
/* Expected Results
+--------------+-----------------------+-------+
| Name         | Current_Bitcoin_Value | CI_ID |
+--------------+-----------------------+-------+
| Bank of Cats |                    10 |     2 |
+--------------+-----------------------+-------+
1 row in set (0.00 sec)
*/
    
/* This query will get all information about the bank requiring no other input but username and password */
SELECT Name, Current_Bitcoin_Value, Phone_num, Address_1, Address_2, Z.Zip, City, zState
FROM Bank_Log_In BLI, Bank B, Contact_Info CI, Zipcode Z
WHERE LOWER(BLI.Username) = LOWER("dog") AND BLI.Password = "birds"
    AND BLI.B_ID = B.B_ID
    AND B.CI_ID = CI.CI_ID
    AND CI.Zip = Z.Zip;
/* Expected Results
+--------------+-----------------------+--------------+--------------------------------------+-----------+-------+----------+--------+
| Name         | Current_Bitcoin_Value | Phone_num    | Address_1                            | Address_2 | Zip   | City     | zState |
+--------------+-----------------------+--------------+--------------------------------------+-----------+-------+----------+--------+
| Bank of Cats |                    10 | 111-222-3333 | 11213 Arch St. Louis, Missouri 77879 |           | 77775 | St Louis | MO     |
+--------------+-----------------------+--------------+--------------------------------------+-----------+-------+----------+--------+
1 row in set (0.00 sec)
*/