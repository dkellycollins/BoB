/* This query will be used to get the ID of the customer */
SELECT C_ID
FROM Customer_Log_In
WHERE Username = "Test" 
    AND Password = "Admin";
    
/* This query will be used to get all the info for the bank. */
SELECT First_Name, Last_Name, CI_ID
FROM Customer_Log_In CLI, Customer C
WHERE CLI.Username = "Test" AND CLI.Password = "Admin"
    AND CLI.C_ID = C.C_ID;
    
/* This query will get all information about the bank requiring no other input but username and password */
SELECT First_Name, Last_Name, Phone_num, Address_1, Address_2, Z.Zip, City, zState
FROM Customer_Log_In CLI, Customer C, Contact_Info CI, Zipcode Z
WHERE CLI.Username = "Test" AND CLI.Password = "Admin"
    AND CLI.C_ID = C.C_ID
    AND C.CI_ID = CI.CI_ID
    AND CI.Zip = Z.Zip;