/* Showcases how we might get user information from login
    In these examples "bobp" is the username and "orange" is the password */

/* This query will be used to just get the ID of the customer */
SELECT C_ID
FROM Customer_Log_In
WHERE LOWER(Username) = LOWER("bobp") 
    AND Password = "orange";
/* Expected Result
+------+
| C_ID |
+------+
|    2 |
+------+
1 row in set (0.00 sec)
*/
    
/* This query will be used to get all the info for the customer. */
SELECT First_Name, Last_Name, CI_ID
FROM Customer_Log_In CLI, Customer C
WHERE LOWER(CLI.Username) = LOWER("bobp") AND CLI.Password = "orange"
    AND CLI.C_ID = C.C_ID;
/* Expected Result
+------------+-----------+-------+
| First_Name | Last_Name | CI_ID |
+------------+-----------+-------+
| Sue        | Parker    |     2 |
+------------+-----------+-------+
1 row in set (0.00 sec)
*/
    
/* This query will get all information about the customer requiring no other input but username and password */
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