create database SalesPeople;
use SalesPeople;
create table SalesPeople(Snum int primary key ,Sname varchar(20),City varchar(20), Comm varchar (20));
insert into SalesPeople values (1001, 'Peel','London', 12);
insert into SalesPeople values (1002 ,'Serres','Sanjose',13);
insert into SalesPeople values (1004, 'Motika','London',11);
insert into SalesPeople values (1007 ,'Rifkin', 'Barcelona',15);
insert into SalesPeople values (1003, 'Axelrod', 'Newyork',1);

create table Customers(Cnum int primary key ,Cname varchar(20),City varchar(20),Snum int, FOREIGN KEY(Snum) references SalesPeople(Snum));
insert into Customers values (2001 , 'Hoffman', 'London',1001);
insert into Customers values(2002 ,'Giovanni', 'Rome',1003);
insert into Customers values(2003 ,'Liu','Sanjose',1002);
insert into Customers values(2004 ,'Grass', 'Berlin',1002);
insert into Customers values(2006, 'Clemens','London',1001);
insert into Customers values(2008 ,'Cisneros', 'Sanjose',1007);
insert into Customers values(2007 ,'Pereira', 'Rome',1004);

create table Orders(Onum int primary key ,Amt int,Odate varchar(20),Cnum int ,foreign key(Cnum) references Customers(Cnum),
Snum int, FOREIGN KEY(Snum) references SalesPeople(Snum));
insert into Orders (Onum,Amt,Odate,Cnum,Snum) values
(3001,18.69 ,'3-10-1990', 2008,1007),(3003 ,767.19, '3-10-1990', 2001, 1001),(3002, 1900.10,'3-10-1990', 2007 ,1004),(3005,5160.45,'3-10-1990', 2003 ,1002),
(3006 ,1098.16,'3-10-1990', 2008,1007),(3009,1713.23, '4-10-1990', 2002, 1003),(3007 , 75.75, '4-10-1990', 2004 ,1002),(3008 , 4273.00, '5-10-1990', 2006, 1001),
(3010,1309.95, '6-10-1990',2004 ,1002),(3011,9891.88, '6-10-1990',2006, 1001);


select * from SalesPeople;

select * from customers;

select *  from Orders;

# 1. Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(Sname)from salespeople
where Sname like 'A%';

#2. Display all the Salesperson whose all orders worth is more than Rs. 2000.

select Sname from salespeople join Orders
on salespeople.Snum=Orders.Snum
where Amt>=2000;

# 3.Count the number of Salesperson belonging to Newyork.

select count(Sname) from salespeople
where city="newyork";

# 4.Display the number of Salespeople belonging to London and belonging to Paris.
Select Sname from salespeople
where city in ("London","Paris");

# 5.Display the number of orders taken by each Salesperson and their date of orders.
select count(Onum), Odate
from salespeople join Orders
on salespeople.Snum=Orders.Snum
group by Odate;
