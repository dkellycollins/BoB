SELECT Phone_Num, Address_1, Address_2, Zipcode.Zip, City, zState
FROM Contact_Info, Zipcode
WHERE Contact_Info.CI_ID = 1
    AND Contact_Info.Zip = Zipcode.Zip
/* Expected Results
+--------------+---------------------------------+-----------+-------+-----------+--------+
| Phone_Num    | Address_1                       | Address_2 | Zip   | City      | zState |
+--------------+---------------------------------+-----------+-------+-----------+--------+
| 111-222-4333 | 15111 manhattan st manhattan ks | apt 5     | 66502 | Manhattan | KS     |
+--------------+---------------------------------+-----------+-------+-----------+--------+
1 row in set (0.00 sec)
*/

/* 10. Retrives all contact info for customers within a zipcode. */
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