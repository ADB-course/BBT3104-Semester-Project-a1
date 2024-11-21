-- Write your SQL code here
DELIMITER $$
CREATE PROCEDURE AddMilk (
    IN BatchNumber INT, 
    IN TypeOfMilk VARCHAR(50), 
    IN ProductionDate DATE, 
    IN ExpiryDate DATE, 
    IN Volume DECIMAL(10, 2), 
    IN DairyFarmerID INT
)
BEGIN
    INSERT INTO Milk (BatchNumber, TypeOfMilk, ProductionDate, ExpiryDate, Volume, DairyFarmerID)
    VALUES (BatchNumber, TypeOfMilk, ProductionDate, ExpiryDate, Volume, DairyFarmerID);
END$$
DELIMITER ;
