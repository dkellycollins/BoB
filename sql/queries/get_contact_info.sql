SELECT Phone,_Num, Address_1, Address_2, Zip, City, State
FROM Contact_Info, Zipcode
WHERE Contact_Info.C_ID = ?
    AND Contact_Info.Zip = Zipcode.Zip