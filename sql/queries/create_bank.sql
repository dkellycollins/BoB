/* Simply inserts new information into relavent tables for a new bank.
    All values must be provided in the application. */

INSERT INTO Contact_Info (Phone_num, Address_1, Zip)
    VALUES ("785-222-5555", "102 Street st", 66502);
INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID)
    VALUES ("Test Bank", 1.0, LAST_INSERT_ID());
INSERT INTO Bank_Log_In (Username, Password, B_ID)
    VALUES ("Admin", "Admin", LAST_INSERT_ID());