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
