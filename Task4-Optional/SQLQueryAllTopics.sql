create database SchoolManagmentSystem;

use SchoolManagmentSystem;

create table Students(
ID int primary key identity (1,1),
Name varchar (15),
BDate date,
Adress varchar(15),
Info varchar(15)
);


 INSERT INTO Students VALUES 
('Ahmed Yacoub', '2000-04-19', 'Amman','info1'),
('Yazan Mohammed', '1994-05-15', 'Jarash','info2'),
('John Flek', '2003-01-10', 'Irbid','info3'),
('Flora sese', '1970-07-10', 'Aqaba','info4'),
('Alein Yacoub ', '2007-02-01', 'Europ','info5');


create table FamilyInfo (
ID int primary key identity (1,1),
FatherName varchar(25),
FatherPhone varchar(15),
StdID int,
foreign key (StdID) references Students(ID)
);

 INSERT INTO FamilyInfo VALUES
('Mohammed Hussein', '0797182579',1  ),
('Hammad Khaled', '0788807750', 2 ),
('Gorge Son', '0799552510',3),
('Koko Jojo', '0777777545',4),
('Eid Hussein', '0797182579',5);

create table Courses(
ID int primary key identity (1,1),
CourseName varchar(15),
CourseDescription varchar (50),
Resources varchar (15)
);

INSERT INTO Courses VALUES
('C#', 'This is a course on C#', 'Book1'),
('C++', 'This is a course on C++', 'Book2'),
('Python', 'This is a course on Python', 'Book3'),
('JavaScript', 'This is a course on JavaScript', 'Book4'),
('Java', 'This is a course on Java', 'Book5');


create table Students_Courses(
StudentID int,
CourseID int,
foreign key (StudentID) references Students(ID),
foreign key (CourseID) references Courses(ID),
primary key (StudentID,CourseID)
);

INSERT INTO Students_Courses VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3);

create table Calsses(
ID int primary key identity(1,1),
ClassName varchar(15),
ClassCode int,
RoomNumber int,
CourseID int,
foreign key (CourseID) references Courses(ID)
);

INSERT INTO Calsses VALUES
('Intro to C#', 101, 301, 1),
('Advanced C++', 102, 302, 2),
('Python Basics', 103, 303, 3),
('JavaScript 101', 104, 304, 4),
('Java Program', 105, 305, 5);


create table Assignments(
ID int primary key identity(1,1),
AssignmentName varchar (25),
AssignmentDescription varchar(50),
AssignmetDate date,
AssignmentStatus varchar(15),
CourseID int,
foreign key (CourseID) references Courses(ID)
);


INSERT INTO Assignments VALUES
('C# Project', 'Create a C# application', '2024-07-01', 'Pending', 1),
('C++ Homework', 'Solve C++ exercises', '2024-07-02', 'Completed', 2),
('Python Script', 'Write a Python script', '2024-07-03', 'Pending', 3),
('JS Task', 'Build a JS web page', '2024-07-04', 'In Progress', 4),
('Java App', 'Develop a Java app', '2024-07-05', 'Completed', 5);


create table Courses_Assignment (
CourseID int,
AssignmentID int,
foreign key (CourseID) references Courses(ID),
foreign key (AssignmentID) references Assignments(ID),
primary key (CourseID,AssignmentID)
);

INSERT INTO Courses_Assignment VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 3),
(2, 4);

create table Attendances (
ID int primary key identity(1,1),
AttendenceDate date ,
AttendenceType varchar(15),
StudentID int,
foreign key (StudentID) references Students(ID)
);

INSERT INTO Attendances VALUES
('2024-01-01', 'Leaving', 1),
('2024-01-03', 'Absence', 2),
('2024-05-25', 'Leaving', 3),
('2024-04-19', 'Late', 4),
('2024-07-05', 'Late', 1);



--Answer Question :

--Q1:
SELECT s.id ,s.name , a.AttendenceDate,s.BDate
FROM Students s
JOIN Attendances a ON s.ID = a.StudentID
WHERE a.AttendenceDate = '2024-01-01';

--Q2:
SELECT *
FROM Courses
WHERE CourseName = 'Java';

--Q3:
ALTER TABLE Students ADD Email varchar(50);

--Q4:
INSERT INTO Students (Name, BDate, Adress, Info, Email) VALUES ('Ahmed', '2000-01-01', 'Amman', 'New Info', 'AhmedYacoub@gmail.com'); 

--Q5:
SELECT *
FROM Students s
JOIN FamilyInfo f ON s.ID = f.StdID;


--Q6:
SELECT s.*
FROM Students s
JOIN Students_Courses sc ON s.ID = sc.StudentID
JOIN Courses c ON sc.CourseID = c.ID
WHERE c.CourseName = 'Java';

--Q7:
SELECT s.*
FROM Students s
JOIN Students_Courses sc ON s.ID = sc.StudentID
JOIN Courses c ON sc.CourseID = c.ID

--Q8:
SELECT s.*
FROM Students s
JOIN Attendances a ON s.ID = a.StudentID
WHERE a.AttendenceType = 'Leaving'
AND a.AttendenceDate BETWEEN '2024-01-01' AND '2024-01-05'; 

--Q9:
SELECT s.Name
FROM Students s
JOIN Attendances a ON s.ID = a.StudentID
WHERE a.AttendenceType = 'Absence'