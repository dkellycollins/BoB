INSERT INTO Zipcode VALUES (66502, 'manhattan', 'KS');
INSERT INTO Contact_Info VALUES (0,'111-222-4333','15111 manhattan st manhattan ks','apt 5',66502);
INSERT INTO Customer_Bank VALUES (0, 'Bob', 'Parker', 0);
INSERT INTO Customer_Log_In VALUES ('8ight', 'apple', 0);
INSERT INTO Account VALUES (0,0.02,5.0,0);
INSERT INTO Cash_Account VALUES (0,5,10,0);

INSERT INTO Zipcode VALUES (77775, 'St Louis', 'MO');
INSERT INTO Contact_Info VALUES (1,'111-222-3333','11213 Arch St. Louis, Missouri 77879','',77775);
INSERT INTO Customer_Bank VALUES (1, 'Bob', 'Parker', 1);
INSERT INTO Customer_Log_In VALUES ('bobp', 'orange', 1);
INSERT INTO Account VALUES (1,0.03,5.0,1);
INSERT INTO Bitcoin_Account VALUES (1,2,10,1);

INSERT INTO Zipcode VALUES (11111, 'Charlestone', 'SC');
INSERT INTO Contact_Info VALUES (2,'111-992-9533','1126 Bill St, SC 11111','',11111);
INSERT INTO Customer_Bank VALUES (2, 'Bill', 'Job', 2);
INSERT INTO Customer_Log_In VALUES ('bill', 'notapassword', 2);
INSERT INTO Account VALUES (2,0.03,5.0,2);
INSERT INTO Bitcoin_Account VALUES (2,2,10,2);

INSERT INTO Zipcode VALUES (11123, 'Charlestone', 'SC');
INSERT INTO Contact_Info VALUES (3,'111-242-2633','1126 Bill St, SC 11123','',11123);
INSERT INTO Customer_Bank VALUES (3, 'Bill', 'Job', 2);
INSERT INTO Customer_Log_In VALUES ('bill', 'notapassword', 2);
INSERT INTO Account VALUES (3,0.03,5.0,3);
INSERT INTO Bitcoin_Account VALUES (3,2,10,3);

INSERT INTO Zipcode VALUES (115592, 'City', 'NC');
INSERT INTO Contact_Info VALUES (3,'999-222-3333','1326 City St, NC 115592','',115592);
INSERT INTO Customer_Bank VALUES (3, 'Bill', 'Job', 3);
INSERT INTO Customer_Log_In VALUES ('chill', 'cold', 3);
INSERT INTO Account VALUES (4,0.03,5.0,4);
INSERT INTO Bitcoin_Account VALUES (4,0.97,23,4);
INSERT INTO Money_Account VALUES (4,9,4,4);

INSERT INTO Zipcode VALUES (11112, 'City', 'CA');
INSERT INTO Contact_Info VALUES (5,'111-222-3333','9999 State St, CA 11112','',11112);
INSERT INTO Customer_Bank VALUES (5, 'Bill', 'Job', 5);
INSERT INTO Customer_Log_In VALUES ('sun', 'warm', 5);
INSERT INTO Account VALUES (4,0.05,5.0,4);
INSERT INTO Bitcoin_Account VALUES (4,0.7,2,4);
INSERT INTO Money_Account VALUES (4,9,4,4);


INSERT INTO Contact_Info VALUES (8,'888-888-8888', '1111 Bitcoin St, Money, KS', '', 11112);
INSERT INTO Bank VALUES (0, 'Bank of Bitcoins', 12, 8);
INSERT INTO Bank_Log_In('BOB', 'bobpassword', 0);

INSERT INTO Bank VALUES (1, 'Bank of Money', 10, 8);
INSERT INTO Bank_Log_In('money', 'darksideofthemoon', 1);

INSERT INTO Bank VALUES (2, 'Bank of Cats', 10, 8);
INSERT INTO Bank_Log_In('dog', 'birds', 2);

INSERT INTO Bank VALUES (3, 'Bank of Killian', 2, 8);
INSERT INTO Bank_Log_In('tac', 'sdrib', 3);

INSERT INTO Bank VALUES (4, 'Cats of Bank', 10, 8);
INSERT INTO Bank_Log_In('lost', 'john', 4);

