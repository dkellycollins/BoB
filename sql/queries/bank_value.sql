/* A query to find the value of all the account's in a bank, give a bank's B_ID*/
SELECT SUM(a.Balance)
FROM Account a, Bank_Account ba
WHERE ba.B_ID = 1 AND ba.A_ID = a.A_ID;

/* A query to find the value of all the account's in a bank given a bank's name*/
SELECT SUM(a.Balance)
FROM Account a, Bank_Account ba, Bank b
WHERE b.Name = 'HerpdyDerpdy' AND b.B_ID = ba.B_ID AND a.A_ID = ba.B_ID; 
