-- Write your SQL code here
--tables without check constraints
CREATE DATABASE brookside_project; 
USE brookside_project;

-- Create Milk table
CREATE TABLE Milk (
    BatchNumber INT PRIMARY KEY,
    TypeOfMilk VARCHAR(50) NOT NULL,
    ProductionDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Volume DECIMAL(10, 2) NOT NULL,
    DairyFarmerID INT NOT NULL
) ENGINE=InnoDB;

-- Create DairyFarmer table
CREATE TABLE DairyFarmer (
    FarmerID INT PRIMARY KEY,
    FarmerName VARCHAR(100) NOT NULL,
    FarmLocation VARCHAR(255) NOT NULL,
    ProductionCapacity DECIMAL(10, 2),
    MilkQualityRating DECIMAL(5, 2)
) ENGINE=InnoDB;

-- Add Index for Dairy Farmer
CREATE INDEX idx_dairy_farmer ON DairyFarmer (FarmerName);


--table with check constraints
-- Adding Supplier Table with Check Constraint
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInformation VARCHAR(255),
    SupplyFrequency ENUM('Weekly', 'Monthly', 'Biweekly') NOT NULL,
    SupplierRating INT NOT NULL CHECK (SupplierRating BETWEEN 1 AND 5)
) ENGINE=InnoDB;

-- Adding Product Table with Check Constraint
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductCategory VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    ExpirationDate DATE NOT NULL
) ENGINE=InnoDB;

