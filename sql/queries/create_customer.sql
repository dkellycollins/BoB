INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)
    VALUES ("999-999-9999", "102 Street st", "", 66502);
INSERT INTO Customer (First_Name, Last_Name, CI_ID)
    VALUES ("Test", "McBuff", LAST_INSERT_ID());
INSERT INTO Customer_Log_In (Username, Password, C_ID)
    VALUES ("Test", "Admin", LAST_INSERT_ID());