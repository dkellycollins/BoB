/*This query will delete a customer with given C_ID*/
DELETE FROM `Customer`
WHERE C_ID =1;

/*This query will delete all the customers with a given first and last name*/
DELETE FROM `Customer`
WHERE First_Name = 'Testy' AND Last_Name = 'Tester';
