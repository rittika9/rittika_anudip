-- Lab 1. Create a Database & Table Using MySQL Command-Line Client. ● Create a database with the name StudentManagementSystem. Create a table with named Student with attributes: ● StudentID (Primary Key) ● FirstName ● LastName ● DateOfBirth ● Gender ● Email ● Phone Create a table with name Course with attributes: ● CourseID (Primary Key) ● CourseTitle ● Credits Create a table with named Instructor with attributes: ● InstructorID (Primary Key) ● FirstName ● LastName ● Email Create a table with named Enrollment with attributes: ● EnrollmentID (Primary Key) ● EnrollmentDate ● StudentID(Foreign key) ● CourseID(Foreign Key) ● InstructorID(Foreign key) Create a table with named Score with attributes: ● ScoreID (Primary Key) ● CourseID (Foreign key) ● StudentID (Foreign Key) ● DateOfExam ● CreditObtainedCreate a table with named Feedback with attributes: ● FeedbackID (Primary Key) ● StudentID (Foreign key) ● Date ● InstructorName ● Feedback 

create database StudentManagementSystem;
use StudentManagementSystem;
create table Student(
 StudentID int Primary Key ,
 FirstName varchar(30) , 
 LastName varchar(30) , 
 DateOfBirth date ,
 Gender VARCHAR(30) ,
 Email VARCHAR(30) , 
 Phone VARCHAR(20) unique);
create table Course(
 CourseID int Primary Key, 
 CourseTitle varchar(30) ,
 Credits double);
create table Instructor(
InstructorID int Primary Key, 
FirstName varchar(30) ,
LastName varchar(30), 
Email VARCHAR(30));
create table Enrollment(
 EnrollmentID int Primary Key,
 EnrollmentDate date ,
 StudentID int ,foreign key(StudentID) references Student(StudentID), 
 CourseID int, foreign key(CourseID) references Course(CourseID), 
 InstructorID int, foreign key(InstructorID) references Instructor(InstructorID));
create table Score(
 ScoreID int Primary Key,
 CourseID int, foreign key(CourseID) references Course(CourseID),
 StudentID int ,foreign key(StudentID) references Student(StudentID),
 DateOfExam date, 
 CreditObtained int);
create table Feedback(
FeedbackID int Primary Key,
StudentID int ,foreign key(StudentID) references Student(StudentID),
F_Date date,
InstructorName varchar(30),
Feedback varchar(50));

