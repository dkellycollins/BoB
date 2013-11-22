/* Query to total a customer's value given the customer's C_ID */
SELECT SUM(a.Balance)
FROM Account a
WHERE a.C_ID =1;

/* Query to total a customer's value give the customer's First and last name*/
SELECT SUM(a.Balance) 
FROM Customer_Bank c, Account a
WHERE c.First_name = 'Herp' AND c.Last_Name='Derp' AND
    a.C_ID = c.C_ID;
