/* This query will be used to change the bitcoin value of a bank given the banks B_ID */
UPDATE `Bank` SET Current_Bitcoin_Value = Bank.Current_Bitcoin_Value + 1
WHERE B_ID = 1;

/* This query will be used to change a banks name given the bank's B_ID*/
UPDATE `Bank` SET `Name` = 'Test Bank'
WHERE B_ID = 1;

/* This query will be used to change a banks name and bitcoin value given the bank's B_ID*/
UPDATE `Bank` SET Current_Bitcoin_Value = Bank.Current_Bitcoin_Value + 1,
    `Name` = 'Test Bank'
WHERE B_ID = 1;

/* This query will be used to change a banks contact info given the bank's B_ID*/
UPDATE `Contact_Info` as ci SET `Phone_num` = '111-111-1111',
    `Address_1` = '123 Steet Street', `Address_2` = 'Apt 111', `Zip`=123456
WHERE ci.CI_ID = (SELECT b.CI_ID
                    FROM Bank AS b
                    WHERE b.B_ID=1);
