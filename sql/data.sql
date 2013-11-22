INSERT INTO Zipcode VALUES (66502, 'manhattan', 'KS');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES('111-222-4333','15111 manhattan st manhattan ks','apt 5',66502);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bob', 'Parker', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('8ight', 'apple', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (77775, 'St Louis', 'MO');
INSERT INTO Contact_Info VALUES (Phone_num, Address_1, Address_2, Zip) VALUES('111-222-3333','11213 Arch St. Louis, Missouri 77879','',77775);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bob', 'Parker', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('bobp', 'orange', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11111, 'Charlestone', 'SC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES('111-992-9533','1126 Bill St, SC 11111','',11111);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bill', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('bill', 'notapassword', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11123, 'Charlestone', 'SC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES ('111-242-2633','1126 Bill St, SC 11123','',11123);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bill', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('nill', 'notapassword', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (115592, 'City', 'NC');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES ('999-222-3333','1326 City St, NC 115592','',115592);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bill', 'Job', LAST_INSERT_ID());
INSERT INTO Customer_Log_In VALUES ('chill', 'cold', LAST_INSERT_ID());

INSERT INTO Zipcode VALUES (11112, 'City', 'CA');
INSERT INTO Contact_Info (Phone_num, Address_1, Address_2, Zip) VALUES ('111-222-3333','9999 State St, CA 11112','',11112);
INSERT INTO Customer (First_Name, Last_Name, CI_ID) VALUES ('Bill', 'Job', 4);
INSERT INTO Customer_Log_In VALUES ('sun', 'warm', 4);