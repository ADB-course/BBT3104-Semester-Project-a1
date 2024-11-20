-- Write your SQL code here
CREATE VIEW MilkDetails AS
SELECT 
    Milk.BatchNumber, 
    Milk.TypeOfMilk, 
    Milk.ProductionDate, 
    Milk.ExpiryDate, 
    Milk.Volume, 
    DairyFarmer.FarmerName, 
    DairyFarmer.FarmLocation
FROM Milk
INNER JOIN DairyFarmer ON Milk.DairyFarmerID = DairyFarmer.FarmerID;
