create database LibrarySystem;

use LibrarySystem

create table Authors(
ID int primary key identity (1,1),
Name varchar(15)
);

insert into Authors values('Ahmed Yacoub') ,('Mohammed'),('Sara'),('Khaled'),('Salma');

create table Books(
ID int primary key identity(1,1),
Name varchar(15),
A_ID int,
C_ID int,
foreign key (A_ID) references Authors(ID),
foreign key (C_ID) references Books(ID)
);

insert into Books values('Scince',1,1),('Maths',2,2),('C++',3,3),('C#',4,4),('Java',5,5);
insert into Books values ('JS',1,null),('HTML',null,3);

create table Sections(
ID int primary key identity(1,1),
Destination varchar (15),
B_ID int
foreign key (B_ID) references Books(ID)
);

insert into Sections values('A',1),('B',2),('C',3),('D',4),('E',5);

create table Categories (
ID int primary key identity (1,1),
Name varchar(15),
B_ID int,
foreign key (B_ID) references Books(ID)
);

insert into Categories values ('Scince',1),('Mathmatics',2),('Programming',3),('Languages',4),('Training',5);


create table CategoryBooks(
B_ID int,
C_ID int,
foreign key (B_ID) references Books(ID),
foreign key (C_ID) references Categories(ID)
);

insert into CategoryBooks values (1,1),(1,2),(2,2),(1,3),(1,5),(null,2),(4,1),(3,3),(4,4),(5,5);

create table Employees (
ID int primary key identity(1,1),
Name varchar(15),
S_ID int,
foreign key (S_ID) references Sections(ID)
);

insert into Employees values ('Ahmed Yacoub',1),('Hussam',2),('Bassam',3),('Yacoub',4),('Salma',5);

create table Users(
ID int primary key identity(1,1),
Name varchar (15),
B_ID int,
foreign key (B_ID) references Books(ID),

);

insert into Users values ('John',1),('Jacoub',2),('Kali',3),('Mohammed',4),('Yazan',5);



select * from Authors;

select * from Books;

select * from Sections;

select * from Categories;

select * from Employees;

select * from Users;

select * from CategoryBooks;

--one to many
select Authors.Name ,Books.Name from Authors join Books on Authors.ID = Books.A_ID;
select * from Authors right join Books on Authors.ID = Books.A_ID;
select Authors.ID ,Authors.Name ,  Books.ID,Books.Name from Authors left join Books on Authors.ID = Books.A_ID;
select * from Authors full join Books on Authors.ID = Books.A_ID;

--many to many
select * from Books 
inner join CategoryBooks on   Books.A_ID=CategoryBooks.B_ID
inner join Categories on Categories.ID =CategoryBooks.C_ID;

select * from  Books
right join CategoryBooks on   Books.A_ID=CategoryBooks.B_ID
right join Categories on   Categories.ID=CategoryBooks.C_ID;

select * from CategoryBooks 
left join Books on   Books.A_ID=CategoryBooks.B_ID
left join Categories on   Categories.ID=CategoryBooks.C_ID;

select * from CategoryBooks 
full join Books on   Books.A_ID=CategoryBooks.B_ID
full join Categories on   Categories.ID=CategoryBooks.C_ID;

