INSERT INTO `Account` VALUES (0,0.0,0,0);
/* Result
ERROR 1136 (21S01): Column count doesn't match value count at row 1
*/

UPDATE `Account` SET `A_ID`=0
WHERE `A_ID` = 1;
/* Result
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`c9_dev`.`Cash_Account`, CONSTRAINT `Cash_Account_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `Account` (`A_ID`) ON DELETE CASCADE)
*/

INSERT INTO `Account` VALUE (6, 0.0,0,-1);
/* Result
ERROR 1136 (21S01): Column count doesn't match value count at row 1
*/

UPDATE `Account` SET `C_ID`=767854323456
WHERE `A_ID`=1;
/* Result
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`c9_dev`.`Account`, CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `Customer` (`C_ID`) ON DELETE CASCADE)
*/

DELETE FROM `Customer`
WHERE `A_ID` = 0;
/* Result
ERROR 1054 (42S22): Unknown column 'A_ID' in 'where clause'
*/
