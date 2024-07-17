create database SchoolSystem;

use SchoolSystem

create table Teachers (
ID int primary key,
Name varchar(15)
);

create table TeacherDetails (
ID int primary key,
Email varchar(30),
PhoneNumber varchar(15),
T_ID int unique,
foreign key (T_ID) references Teachers (ID)
);

create table Courses(
ID int primary key,
CourseName varchar(15),
T_ID int,
foreign key (T_ID) references Teachers(ID)
);

create table Students(
ID int primary key ,
Name varchar(15),
Email varchar (30),
C_ID int,
foreign key (C_ID) references Courses(ID)
);

--Many To Many
create table Student_Courses(
S_ID int ,
C_ID int ,
foreign key (S_ID) references Students(ID),
foreign key (C_ID) references Courses(ID),
primary key(S_ID ,C_ID) 
);

insert into Teachers values(1 , 'Ahmed');
insert into Teachers values(2 , 'Mohammed');
insert into Teachers values(3 , 'Khaled');
insert into Teachers values(4 , 'Sara');
insert into Teachers values(5 , 'Salma');


insert into TeacherDetails values(1 , 'Ahmed@gmail.com','0797182579',1);
insert into TeacherDetails values(2 , 'mohammed@gmail.com','0796446785',2);
insert into TeacherDetails values(3 , 'Khaled@gmail.com','0797541515',3);
insert into TeacherDetails values(4 , 'Sara@gmail.com','0772151554',4);
insert into TeacherDetails values(5 , 'Salma@gmail.com','0777785256',5);


insert into Courses values (1,'C#',1);
insert into Courses values (2,'C++',2);
insert into Courses values (3,'HTML',3);
insert into Courses values (4,'CSS',4);
insert into Courses values (5,'Java',5);


insert into Students values (1,'Ahmed Yacoub','Ahmed@gmail.com',1);
insert into Students values (2,'Qusai','Qusai@gmail.com',2);
insert into Students values (3,'Salah','Salah@gmail.com',3);
insert into Students values (4,'Yara','Yara@gmail.com',4);
insert into Students values (5,'Nermin','Nermin@gmail.com',5);


insert into Student_Courses  VALUES (1, 1);
insert into Student_Courses  VALUES (1, 2);
insert into Student_Courses  VALUES (2, 3);
insert into Student_Courses  VALUES (3, 4);
insert into Student_Courses  VALUES (4, 5);
insert into Student_Courses  VALUES (5, 1);
insert into Student_Courses  VALUES (2, 2);
insert into Student_Courses  VALUES (3, 3);
insert into Student_Courses  VALUES (4, 4);
insert into Student_Courses  VALUES (5, 5);
