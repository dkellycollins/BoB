/* Get the total balance in each that the bank owns. */
SELECT SUM(Balance)
FROM Account
WHERE B_ID = ?

SELECT SUM(Balance)
FROM Account, Bank
WHERE Bank.B_ID = Account.B_ID
    AND Bank.Name = ?