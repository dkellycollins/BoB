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