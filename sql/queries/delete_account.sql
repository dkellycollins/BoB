/* Deletes an account with a given A_ID */
DELETE FROM `Account`
WHERE A_ID=1;

/* Deletes the accounts owned by the customer with the given C_ID */
DELETE FROM `Account`
WHERE C_ID=1;


/* Deletes the accounts owned by the customer with the given first and last names*/

DELETE FROM `Account`
WHERE C_ID IN (SELECT c.C_ID
                FROM Customer c
                WHERE c.First_Name = 'Sue' AND c.Last_Name = 'Parker');
