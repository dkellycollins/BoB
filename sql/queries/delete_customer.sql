/*This query will delete a customer with given C_ID*/
DELETE FROM `Customer_Bank`
WHERE C_ID =1;

/*This query will delete all the customers with a given first and last name*/
DELETE FROM `Customer_Bank`
WHERE First_Name = 'Testy' AND Last_Name = 'Tester';
