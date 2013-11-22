/* Customers */
INSERT INTO Zipcode VALUES (66502, "Manhattan", "KS");
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES ('111-222-4333','15111 manhattan st manhattan ks','apt 5',66502);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bob', 'Parker', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('8ight', 'apple', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (77775, 'St Louis', 'MO');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)  VALUES ('111-222-3333','11213 Arch St. Louis, Missouri 77879','',77775);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Sue', 'Parker', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('bobp', 'orange', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11111, 'Charlestone', 'SC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)  VALUES ('111-992-9533','1126 Bill St, SC 11111','',11111);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bill', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('bill', 'notapassword', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11123, 'Charlestone', 'SC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)  VALUES ('111-242-2633','1126 Bill St, SC 11123','',11123);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Billard', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('bill2', 'notapassword', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (115592, 'City', 'NC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)  VALUES ('999-222-3333','1326 City St, NC 115592','',115592);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Rob', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('chill', 'cold', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11112, 'City', 'CA');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip)  VALUES ('111-222-3333','9999 State St, CA 11112','',11112);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Billy', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('sun', 'warm', LAST_INSERT_ID());

/* Banks */
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES ('888-888-8888', '1111 Bitcoin St, Money, KS', '', 11112);
INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID) VALUES ('Bank of Bitcoins', 12, LAST_INSERT_ID());
INSERT INTO Bank_Log_In VALUES ('BOB', 'bobpassword', LAST_INSERT_ID());

INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID) VALUES ('Bank of Money', 10, LAST_INSERT_ID());
INSERT INTO Bank_Log_In VALUES ('money', 'darksideofthemoon', LAST_INSERT_ID());

INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID) VALUES ('Bank of Cats', 10, LAST_INSERT_ID());
INSERT INTO Bank_Log_In VALUES ('dog', 'birds', LAST_INSERT_ID());

INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID) VALUES ( 'Bank of Killian', 2, LAST_INSERT_ID());
INSERT INTO Bank_Log_In VALUES ('tac', 'sdrib', LAST_INSERT_ID());

INSERT INTO Bank (Name, Current_Bitcoin_Value, CI_ID) VALUES ('Cats of Bank', 10, LAST_INSERT_ID());
INSERT INTO Bank_Log_In VALUES ('lost', 'john', LAST_INSERT_ID());

/* Accounts */
INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.02, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Billard" AND Customer.Last_Name = "Job"
        AND Bank.Name = "Bank of Bitcoins";
INSERT INTO Cash_Account VALUES (LAST_INSERT_ID(), 10, 5);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.03, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Billard" AND Customer.Last_Name = "Job"
        AND Bank.Name = "Bank of Money";
INSERT INTO Bitcoin_Account VALUES (LAST_INSERT_ID(),2,10);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.03, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Rob" AND Customer.Last_Name = "Job"
        AND Bank.Name = "Bank of Money";
INSERT INTO Bitcoin_Account VALUES (LAST_INSERT_ID(),2,10);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.03, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Billy" AND Customer.Last_Name = "Job"
        AND Bank.Name = "Bank of Cats";
INSERT INTO Bitcoin_Account VALUES (LAST_INSERT_ID(),2,10);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.03, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Bill" AND Customer.Last_Name = "Job"
        AND Bank.Name = "Bank of Money";
INSERT INTO Cash_Account VALUES (LAST_INSERT_ID(),4,9);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.05, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Sue" AND Customer.Last_Name = "Parker"
        AND Bank.Name = "Bank of Killian";
INSERT INTO Bitcoin_Account VALUES (LAST_INSERT_ID(),2,0.7);

INSERT INTO Account (Interest_rate, Balance, C_ID, B_ID)
    SELECT 0.03, 5.0, C_ID, B_ID
    FROM Customer, Bank
    WHERE Customer.First_Name = "Bob" AND Customer.Last_Name = "Parker"
        AND Bank.Name = "Bank of Money";
INSERT INTO Cash_Account VALUES (LAST_INSERT_ID(),4,9);

/* Transfers */
INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-01-01', '12:12:00', 1.00, C1.C_ID, C2.C_ID
    FROM Customer C1, Customer C2
    WHERE C1.First_Name = "Bob" AND C1.Last_Name = "Parker"
        AND C2.First_Name = "Sue" AND C2.Last_Name = "Parker";

INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-04-13', '15:00:00', 500.43, C1.C_ID, C2.C_ID
    FROM Customer C1, Customer C2
    WHERE C1.First_Name = "Billard" AND C1.Last_Name = "Job"
        AND C2.First_Name = "Rob" AND C2.Last_Name = "Job";

INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-05-12', '08:00:00', 123.01, C1.C_ID, C2.C_ID
    FROM Customer C1, Customer C2
    WHERE C1.First_Name = "Billy" AND C1.Last_Name = "Job"
        AND C2.First_Name = "Bill" AND C2.Last_Name = "Job";
        
INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-05-14', '23:00:00', 1000000.00, C1.C_ID, C2.C_ID
    FROM Customer C1, Customer C2
    WHERE C1.First_Name = "Rob" AND C1.Last_Name = "Job"
        AND C2.First_Name = "Sue" AND C2.Last_Name = "Parker";
        
INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) 
    SELECT '2013-08-23', '09:00:00', 5132.25, C1.C_ID, C2.C_ID
    FROM Customer C1, Customer C2
    WHERE C1.First_Name = "Sue" AND C1.Last_Name = "Parker"
        AND C2.First_Name = "Billard" AND C2.Last_Name = "Job";