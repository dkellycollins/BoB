/* This query will be used to change a Customer's name, given a C_ID*/
UPDATE `Customer` SET `First_Name` = 'Testy',
    `Last_Name`='Tester'
WHERE C_ID = 1;

/* This query will be used to change a customers contact information given a C_ID */
UPDATE `Contact_Info` AS ci SET `Phone_num` = '111-111-1111',
    `Address_1` = '123 Steet Street', `Address_2` = 'Apt 111', `Zip`=66502
WHERE ci.CI_ID = (SELECT c.CI_ID
                   FROM Customer AS c
                    WHERE c.First_Name = "Bob" AND c.Last_Name = "Parker");
