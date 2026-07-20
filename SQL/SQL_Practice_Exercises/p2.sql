
-- .....................................SQL Practice Exercises..................................
CREATE DATABASE p2;
use p2;



-- ============================
-- CREATE TABLE: Passenger
-- ============================

CREATE TABLE Passenger (
    PassengerID VARCHAR(5) PRIMARY KEY,
    PassengerName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15),
    City VARCHAR(30)
);

-- Insert Records
INSERT INTO Passenger VALUES
('P001','Amit Sharma','Male',28,'9876543210','Kolkata'),
('P002','Priya Das','Female',24,'9876543211','Delhi'),
('P003','Rahul Roy','Male',35,'9876543212','Mumbai'),
('P004','Sneha Paul','Female',31,'9876543213','Chennai'),
('P005','Arjun Singh','Male',42,'9876543214','Jaipur'),
('P006','Neha Gupta','Female',27,'9876543215','Pune'),
('P007','Rohan Sen','Male',30,'9876543216','Hyderabad'),
('P008','Anjali Bose','Female',22,'9876543217','Kolkata'),
('P009','Vikram Patel','Male',38,'9876543218','Ahmedabad'),
('P010','Meera Iyer','Female',29,'9876543219','Bengaluru');

-- ============================
-- CREATE TABLE: Train
-- ============================

CREATE TABLE Train (
    TrainID VARCHAR(5) PRIMARY KEY,
    TrainName VARCHAR(50),
    Source VARCHAR(30),
    Destination VARCHAR(30),
    DepartureTime TIME,
    ArrivalTime TIME
);

-- Insert Records
INSERT INTO Train VALUES
('T101','Howrah Express','Kolkata','Delhi','06:00:00','20:00:00'),
('T102','Rajdhani Express','Delhi','Mumbai','08:30:00','22:30:00'),
('T103','Duronto Express','Kolkata','Chennai','09:15:00','05:30:00'),
('T104','Shatabdi Express','Mumbai','Pune','07:00:00','10:30:00'),
('T105','Vande Bharat','Bengaluru','Chennai','06:45:00','11:00:00'),
('T106','Garib Rath','Jaipur','Delhi','05:30:00','11:30:00'),
('T107','Intercity Express','Hyderabad','Bengaluru','10:00:00','18:00:00'),
('T108','Tejas Express','Mumbai','Ahmedabad','07:45:00','14:15:00'),
('T109','Jan Shatabdi','Chennai','Hyderabad','08:00:00','17:30:00'),
('T110','Humsafar Express','Pune','Kolkata','11:00:00','06:00:00');

-- ============================
-- CREATE TABLE: Booking
-- ============================

CREATE TABLE Booking (
    BookingID VARCHAR(5) PRIMARY KEY,
    PassengerID VARCHAR(5),
    TrainID VARCHAR(5),
    JourneyDate DATE,
    Coach VARCHAR(5),
    SeatNo INT,
    Fare DECIMAL(8,2),
    BookingStatus VARCHAR(15),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Train(TrainID)
);

-- Insert Records
INSERT INTO Booking VALUES
('B001','P001','T101','2026-08-10','S1',23,850.00,'Confirmed'),
('B002','P002','T102','2026-08-11','A1',12,1850.00,'Confirmed'),
('B003','P003','T103','2026-08-12','S2',45,1250.00,'Waiting'),
('B004','P004','T104','2026-08-13','C1',18,650.00,'Confirmed'),
('B005','P005','T105','2026-08-14','E1',5,1400.00,'RAC'),
('B006','P006','T106','2026-08-15','S3',30,720.00,'Confirmed'),
('B007','P007','T107','2026-08-16','B1',10,980.00,'Confirmed'),
('B008','P008','T108','2026-08-17','C2',25,890.00,'Cancelled'),
('B009','P009','T109','2026-08-18','S4',40,1100.00,'Confirmed'),
('B010','P010','T110','2026-08-19','A2',8,2100.00,'Waiting');

-- ============================
-- Display All Records
-- ============================

SELECT * FROM Passenger;
SELECT * FROM Train;
SELECT * FROM Booking;

-- ORDER BY (1–5)
-- 1. Display all passengers sorted by PassengerName in ascending order.
select PassengerName from Passenger order by PassengerName asc;

-- 2.Display all trains sorted by DepartureTime in descending order.
select TrainName,DepartureTime from Train order by DepartureTime desc;

-- 3.Display bookings sorted by Fare from highest to lowest.
select * from  Booking order by Fare desc;

-- 4.Display passengers sorted by Age (youngest first).
select PassengerName,Age from Passenger order by Age asc;

-- 5.Display bookings sorted by JourneyDate and then by Fare.
select JourneyDate,Fare from  Booking order by JourneyDate desc , Fare desc ;

-- WHERE & LOGICAL OPERATORS (6–10)
-- 6.Display passengers whose age is greater than 30.
select PassengerName,Age from Passenger where Age>30;

-- 7.Show bookings where the fare is between 800 and 1500.
select fare from Booking where fare between 800 and 1500;

-- 8.Display trains whose source is Kolkata or Delhi.
 SELECT TrainName ,Source FROM Train  WHERE Source IN ('Kolkata', 'Delhi');

-- 9.Display confirmed bookings with fare greater than 1000.
select * from Booking where BookingStatus="confirmed" and Fare>1000;

-- 10.Display passengers who are Female and younger than 30.
select *from Passenger where Gender="Female" and Age<30;
-- LIKE OPERATOR (11–15)
-- 11.Display passengers whose names start with A.
select * from Passenger where PassengerName like "A%";

-- 12.Display train names ending with Express.
select * from Train where TrainName like "%Express";

-- 13.Display passengers whose city contains 'ta'.
select * from Passenger where City like "%ta%";

-- 14.Display train names containing 'Raj'.
select * from Train where TrainName like "%Raj%";

-- 15.Display passengers whose names have 5 letters.
select PassengerName from Passenger where length(PassengerName)=10;
-- AGGREGATE FUNCTIONS (16–20)
-- 16.Find the total number of passengers.
select count(PassengerID) from Passenger;

-- 17.Find the average fare of all bookings.
select avg(Fare) from Booking;

-- 18.Find the maximum fare.
select max(Fare) from Booking;

-- 19.Find the minimum passenger age.
select min(Age) from Passenger;

-- 20.Find the total fare collected from confirmed bookings.
SELECT SUM(Fare) AS total_fare_collected FROM Booking WHERE BookingStatus = 'Confirmed';

-- GROUP BY (21–25)
-- 21.Count passengers in each city.
select City,count(PassengerID) from Passenger group by City;

-- 22.Count bookings for each booking status.
select count(BookingID) ,BookingStatus from Booking group by BookingStatus;

-- 23.Find the average fare for each booking status.
select avg(Fare),BookingStatus from Booking  group by BookingStatus;

-- 24.Count trains available from each source.
select count(TrainID) ,source from Train group by source;

-- 25.Find the highest fare for each coach.
select max(fare) as Highest_fare ,coach from Booking group by coach;

-- HAVING (26–30)
-- 26.Display cities having more than one passenger.
select City,count(PassengerID) from Passenger group by City having count(PassengerID)>1 ;

-- 27.Display booking statuses having more than two bookings.
select count(BookingID) as booking_statuses ,BookingStatus from Booking group by BookingStatus having booking_statuses>2 ;

-- 28.Show coaches whose average fare is greater than 1000.
select avg(fare) as average_fare ,coach from Booking group by coach having average_fare>1000;

-- 29.Display sources having more than one train.
select count(TrainID) as numberoftrains ,source from Train group by source having numberoftrains>1 ;
 
-- 30.Show booking statuses whose total fare exceeds 2000.
SELECT BookingStatus, SUM(fare) AS total_fare FROM Booking GROUP BY BookingStatus HAVING SUM(fare) > 2000;

-- JOINS (31–34)
-- 31.Display passenger names along with their train names.
select p.PassengerName,t.TrainName 
from Booking b join Passenger p on p.PassengerID=b.PassengerID
 join Train t on t.TrainID=b.TrainID ; 

-- 32.Display passenger name, city, train name, and fare.
select p.PassengerName,p.City,t.TrainName ,b.fare
from Booking b 
join Passenger p on p.PassengerID=b.PassengerID
join train t on t.TrainID=b.TrainID;

-- 33.Display all confirmed bookings with passenger and train details.
select p.PassengerName,t.TrainName,b.BookingStatus
from Booking b 
join Passenger p on p.PassengerID=b.PassengerID
join train t on t.TrainID=b.TrainID
where b.BookingStatus="confirmed";

-- 34.Display train name, passenger name, and booking status.
select p.PassengerName,t.TrainName,b.BookingStatus
from Booking b 
join Passenger p on p.PassengerID=b.PassengerID
join train t on t.TrainID=b.TrainID;

-- SUBQUERIES & ADVANCED EXPRESSIONS (35–38)
-- 35.Find the passenger(s) with the highest age.
select PassengerName from Passenger where Age=(select max(Age) from Passenger);

-- 36.Find the booking(s) with the highest fare.
select * from Booking where Fare=(select max(Fare) from Booking);

-- 37.Display passengers who booked the same train as Amit Sharma.
SELECT p.PassengerName, t.TrainName 
FROM Booking b 
JOIN Passenger p ON p.PassengerID = b.PassengerID 
JOIN Train t ON t.TrainID = b.TrainID 
WHERE b.TrainID IN (
    SELECT b2.TrainID 
    FROM Booking b2 
    JOIN Passenger p2 ON p2.PassengerID = b2.PassengerID 
    WHERE p2.PassengerName = 'Amit Sharma'
)
AND p.PassengerName != 'Amit Sharma';

SELECT PassengerName
FROM Passenger
WHERE PassengerID IN (
SELECT PassengerID
FROM Booking
WHERE TrainID = (
SELECT TrainID
FROM Booking
WHERE PassengerID = (
SELECT PassengerID
FROM Passenger
WHERE PassengerName='Amit Sharma'
)
)
);

-- 38.Display trains whose fare is greater than the average fare of all bookings.

-- VIEW, LIMIT & MIXED QUERIES (39–40)
-- Create a view named ConfirmedBookings that displays only confirmed bookings with passenger and train details.
-- Display the top 5 highest-fare bookings.
-- MySQL/PostgreSQL: use LIMIT 5
-- SQL Server: use TOP 5