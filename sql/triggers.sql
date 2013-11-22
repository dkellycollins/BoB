DELIMETER $
CREATE TRIGGER transfer_trig AFTER INSERT ON Transfer
FOR EACH ROW
BEGIN
  IF EXISTS (SELECT * FROM Bitcoin where A_ID = New.Buyer_A_id) THEN
    UPDATE Bitcoin SET Balance = (New.Balance + Bitcoin.Balance) WHERE Bitcoin.A_ID = New.Buyer_ID;
    UPDATE Bitcoin SET Balance = (Bitcoin.Balance - New.Balance) WHERE Bitcoin.A_ID = New.Seller_ID;
  ELSE
    UPDATE Account SET Balance = (New.Balance + Account.Balance) WHERE Account.A_ID = New.Buyer_ID;
    UPDATE Account SET Balance = (Account.Balance - New.Balance) WHERE Account.A_ID = New.Seller_ID;
  END IF;
  END;
$
DELIMITER ;
    

delimiter |
CREATE TRIGGER `Upd_Balances` AFTER UPDATE ON `Bank`
FOR EACH ROW
BEGIN
    IF NEW.Current_Bitcoin_Value <> OLD.Current_Bitcoin_Value THEN
        UPDATE `Account` AS ac SET `Balace` = (Balance *(NEW.Current_Bitccoin_Value/OLD.Current_Bitccoin_Value))
        WHERE EXISTS ( SELECT *
                        FROM `Bitcoin_Account` AS ba
                        WHERE ac.B_ID= NEW.B_ID AND ac.A_ID = ba.A_ID);
    END IF;
END;
|
delimiter ;
