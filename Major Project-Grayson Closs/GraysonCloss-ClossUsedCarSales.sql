-- This Database Project was Started and Completed by Grayson Closs, with no Help from Anyone Else.

CREATE DATABASE [ClossUsedCarSales]
GO

USE [ClossUsedCarSales]
GO

CREATE TABLE Inventory(
	InvID smallint primary key IDENTITY (1000,2) NOT NULL,
	ImportID smallint NULL,
	RepairID smallint NULL,
	VehicleID smallint NULL,
	AdvertisingID smallint NULL,
	FinanceID smallint null,
	PartID smallint null,
	EmployeeID smallint null,
	CustomerID smallint null,
	SaleID smallint null,
 )
 

 CREATE TABLE Advertising(
	AdvertisingID smallint primary key IDENTITY (2000,3) NOT NULL,
	Type varchar(20) NOT NULL,
	Cost decimal(18,2) NOT NULL,
	FeedBack varchar(255) NULL,
	StartDate date NOT NULL,
	EndDate date null,
 )
 

CREATE TABLE Imports(
	ImportID smallint primary key IDENTITY (3000,4) NOT NULL,
	Cost decimal(18, 2) NOT NULL,
	Make varchar(15) NOT NULL,
	Model varchar(15) NOT NULL,
	Transmission varchar(9) NOT NULL,
	Year date NOT NULL,
	Vin varchar(17) NOT NULL,
	Milage int NOT NULL,
	Condition varchar(7) NULL,
	Doors char(1) NOT NULL,
 )
 

 CREATE TABLE VehicleType(
	VehicleID smallint primary key IDENTITY (4000,5) NOT NULL,
	ImportID smallint not null,
	SRP decimal(18,2) NOT NULL,
	Cleaning bit NOT NULL,
	Salvage bit NOT NULL,
) 


CREATE TABLE Customers(
	CustomerID smallint primary key IDENTITY (5000,6) NOT NULL,
	FinanceID smallint NULL,
	SaleID smallint null,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	PhoneNumber varchar(20) NULL,
	Address varchar(20) Not NULL,
	PostalCode varchar(7) Not NULL,
	City varchar(20) NULL,
	Province varchar(20) NULL,
	Country varchar(20) NULL,
	Returning bit NOT NULL,
 )


CREATE TABLE Finance(
	FinanceID smallint primary key IDENTITY (6000,7) NOT NULL,
	DownPayment decimal(18,2) NOT NULL,
	InterestType char(11)  NULL,
	PaymentType char(20) null,
	[interest(%)] varchar(3) NULL,
	PaymentsAmount decimal(18,2) NULL,
	TotalOwed decimal(18,2) NOT NULL,
	FeesPaid decimal (18,2) null,
 )


CREATE TABLE Parts(
	PartID smallint primary key IDENTITY (7000,8) NOT NULL,
	Name varchar(30) NOT NULL,
	Quantity varchar(20) NOT NULL,
	Price decimal(18, 2) NOT NULL,
)


CREATE TABLE Repairs(
	RepairID smallint primary key IDENTITY (8000,9) NOT NULL,
	VehicleID smallint not NULL,
	EmployeeID smallint not null,
	PartID smallint not NULL,
	Problems varchar(max) NULL,
	TireQuality char(7) NOT NULL,
	OilQuality char(7) NOT NULL,
	Status char(7) NOT NULL,
	Notes varchar(max) NULL,
)


CREATE TABLE Employees(
	EmployeeID smallint primary key IDENTITY(9000,2) NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(20) NOT NULL,
	Email nvarchar(30) NOT NULL,
	PhoneNumber varchar(20) NOT NULL,
	Title varchar(15) NOT NULL,
	HireDate date NOT NULL,
	Address varchar(20) NOT NULL,
	PostalCode varchar(7) NOT NULL,
	City varchar(15) NOT NULL,
	Province varchar(20) not NULL,
	Country varchar(20) NULL,
)


CREATE TABLE Sale(
	SaleID smallint primary key IDENTITY (1000,3) NOT NULL,
	VehicleID smallint not null,
	EmployeeID smallint not null,
	Commission decimal(18, 2) NULL,
	SalePrice decimal(18,2) NOT NULL,
	Discount decimal(18, 2) NULL,
	SaleDate date NOT NULL,
)
GO


ALTER TABLE Customers ADD  CONSTRAINT DF_Customers_Country  DEFAULT (N'Canada') FOR Country


ALTER TABLE Employees ADD  CONSTRAINT DF_Employees_Country  DEFAULT (N'Canada') FOR Country


SET IDENTITY_INSERT Advertising ON
insert into Advertising (AdvertisingID, Type, Cost, FeedBack, StartDate, EndDate) 
Values (2003,'BillBoard', 10000.12, 'Well Recieved', '2020-11-07', '2020-12-26'),
(2006, 'Plane', 45000.36, 'Cloudy Day', '2020-07-05', '2020-08-05'),
(2009, 'BillBoard', 8000.00, 'Sign fell down after 2 weeks', '2019-08-13', '2019-10-24'),
(2012, 'EBillBoard', 28350.67, 'cant tell', '2018-03-16', '2019-08-11')
SET IDENTITY_INSERT Advertising OFF
SET IDENTITY_INSERT Imports ON
insert into Imports (ImportID, Cost, Make, Model, Transmission, Year, Vin, Milage, Condition, Doors)
Values (3004, 25661, 'Honda', 'Accord LX', 'Auto', '2018', 'JM3KE4CY6F0438668', 74613, 'Perfect', 4),
(3008, 18495, 'Honda', 'Civic EX', 'Auto', '2017', '4T1BF1FK3EU721821', 80781, 'Perfect', 4),
(3012, 3000, 'Hyundai', 'Sonota', 'Manual', '2012', '1FDZA90W7TVA33335', 260000, 'Poor', 4),
(3016, 4000, 'Hyundai', 'Accent', 'Auto', '2014', '1HTMMAAL47H366756', 181000, 'Fair', 4),
(3020, 41493, 'Mercedes', 'C-Class', 'Auto', '2020', 'JH4DB7640SS009074', 24236, 'Perfect', 4)
SET IDENTITY_INSERT Imports OFF
SET IDENTITY_INSERT VehicleType ON
insert into VehicleType (VehicleID, ImportID, SRP, Cleaning, Salvage)
Values (4005, 3004, 30000, 0, 0),
(4010, 3008, 20000, 0, 0),
(4015, 3012, 4000, 0, 0),
(4020, 3016, 6000, 0, 0),
(4025, 3020, 45000, 1, 0)
SET IDENTITY_INSERT VehicleType OFF
SET IDENTITY_INSERT Employees ON
insert into Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, Title, HireDate, Address, PostalCode, City, Province)
Values (9002,'Grayson', 'Closs', 'Grayson@usedcarsales.ca','905-720-2565', 'Owner', '2021-10-6', '4 worthington Drive', 'L1E3A4','Courtice', 'Ontario'),
(9004, 'Jeffrey', 'Emert', 'Jeffrey@usedcarsales.ca', '416-985-3371', 'Manager', '2021-10-7', '3815 Merton Street', 'M1L3K7', 'Toronto', 'Ontario'),
(9006, 'Chad', 'Gomez', 'Chad@usedcarsales.ca', '613-217-5367', 'SalesPerson', '2021-10-25', '1868 Ross Street', 'K7L4V4', 'Kingston', 'Ontario'),
(9009, 'Donald', 'Wimberly', 'Donald@usedcarsales', '416-887-4520', 'Mechanic', '2021-11-16', '4065 Bay Street', 'M5J2R8', 'Toronto', 'Ontario')
SET IDENTITY_INSERT Employees OFF
SET IDENTITY_INSERT Finance ON
insert into Finance (FinanceID, DownPayment, InterestType, PaymentType, [interest(%)], PaymentsAmount, TotalOwed, FeesPaid)
Values (6007, 3000, 'Simple', 'Monthly', 0, 200, 12000, 12000),
(6014, 5000, 'compounding', 'Monthly', 12, 600, 25000, 15000),
(6021, 4000, Null, Null, Null, Null, 0, 4000 ),
(6028, 2000, 'Simple', 'Quarterly', 8, 1000, 4000, 1000)
SET IDENTITY_INSERT Finance OFF
SET IDENTITY_INSERT Customers ON
insert into Customers (CustomerID, FinanceID, SaleID, FirstName, LastName, PhoneNumber, Address, PostalCode, City, Province, Returning)
Values (5006,6007,1003,'Grayson', 'Closs', '905-720-2565', '4 worthington Drive', 'L1E3A4','Courtice', 'Ontario', 1),
(5012,6014,1006,'Phyllis', 'Campbell', '613-930-3437', '247 Pitt Street', 'K6J3R2', 'Cornwall', 'Ontario', 0),
(5018,6021,1009,'Kevin', 'Rivers', '519-237-3569', '2841 Fallon Drive', 'N0M1N0', 'Dashwood', 'Ontario', 0),
(5024,6028,1012,'Barry', 'Eubanks', '416-872-0979', '1463 Younge Street', 'M4W1J7', 'Toronto', 'Ontario', 0)
SET IDENTITY_INSERT Customers OFF
SET IDENTITY_INSERT Parts ON
insert into Parts (PartID, Name, Quantity, Price)
Values (7008, 'CV-Axel', 1, 80),
(7016, 'Wheel Bearing', 3, 90),
(7024, 'Ball Joint', 1, 20),
(7032, 'Transmission', 1, 3000)
SET IDENTITY_INSERT Parts OFF
SET IDENTITY_INSERT Repairs ON
insert into Repairs (RepairID, VehicleID, EmployeeID, PartID, Problems, TireQuality, OilQuality, Status, Notes)
Values (8009, 4025, 9009, 7032, 'Transmission is shot, becasue kevin took it for a joy ride', 'Great', 'Good', 'FUBAR', 'we should fire kevin, this was a nice car')
SET IDENTITY_INSERT Repairs OFF
SET IDENTITY_INSERT Sale ON
insert into Sale (SaleID, VehicleID, EmployeeID, Commission, SalePrice, Discount, SaleDate)
values (1003, 4010, 9002, 0, 15000, 5000, '2021-7-05'),
(1006, 4005, 9004, 3000, 30000, 0, '2021-8-09'),
(1009, 4015, 9004, 200, 4000, 0, '2021-8-10'),
(1012, 4020, 9004, 800, 6000, 0, '2021-9-24')
SET IDENTITY_INSERT Sale OFF
GO

ALTER TABLE Sale with check ADD CONSTRAINT FK_Sale_VehicleID FOREIGN KEY (VehicleID)
REFERENCES VehicleType (VehicleID) on update cascade


Alter Table sale with check add constraint FK_Sale_EmployeeID Foreign Key (EmployeeID)
References Employees (EmployeeID) on update cascade


ALTER TABLE Repairs with check ADD CONSTRAINT FK_Repairs_VehicleID FOREIGN KEY (VehicleID)
REFERENCES VehicleType (VehicleID) on update cascade


ALTER TABLE Repairs with check ADD CONSTRAINT FK_Repairs_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employees (EmployeeID) on update cascade


ALTER TABLE Repairs with check ADD CONSTRAINT FK_Repairs_PartsID FOREIGN KEY (PartID)
REFERENCES Parts (PartID) on update cascade


ALTER TABLE Customers with check ADD CONSTRAINT FK_Customers_FinanceID Foreign KEY (FinanceID)
REFERENCES Finance (FinanceID) on update cascade


ALTER TABLE Customers with check ADD CONSTRAINT FK_Customers_SaleID Foreign KEY (SaleID)
REFERENCES Sale (SaleID) on update cascade


ALTER TABLE VehicleType with check ADD CONSTRAINT FK_VehicleType_ImportID FOREIGN KEY (ImportID)
REFERENCES Imports (ImportID) on update cascade


ALTER TABLE Inventory  ADD  CONSTRAINT FK_Inventory_Imports FOREIGN KEY(ImportID)
REFERENCES Imports (ImportID) 


ALTER TABLE Inventory  ADD  CONSTRAINT FK_Inventory_Repairs FOREIGN KEY(RepairID)
REFERENCES Repairs (RepairID) 


ALTER TABLE Inventory  ADD  CONSTRAINT FK_Inventory_VehicleType FOREIGN KEY(VehicleID)
REFERENCES VehicleType (VehicleID)
  

ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_AdvertisingID FOREIGN KEY(AdvertisingID)
REFERENCES Advertising (AdvertisingID)


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_FinanceID FOREIGN KEY (FinanceID)
REFERENCES Finance (FinanceID) 


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_PartID FOREIGN KEY (PartID)
REFERENCES Parts (PartID)


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_EmployeeID FOREIGN KEY (EmployeeID)
REFERENCES Employees (EmployeeID)


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_CustomerID FOREIGN KEY (CustomerID)
REFERENCES Customers (CustomerID)


ALTER TABLE Inventory ADD CONSTRAINT FK_Inventory_SaleID FOREIGN KEY (SaleID)
REFERENCES Sale (SaleID)
GO

