DROP TRIGGER IF EXISTS transfer_trig;
DELIMITER $
CREATE TRIGGER transfer_trig AFTER INSERT ON Transfer
FOR EACH ROW
BEGIN
    UPDATE Account SET Balance = (NEW.Cash_transfer - Account.Balance) 
        WHERE Account.A_ID = NEW.Buyer_A_ID;
    UPDATE Account SET Balance = (Account.Balance + NEW.Cash_transfer) 
        WHERE Account.A_ID = NEW.Seller_A_ID;
END;
    
$

DROP TRIGGER IF EXISTS Upd_Balances;
CREATE TRIGGER Upd_Balances AFTER UPDATE ON Bank
FOR EACH ROW
BEGIN
    IF NEW.Current_Bitcoin_Value <> OLD.Current_Bitcoin_Value THEN
        UPDATE Account AS ac SET ac.Balance = (ac.Balance *(NEW.Current_Bitcoin_Value/OLD.Current_Bitcoin_Value))
        WHERE EXISTS ( SELECT *
                        FROM Bitcoin_Account AS ba
                        WHERE ac.B_ID= NEW.B_ID AND ac.A_ID = ba.A_ID);
    END IF;
END;

$
DELIMITER ;

/* Result
Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.03 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> show triggers;
+---------------+--------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+----------+-----------------+----------------------+----------------------+--------------------+
| Trigger       | Event  | Table    | Statement                                                                                                                                                                                                                                                                                                                                                                       | Timing | Created | sql_mode | Definer         | character_set_client | collation_connection | Database Collation |
+---------------+--------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+----------+-----------------+----------------------+----------------------+--------------------+
| Upd_Balances  | UPDATE | Bank     | BEGIN
    IF NEW.Current_Bitcoin_Value <> OLD.Current_Bitcoin_Value THEN
        UPDATE Account AS ac SET Account.Balance = (Account.Balance *(NEW.Current_Bitcoin_Value/OLD.Current_Bitcoin_Value))
        WHERE EXISTS ( SELECT *
                        FROM Bitcoin_Account AS ba
                        WHERE ac.B_ID= NEW.B_ID AND ac.A_ID = ba.A_ID);
    END IF;
END | AFTER  | NULL    |          | dkellycollins@% | latin1               | latin1_swedish_ci    | latin1_swedish_ci  |
| transfer_trig | INSERT | Transfer | BEGIN
    UPDATE Account SET Balance = (NEW.Cash_transfer - Account.Balance) 
        WHERE Account.A_ID = NEW.Buyer_A_ID;
    UPDATE Account SET Balance = (Account.Balance + NEW.Cash_transfer) 
        WHERE Account.A_ID = NEW.Seller_A_ID;
END                                                                                                                            | AFTER  | NULL    |          | dkellycollins@% | latin1               | latin1_swedish_ci    | latin1_swedish_ci  |
+---------------+--------+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+----------+-----------------+----------------------+----------------------+--------------------+
2 rows in set (0.01 sec)

Query Results:

transfer_trig
mysql> INSERT INTO Transfer (`TDate`,`TTime`, `Cash_transfer`, `Buyer_A_ID`,`Seller_A_ID`) VALUES ('2013-08-23', '09:01:00', 5, 1, 2);
Query OK, 1 row affected (0.06 sec)

mysql> select * from Account;
+------+---------------+---------+------+------+
| A_ID | Interest_rate | Balance | C_ID | B_ID |
+------+---------------+---------+------+------+
|    1 |          0.02 |       0 |    4 |    1 |
|    2 |          0.03 |      10 |    4 |    2 |
|    3 |          0.03 |       5 |    5 |    2 |
|    4 |          0.03 |       5 |    6 |    3 |
|    5 |          0.03 |       5 |    3 |    2 |
|    6 |          0.05 |       5 |    2 |    4 |
|    7 |          0.03 |       5 |    1 |    2 |
|    8 |          1.15 |     100 |    1 |    1 |
+------+---------------+---------+------+------+
8 rows in set (0.00 sec)
The original balance of account 1 and 2 was 5.

Upd_Balances
mysql> UPDATE `Bank` SET Current_Bitcoin_Value = Bank.Current_Bitcoin_Value + 1,     `Name` = 'Test Bank' WHERE B_ID = 1;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Account;
+------+---------------+------------------+------+------+
| A_ID | Interest_rate | Balance          | C_ID | B_ID |
+------+---------------+------------------+------+------+
|    1 |          0.02 |                0 |    4 |    1 |
|    2 |          0.03 |               10 |    4 |    2 |
|    3 |          0.03 |                5 |    5 |    2 |
|    4 |          0.03 |                5 |    6 |    3 |
|    5 |          0.03 |                5 |    3 |    2 |
|    6 |          0.05 |                5 |    2 |    4 |
|    7 |          0.03 |                5 |    1 |    2 |
|    8 |          1.15 | 108.333333333333 |    1 |    1 |
+------+---------------+------------------+------+------+
8 rows in set (0.00 sec)
Account 8 is the only bitcoin account that belongs to the bank we updated. So it should have been the only account updated.
*/
