DROP TABLE IF EXISTS `Transfer_Bitcoin`;
DROP TABLE IF EXISTS `Transfer`;
DROP TABLE IF EXISTS `Bitcoin`;
DROP TABLE IF EXISTS `Bank_Account`;
DROP TABLE IF EXISTS `Bitcoin_Account`;
DROP TABLE IF EXISTS `Cash_Accout`;
DROP TABLE IF EXISTS F`Account`;
DROP TABLE IF EXISTS `Customer_Log_In`;
DROP TABLE IF EXISTS `Customer`;
DROP TABLE IF EXISTS `Bank_Log_In`;
DROP TABLE IF EXISTS `Bank`;
DROP TABLE IF EXISTS `Contact_Info`;
DROP TABLE IF EXISTS `Zipcode`;

CREATE TABLE IF NOT EXISTS `Zipcode` (
    `Zip` INT NOT NULL,
    `City` VARCHAR(30) NOT NULL,
    `zState` CHAR(2) NOT NULL,
    PRIMARY KEY(`Zip`)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Contact_Info` (
    `CI_ID` INT NOT NULL AUTO_INCREMENT,
    `Phone_num` VARCHAR(12) NOT NULL,
    `Address_1` VARCHAR(50) NOT NULL,
    `Address_2` VARCHAR(50),
    `Zip` INT NOT NULL,
    PRIMARY KEY(`CI_ID`) ON DELETE CASCADE,
    FOREIGN KEY(`Zip`) REFERENCES Zipcode(`Zip`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Bank`(
    `B_ID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL,
    `Current_Bitcoin_Value` DOUBLE NOT NULL,
    `CI_ID` INT NOT NULL,
    PRIMARY KEY(`B_ID`),
    FOREIGN KEY(`CI_ID`) REFERENCES Contact_Info(`CI_ID`) ON DELETE CASCADE
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Bank_Log_In`(
    `Username` VARCHAR(30),
    `Password` VARCHAR(30),
    `B_ID` INT NOT NULL,
    PRIMARY KEY(`Username`),
    FOREIGN KEY(`B_ID`) REFERENCES Bank(`B_ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Customer`(
    `C_ID` INT NOT NULL AUTO_INCREMENT,
    `First_Name` VARCHAR(30) NOT NULL,
    `Last_Name` VARCHAR(30) NOT NULL,
    `CI_ID` INT NOT NULL,
    PRIMARY KEY (`C_ID`),
    FOREIGN KEY (`CI_ID`) REFERENCES Contact_Info(`CI_ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Customer_Log_In`(
    `Username` VARCHAR(30) NOT NULL,
    `Password` VARCHAR(30) NOT NULL,
    `C_ID` INT NOT NULL,
    PRIMARY KEY (`Username`),
    FOREIGN KEY (`C_ID`) REFERENCES Customer(`C_ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Account`(
    `A_ID` INT NOT NULL AUTO_INCREMENT,
    `Interest_rate` DOUBLE NOT NULL,
    `Balance` DOUBLE NOT NULL,
    `C_ID` INT NOT NULL,
    `B_ID` INT NOT NULL,
    PRIMARY KEY (`A_ID`),
    FOREIGN KEY (`C_ID`) REFERENCES Customer(`C_ID`) ON DELETE CASCADE,
    FOREIGN KEY (`B_ID`) REFERENCES Bank(`B_ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Cash_Account` (
    `A_ID` INT NOT NULL,
    `Withdraw_Fee` DOUBLE NOT NULL,
    `Num_free_Withdraws` INT NOT NULL,
    PRIMARY KEY (`A_ID`),
    FOREIGN KEY (`A_ID`) REFERENCES Account(`A_ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Bitcoin_Account`(
    `A_ID` INT NOT NULL,
    `Wallet_Type` VARCHAR(20) NOT NULL,
    `Processing_Fee` DOUBLE NOT NULL,
    PRIMARY KEY(`A_ID`),
    FOREIGN KEY (`A_ID`) REFERENCES Account(`A_ID`) ON DELETE CASCADE
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Bitcoin`(
    `Public_Address` CHAR(33) NOT NULL,
    `Private_Key` VARCHAR(30) NOT NULL,
    `Balance` DOUBLE NOT NULL,
    `A_ID` INT NOT NULL,
    PRIMARY KEY(`Public_Address`),
    FOREIGN KEY(`A_ID`) REFERENCES Account(`A_ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Transfer`(
    `T_ID` INT NOT NULL AUTO_INCREMENT,
    `TDate` DATE NOT NULL,
    `TTime` TIME NOT NULL,
    `Cash_transfer` DOUBLE, 
    `Buyer_A_ID` INT NOT NULL, 
    `Seller_A_ID` INT NOT NULL,
    PRIMARY KEY (`T_ID`),
    FOREIGN KEY (`Buyer_A_ID`) REFERENCES Account(`A_ID`),
    FOREIGN KEY (`Seller_A_ID`) REFERENCES Account(`A_ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Transfer_Bitcoin`(
    `T_ID` INT NOT NULL,
    `Public_Address` VARCHAR(33) NOT NULL,
    PRIMARY KEY (`T_ID`,`Public_address`),
    FOREIGN KEY (`T_ID`) REFERENCES Transfer(`T_ID`),
    FOREIGN KEY (`Public_Address`) REFERENCES Bitcoin(`Public_Address`)
) ENGINE = InnoDB;
