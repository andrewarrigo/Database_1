--Andrew Arrigo
--Final Project

DROP TABLE IF EXISTS Vehicle_Records;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Card_Info;
DROP TABLE IF EXISTS Payment_Methods;
DROP TABLE IF EXISTS Customer_Trip_Invoice;
DROP TABLE IF EXISTS Trip;
DROP TABLE IF EXISTS Pickup_Request;
DROP TABLE IF EXISTS Driver;
DROP TABLE IF EXISTS User_Info;
DROP TABLE IF EXISTS Ride_Request;
DROP TABLE IF EXISTS Address_Book;
DROP TABLE IF EXISTS Zip_Codes;
DROP TABLE IF EXISTS Driver_Accounts;
DROP TABLE IF EXISTS Driver_Deposits;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Classifications;



--User_Info TABLE
CREATE TABLE User_Info(
userID int NOT NULL,
firstName text NOT NULL,
lastName text NOT NULL,
email text NOT NULL,
phoneNumber text NOT NULL,
password text NOT NULL,
registerDate date NOT NULL,
PRIMARY KEY (userID)
)
;

--Payment_Methods TABLE
CREATE TABLE Payment_Methods(
payID int NOT NULL,
userID int NOT NULL,
PRIMARY KEY (payID)
)
;

--Ride_Request TABLE
CREATE TABLE Ride_Request(
rideReqID int NOT NULL,
userID int NOT NULL,
destinationAddress text NOT NULL,
destinationZipCode varchar(5) NOT NULL,
ride_type text NOT NULL,
PRIMARY KEY (rideReqID)
)
;


--Driver TABLE
CREATE TABLE Driver(
userID int NOT NULL references user_info(userID),
firstName text NOT NULL,
lastName text NOT NULL,
birthYear text NOT NULL,
SSN varchar(11),
yearsDrivingUS int NOT NULL,
licenseNumber varchar(8) NOT NULL,
starRating int,
PRIMARY KEY (userID)
)
;

--Pickup_Request TABLE
CREATE TABLE Pickup_Request(
pickupReqID int NOT NULL,
userID int NOT NULL references Driver(userID),
VID int NOT NULL,
pickupAddress text NOT NULL,
pickupZipCode text NOT NULL,
accepted boolean,
PRIMARY KEY (pickupReqID)
)
;


--Trip TABLE
CREATE TABLE Trip(
TID int NOT NULL,
rideReqID int NOT NULL references Ride_Request(rideReqID),
pickupReqID int NOT NULL references Pickup_Request(pickupReqID),
fare decimal (5,2),
totalTime int NOT NULL,
totalDistance int NOT NULL,
PRIMARY KEY (TID)
)
;


--Customer TABLE
CREATE TABLE Customer(
userID int NOT NULL references User_Info(userID),
savedAddressID int NOT NULL,
pandoraAccount varchar,
starRating int,
PRIMARY KEY (userID)
)
;

--Card_Info TABLE
CREATE TABLE Card_Info(
payID int NOT NULL references Payment_Methods(payID),
cardNumber varchar(16) NOT NULL,
cardType text NOT NULL,
expirationMonth int NOT NULL,
expirationYear int NOT NULL,
securityCode int NOT NULL,
country text NOT NULL,
PRIMARY KEY (payID)
)
;

--Customer_Trip_Invoice TABLE
CREATE TABLE Customer_Trip_Invoice(
TID int NOT NULL references Trip(TID), 
totalAmount_USD decimal (5,2) NOT NULL,
userID int NOT NULL,
trip_date date NOT NULL,
payID int NOT NULL,
PRIMARY KEY (TID)
)
;

--Zip_Codes TABLE
CREATE TABLE Zip_Codes(
zipCode varchar(5) NOT NULL,
city text NOT NULL,
state text NOT NULL,
PRIMARY KEY (zipCode)
)
;

--Address_Book TABLE
CREATE TABLE Address_Book(
savedAddressID int NOT NULL,
address text NOT NULL,
zipCode varchar(5) references Zip_Codes(zipCode) NOT NULL,
PRIMARY KEY (savedAddressID)
)
;


--Driver_Accounts TABLE
CREATE TABLE Driver_Accounts(
accountID int NOT NULL,
userID int NOT NULL,
bank text NOT NULL,
bankNumber varchar(10),
PRIMARY KEY (accountID)
)
;

--Driver_Deposits TABLE
CREATE TABLE Driver_Deposits(
depositID int NOT NULL,
accountID int NOT NULL,
amount_USD decimal (5,2) NOT NULL,
date date NOT NULL,
PRIMARY KEY (depositID)
)
;

--Vehicle TABLE
CREATE TABLE Vehicle(
VID int NOT NULL,
VIN int NOT NULL,
licensePlate varchar NOT NULL,
year text NOT NULL,
make text NOT NULL,
model text NOT NULL,
color text NOT NULL,
PRIMARY KEY (VID)
)
;

--Classifications TABLE
CREATE TABLE Classifications(
type text NOT NULL,
maxPassengers int NOT NULL,
PRIMARY KEY (type)
)
;

--Vehicle_Records TABLE
CREATE TABLE Vehicle_Records(
VID int NOT NULL,
userID int NOT NULL references Driver(userID),
type text NOT NULL references Classifications(type),
PRIMARY KEY (VID)
)
;

INSERT INTO User_Info VALUES (1,'Alan','Labouseur','alanrocks@gmail.com',5559171111,'password123','2011-10-05 00:00:00');
INSERT INTO User_Info VALUES (2,'Tien','Pierdon','pierdon@marist.edu',5558283333,'labAssistant1','2015-07-26 00:00:00');
INSERT INTO User_Info VALUES (3,'Rob','Cannistra','rob.cannistra@marist.edu',5556462300,'ducks14','2014-09-17 00:00:00');
INSERT INTO User_Info VALUES (4,'Carolyn','Matheus','cmatheus@marist.edu',8458889031,'sysDes323','2017-04-12 00:00:00');
INSERT INTO User_Info VALUES (5,'Joe','Kirtland','jkirt57@gmail.com',2320049958,'discreteMath99','2016-10-13 00:00:00');
INSERT INTO User_Info VALUES (6,'John','Smith','jsmith12@yahoo.com',2912304013,'soccer1','2015-10-01 00:00:00');
INSERT INTO User_Info VALUES (7,'Mike','Miller','mmills236@gmail.com',1922393044,'Password2','2012-03-24 00:00:00');
INSERT INTO User_Info VALUES (8,'Derek','Jeter','dj2@gmail.com',3029499302,'yankees2012','2013-01-23 00:00:00');
INSERT INTO User_Info VALUES (9,'John','Snow','js665@aol.com',3202485872,'GoT17','2010-03-06 00:00:00');
INSERT INTO User_Info VALUES (10,'Matt','Green','green29@gmail.com',1222384995,'green213','2012-04-02 00:00:00');
INSERT INTO User_Info VALUES (11,'Mike','Jordan','mj23@gmail.com',2394828313,'jordan21','2009-02-19 00:00:00');
INSERT INTO User_Info VALUES (12,'John','Depp','jdepp1212@gmail.com',2314986745,'captainSparrow','2010-12-30 00:00:00');
INSERT INTO User_Info VALUES (13,'Chris','Rock','crock@gmail.com',3423218432,'nym17','2013-07-15 00:00:00');
INSERT INTO User_Info VALUES (14,'Mike','Tyson','mikeyt@gmail.com',2415345986,'knockout123','2013-03-16 00:00:00');
INSERT INTO User_Info VALUES (15,'Jordan','Belfort','jmoney@yahoo.com',4342093929,'jordanlovesmoney','2011-04-25 00:00:00');
INSERT INTO User_Info VALUES (16,'Mark','Miller','mm12124@gmail.com',5872909432,'iloveshoes3','2016-09-10 00:00:00');
INSERT INTO User_Info VALUES (17,'Flat','Stan','flatStan1@gmail.com',2718917455,'paper212','2015-02-01 00:00:00');
INSERT INTO User_Info VALUES (18,'Stewie','Griffin','thegrif@gmail.com',2328988981,'stewie2123','2017-02-17 00:00:00');
INSERT INTO User_Info VALUES (19,'Oliver','Green','oc99@gmail.com',2310910911,'arrow123','2016-08-15 00:00:00');
INSERT INTO User_Info VALUES (20,'Phil ','Collins','phil43@gmail.com',1298198213,'drummer21','2013-10-11 00:00:00');


INSERT INTO Payment_Methods VALUES (1,1);
INSERT INTO Payment_Methods VALUES (2,2);
INSERT INTO Payment_Methods VALUES (3,3);
INSERT INTO Payment_Methods VALUES (4,4);
INSERT INTO Payment_Methods VALUES (5,5);
INSERT INTO Payment_Methods VALUES (6,6);
INSERT INTO Payment_Methods VALUES (7,7);
INSERT INTO Payment_Methods VALUES (8,8);
INSERT INTO Payment_Methods VALUES (9,9);
INSERT INTO Payment_Methods VALUES (10,10);

INSERT INTO Ride_Request VALUES (1,1,'122 Woodlawn Dr',11001,'Uber XL');
INSERT INTO Ride_Request VALUES (2,2,'6 Pulaski St',11601,'Uber X');
INSERT INTO Ride_Request VALUES (3,3,'70 Bowman St',16074,'Uber XL');
INSERT INTO Ride_Request VALUES (4,4,'82 Violet Ave',12301,'Uber Select');
INSERT INTO Ride_Request VALUES (5,5,'3399 North Road',12601,'UberBLACK');
INSERT INTO Ride_Request VALUES (6,6,'21 Celtic Dr',11820,'Uber X');
INSERT INTO Ride_Request VALUES (7,7,'222 Primrose Ave',11001,'UberBLACK');
INSERT INTO Ride_Request VALUES (8,8,'55 Hinsdale Ave',82380,'UberXL');
INSERT INTO Ride_Request VALUES (9,9,'930 Plainfield Ave',12301,'UberSelect');
INSERT INTO Ride_Request VALUES (10,10,'11 Fairview St',11601,'UberSelect');

INSERT INTO Customer VALUES (1,1,'alanrocks@gmail.com',NULL);
INSERT INTO Customer VALUES (2,2, NULL,'3');
INSERT INTO Customer VALUES (3,3, NULL,'5');
INSERT INTO Customer VALUES (4,4, NULL,'5');
INSERT INTO Customer VALUES (5,5,'jkirt57@gmail.com',NULL);
INSERT INTO Customer VALUES (6,6,'NULL',NULL);
INSERT INTO Customer VALUES (7,7,'NULL',NULL);
INSERT INTO Customer VALUES (8,8,'NULL',NULL);
INSERT INTO Customer VALUES (9,9,'NULL',NULL);
INSERT INTO Customer VALUES (10,10,'NULL',NULL);


INSERT INTO Zip_Codes VALUES (11001,'Floral Park','NY');
INSERT INTO Zip_Codes VALUES (11601,'Middletown','NJ');
INSERT INTO Zip_Codes VALUES (82380,'Hartford','CT');
INSERT INTO Zip_Codes VALUES (12301,'Malboro','CT');
INSERT INTO Zip_Codes VALUES (12601,'Poughkeepsie','NY');


INSERT INTO Driver VALUES (11,'Mike','Jordan',1995,5076138498,6,'GYG-8192','4');
INSERT INTO Driver VALUES (12,'John','Depp',1994,4817728073,5,'ACL-1329','4');
INSERT INTO Driver VALUES (13,'Chris','Rock',1992,4913607312,2,'RNT-2391','5');
INSERT INTO Driver VALUES (14,'Mike','Tyson',1993,9026607036,4,'PTC-3990','2');
INSERT INTO Driver VALUES (15,'Jordan','Belfort',1994,3567709752,3,'RPS-1573','3');
INSERT INTO Driver VALUES (16,'Mark','Miller',1995,2309210984,6,'SIC-3928','3');
INSERT INTO Driver VALUES (17,'Flat','Stan',1986,2981049021,7,'FNW-1928','4');
INSERT INTO Driver VALUES (18,'Stewie','Griffin',1985,5389068398,7,'EMV-3105',NULL);
INSERT INTO Driver VALUES (19,'Oliver','Green',1989,2325960293,3,'FNV-3948','4');
INSERT INTO Driver VALUES (20,'Phil ','Collins',1990,5347758295,2,'VBG-3119','5');



INSERT INTO Trip VALUES (1,1,1,60.00,65,25);
INSERT INTO Trip VALUES (2,2,2,18.00,20,10);
INSERT INTO Trip VALUES (3,3,3,26.00,30,15);
INSERT INTO Trip VALUES (4,4,4,32.00,37,19);
INSERT INTO Trip VALUES (5,5,5,50.00,31,22);
INSERT INTO Trip VALUES (6,6,6,48.00,29,28);
INSERT INTO Trip VALUES (7,7,7,12.00,6,3);
INSERT INTO Trip VALUES (8,8,8,19.00,16,10);
INSERT INTO Trip VALUES (9,9,9,22.00,20,13);
INSERT INTO Trip VALUES (10,10,10,90.00,75,65);

INSERT INTO Pickup_Request VALUES (1,11,100,'32 Charleston St',11001,True);
INSERT INTO Pickup_Request VALUES (2,12,200,'14 Baker Rd',11601,True);
INSERT INTO Pickup_Request VALUES (3,13,300,'50 Lake St',82380,True);
INSERT INTO Pickup_Request VALUES (4,14,400,'192 Lowell Ave',12301,False);
INSERT INTO Pickup_Request VALUES (5,15,500,'35 West Cedar St',12601,True);
INSERT INTO Pickup_Request VALUES (6,16,600,'16 Orchard St',11820,False);
INSERT INTO Pickup_Request VALUES (7,17,700,'9 Royal Rd',11001,False);
INSERT INTO Pickup_Request VALUES (8,18,800,'18 East St',82380,True);
INSERT INTO Pickup_Request VALUES (9,19,900,'123 Brady Pl',12301,True);
INSERT INTO Pickup_Request VALUES (10,20,1000,'44 Charles St',11601,True);



INSERT INTO Customer_Trip_Invoice VALUES (1,60,1,'2012-05-14 00:00:00',1);
INSERT INTO Customer_Trip_Invoice VALUES (2,18,2,'2016-01-19 00:00:00',2);
INSERT INTO Customer_Trip_Invoice VALUES (3,26,3,'2015-02-24 00:00:00',3);
INSERT INTO Customer_Trip_Invoice VALUES (4,32,4,'2017-04-19 00:00:00',4);
INSERT INTO Customer_Trip_Invoice VALUES (5,50,5,'2016-12-24 00:00:00',5);
INSERT INTO Customer_Trip_Invoice VALUES (6,48,6,'2015-09-21 00:00:00',6);
INSERT INTO Customer_Trip_Invoice VALUES (7,12,7,'2017-01-03 00:00:00',7);
INSERT INTO Customer_Trip_Invoice VALUES (8,19,8,'2014-03-20 00:00:00',8);
INSERT INTO Customer_Trip_Invoice VALUES (9,22,9,'2015-04-17 00:00:00',9);
INSERT INTO Customer_Trip_Invoice VALUES (10,90,10,'2016-08-03 00:00:00',10);





INSERT INTO Address_Book VALUES (1,'32 Charleston St',11001);
INSERT INTO Address_Book VALUES (2,'14 Baker Rd',11601);
INSERT INTO Address_Book VALUES (3,'50 Lake St',82380);
INSERT INTO Address_Book VALUES (4,'192 Lowell Ave',12301);
INSERT INTO Address_Book VALUES (5,'35 West Cedar St',12601);
INSERT INTO Address_Book VALUES (6,'35 West Cedar St',12601);
INSERT INTO Address_Book VALUES (7,'16 Orchard St',11601);
INSERT INTO Address_Book VALUES (8,'9 Royal Rd',11001);
INSERT INTO Address_Book VALUES (9,'18 East St',82380);
INSERT INTO Address_Book VALUES (10,'123 Brady Pl',12301);



INSERT INTO Ride_Request VALUES (1,1,'122 Woodlawn Dr',11001,'Uber XL');
INSERT INTO Ride_Request VALUES (2,2,'6 Pulaski St',11601,'Uber X');
INSERT INTO Ride_Request VALUES (3,3,'70 Bowman St',16074,'Uber XL');
INSERT INTO Ride_Request VALUES (4,4,'82 Violet Ave',12301,'Uber Select');
INSERT INTO Ride_Request VALUES (5,5,'3399 North Road',12601,'UberBLACK');
INSERT INTO Ride_Request VALUES (6,6,'21 Celtic Dr',11820,'Uber X');
INSERT INTO Ride_Request VALUES (7,7,'222 Primrose Ave',11001,'UberBLACK');
INSERT INTO Ride_Request VALUES (8,8,'55 Hinsdale Ave',82380,'UberXL');
INSERT INTO Ride_Request VALUES (9,9,'930 Plainfield Ave',12301,'UberSelect');
INSERT INTO Ride_Request VALUES (10,10,'11 Fairview St',11601,'UberSelect');



INSERT INTO Driver_Accounts VALUES (1,11,'Chase',7168303902);
INSERT INTO Driver_Accounts VALUES (2,12,'Citi',8551623839);
INSERT INTO Driver_Accounts VALUES (3,13,'Chase',6056698597);
INSERT INTO Driver_Accounts VALUES (4,14,'Capital One',4628778440);
INSERT INTO Driver_Accounts VALUES (5,15,'TD',3643465760);
INSERT INTO Driver_Accounts VALUES (6,16,'Chase',2210293042);
INSERT INTO Driver_Accounts VALUES (7,17,'Chase',3010453432);
INSERT INTO Driver_Accounts VALUES (8,18,'TD',3231162273);
INSERT INTO Driver_Accounts VALUES (9,19,'Capital One',4859603050);
INSERT INTO Driver_Accounts VALUES (10,20,'Citi',2774857361);




INSERT INTO Card_Info VALUES (1,3649628007836510,'amex',10,18,533,'United States');
INSERT INTO Card_Info VALUES (2,5104608789353070,'visa',9,21,164,'United States');
INSERT INTO Card_Info VALUES (3,1966719702436230,'amex',11,19,561,'United States');
INSERT INTO Card_Info VALUES (4,5716243512260780,'amex',2,19,611,'United States');
INSERT INTO Card_Info VALUES (5,919651217963853,'visa',4,18,877,'United States');
INSERT INTO Card_Info VALUES (6,1562241614875060,'mastercard',5,18,234,'United States');
INSERT INTO Card_Info VALUES (7,2146428822167530,'mastercard',6,18,324,'United States');
INSERT INTO Card_Info VALUES (8,8474079649437300,'visa',2,19,643,'United States');
INSERT INTO Card_Info VALUES (9,8972080430034170,'amex',1,19,184,'United States');
INSERT INTO Card_Info VALUES (10,2926337426627140,'visa',11,20,505,'United States');



INSERT INTO Driver_Deposits VALUES (1,1,60,'2012-05-14 00:00:00');
INSERT INTO Driver_Deposits VALUES (2,2,18,'2016-01-19 00:00:00');
INSERT INTO Driver_Deposits VALUES (3,3,26,'2015-02-24 00:00:00');
INSERT INTO Driver_Deposits VALUES (4,4,32,'2017-04-19 00:00:00');
INSERT INTO Driver_Deposits VALUES (5,5,50,'2016-12-24 00:00:00');
INSERT INTO Driver_Deposits VALUES (6,6,48,'2015-09-21 00:00:00');
INSERT INTO Driver_Deposits VALUES (7,7,12,'2017-01-03 00:00:00');
INSERT INTO Driver_Deposits VALUES (8,8,19,'2014-03-20 00:00:00');
INSERT INTO Driver_Deposits VALUES (9,9,22,'2015-04-17 00:00:00');
INSERT INTO Driver_Deposits VALUES (10,10,90,'2016-08-03 00:00:00');


INSERT INTO Vehicle VALUES (100,100,'GYG-8192',2015,'Honda','Pilot','Black');
INSERT INTO Vehicle VALUES (200,200,'ACL-1329',2015,'Acura','RXT','White');
INSERT INTO Vehicle VALUES (300,300,'RNT-2391',2009,'Toyota','Camry','Black');
INSERT INTO Vehicle VALUES (400,400,'PTC-3990',2011,'Kia','Optima','White');
INSERT INTO Vehicle VALUES (500,500,'RPS-1573',2014,'Cadillac','Escalade','Black');
INSERT INTO Vehicle VALUES (600,600,'SIC-3928',2016,'Cadillac','Escalade','Black');
INSERT INTO Vehicle VALUES (700,700,'FNW-1928',2015,'Kia','Optima','Red');
INSERT INTO Vehicle VALUES (800,800,'EMV-3105',2012,'Subaru','WRX','Blue');
INSERT INTO Vehicle VALUES (900,900,'FNV-3948',2014,'Jaguar','F-Type','White');
INSERT INTO Vehicle VALUES (1000,1000,'VBG-3119',2016,'Tesla','Model X','Black');

INSERT INTO Vehicle_Records VALUES (100,11,'Uber XL');
INSERT INTO Vehicle_Records VALUES (200,12,'Uber X');
INSERT INTO Vehicle_Records VALUES (300,13,'Uber XL');
INSERT INTO Vehicle_Records VALUES (400,14,'Uber Select');
INSERT INTO Vehicle_Records VALUES (500,15,'UberBLACK');
INSERT INTO Vehicle_Records VALUES (600,16,'Uber X');
INSERT INTO Vehicle_Records VALUES (700,17,'UberBLACK');
INSERT INTO Vehicle_Records VALUES (800,18,'Uber XL');
INSERT INTO Vehicle_Records VALUES (900,19,'Uber Select');
INSERT INTO Vehicle_Records VALUES (1000,20,'Uber Select');

INSERT INTO Classifications VALUES ('Uber XL',8);
INSERT INTO Classifications VALUES ('Uber X',4);
INSERT INTO Classifications VALUES ('Uber Select',6);
INSERT INTO Classifications VALUES ('UberBLACK',4);

--Views

CREATE VIEW showAddress
AS SELECT Customer.userID, Address_Book.address
FROM Customer, Address_Book
WHERE customer.savedAddressID = address_book.savedAddressID;


CREATE VIEW DriverInfo
AS SELECT Driver.userID, Vehicle_records, Vehicle.make
FROM Driver,Vehicle_Records, Vehicle
WHERE Driver.userID = vehicle_records.userID
  AND vehicle_records.vid = vehicle.vid
  AND vehicle.make= 'Honda';

  Create role admin;
Create role driver;
Create role passenger;

-- Admin
Grant all on all tables in schema public to admin

-- Passenger
Grant insert, update on Card_Info to passenger
Grant insert, update on User_Info to passenger 

--Driver
Grant insert, update on Driver_Accounts to driver
Grant insert, update on vehicle to driver
Grant insert, update on Pickup_Request to driver
Grant insert, update on Ride_Request to driver






