/* This query will be used to get the ID of the bank */
SELECT B_ID
FROM Bank_Log_In
WHERE Username = "Admin" AND Password = "Admin";
    
/* This query will be used to get all the info for the bank. */
SELECT Name, Current_Bitcoin_Value, CI_ID
FROM Bank_Log_In BLI, Bank B
WHERE BLI.Username = "Admin" AND BLI.Password = "Admin"
    AND BLI.B_ID = B.B_ID;
    
/* This query will get all information about the bank requiring no other input but username and password */
SELECT Name, Current_Bitcoin_Value, Phone_num, Address_1, Address_2, Z.Zip, City, zState
FROM Bank_Log_In BLI, Bank B, Contact_Info CI, Zipcode Z
WHERE BLI.Username = "Admin" AND BLI.Password = "Admin"
    AND BLI.B_ID = B.B_ID
    AND B.CI_ID = CI.CI_ID
    AND CI.Zip = Z.Zip;