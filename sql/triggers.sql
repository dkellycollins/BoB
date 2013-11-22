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
    
