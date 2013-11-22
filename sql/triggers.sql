DROP TRIGGER IF EXISTS transfer_trig;
DELIMITER $
CREATE TRIGGER transfer_trig AFTER INSERT ON Transfer
FOR EACH ROW
BEGIN
    UPDATE Account SET Balance = (NEW.Cash_transfer + Account.Balance) 
        WHERE Account.A_ID = NEW.Buyer_A_ID;
    UPDATE Account SET Balance = (Account.Balance - NEW.Cash_transfer) 
        WHERE Account.A_ID = NEW.Seller_A_ID;
  END IF;
END;
    
DROP TRIGGER IF EXISTS Upd_Balances;
CREATE TRIGGER Upd_Balances AFTER UPDATE ON Bank
FOR EACH ROW
BEGIN
    IF NEW.Current_Bitcoin_Value <> OLD.Current_Bitcoin_Value THEN
        UPDATE Account AS ac SET Account.Balance = (Account.Balance *(NEW.Current_Bitcoin_Value/OLD.Current_Bitcoin_Value))
        WHERE EXISTS ( SELECT *
                        FROM Bitcoin_Account AS ba
                        WHERE ac.B_ID= NEW.B_ID AND ac.A_ID = ba.A_ID);
    END IF;
END;

DROP TRIGGER IF EXISTS transfer_money;
/*
DELIMITER |
CREATE TRIGGER `transfer_money` AFTER INSERT ON `Transfer`
FOR EACH ROW
BEGIN
    IF (NEW.Cash_transfer) IS NOT NULL THEN
        UPDATE `Account` AS ac1 SET `Balance` = Balance + NEW.Cash_transfer
        WHERE ac1.A_ID = NEW.Seller_A_ID;
        
        UPDATE `Account` AS ac2 SET `Balance` = Balance - NEW.Cash_Transfer
        WHERE ac3.A_ID = NEW.Buyer_A_ID;
    END IF;
    
    IF EXISTS(SELECT * FROM Transfer_Bitcoin WHERE Transfer_Bitcoin.T_ID = NEW.T_ID) THEN
        UPDATE `Bitcoin` AS ba1 SET `Balance`= (`Balance` + 
            (SELECT MAX(bc1.Balance)
            FROM Bitcoin bc1, Transfer_Bitcoin tb
            WHERE bc1.Public_Address = tb.Public_Address AND tb.T_ID = NEW.T_ID))
        WHERE ba1.A_ID = NEW.Buyer_A_ID;
        
        UPDATE `Bitcoin` AS ba2 SET `Balance`= (`Balance` -
            (SELECT MAX(bc2.Balance)
            FROM Bitcoin bc2, Transfer_Bitcoin tb
            WHERE bc2.Public_Address = tb.Public_Address AND tb.T_ID = NEW.T_ID))
        WHERE ba2.A_ID = NEW.Seller_A_ID;
    END IF;
END;
*/

$
DELIMITER ;
