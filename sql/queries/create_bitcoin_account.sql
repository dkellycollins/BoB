/* Creates a new bitcoin account with provided Interest_rate, Balance, C_ID, and B_ID */
INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    VALUES(1.15, 100, 1, 1);
INSERT INTO Bitcoin_Account 
    VALUES (LAST_INSERT_ID(), 10, 3);
    
/* Creates a new bitcoin account with provided InterestRate Balance, Customer name, and Bank name. */
INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 1.15, 100, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Sue" AND Customer.Last_Name = "Parker"
        AND Bank.Name = "Bank of Killian";
INSERT INTO Bitcoin_Account 
    VALUES (LAST_INSERT_ID(), 10, 3);