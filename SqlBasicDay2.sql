show databases;

create database light;
show databases;
drop database light;
show databases;

create database sales;
use sales;
create table customer_info(
id int,first_name varchar(25),last_name varchar(25)
);


##insert some rows in customer_info table
insert into customer_info values(1,"krish","naik");
select * from customer_info;



insert into customer_info values(2,"saki","choube"),(3,"saki1","choube1"),(4,"saki2","choube2");
select * from customer_info where last_name="choube1";
select * from customer_info where last_name="choube1" or last_name="choube2";


drop table customer_info;
show tables;


#-------------------------------------------------------------------


create table customer_info(
id int auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
primary key(id));

describe customer_info;
select * from customer_info;

insert into customer_info values(4,"krish","naik",20000);
insert into customer_info(first_name,last_name,salary) values("krish","naik",20000);

drop table customer_info;


#--------------------------------------------------------------



create table customer_info(
id int auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
primary key(id));


insert into customer_info(first_name,last_name,salary) values
("krish","naik",20000),
("sunny","savita",150000),
("Darius","Bengali",100000),
("rishav","sharma",null);

##update null value
select * from customer_info;
select * from customer_info where salary is null;
update customer_info
set salary=45000
where id=4;

##Constraint not null
select * from customer_info;
alter table customer_info
modify column salary float not null;
describe customer_info;

##Constraint Unique
create table employee(
id int,
housenumber int unique,
pancard int unique,
first_name varchar(25),
last_name varchar(25),
salary int not null,
primary key (id));   
desc employee;

#if we're providing primary key,then no need of not null
#PRIMARY KEY can be only 1 in table, 
#UNIQUE KEY can be many


##COMBINE 2 COLUMNS N MAKE IT UNIQUE
alter table employee
add constraint uc_employee Unique(pancard, last_name);


#################
create table student(
id int auto_increment,
first_name varchar(25),
last_name varchar (25),
DOB date,
primary key(id));

desc student;

#lets make DOB not null
select * from student;
alter table student
modify column DOB date not null;
desc student;

##lets add values
insert into student(first_name,last_name,DOB) values("saki","choube","2001-01-04");

##lets update the lastname
select * from student where last_name = "choube";
update student
set last_name="kapoor"
where id=1;

##ADD CONSTRAINT unique key
alter table student
add constraint uc_student unique(last_name, first_name);

##LETS DROP CONSTRAINT
alter table student
drop index uc_student;
select * from student;

drop table student;

#--------------------------------------------------------

create table person(
id int,
first_name varchar(25),
last_name varchar(25),
age int,
primary key(id));

desc person;

alter table person
drop primary key;

#cpmbine 2 column n make primary key
alter table person
add constraint pk_student primary key(id,first_name);

insert into person values(1,"saki","choube",22),(2,"saki","choube",22);
select * from person;  #able to insert

insert into person values(3,"raha","kapoor",4),(3,"raha","cham",5);
select * from person;  #not able to insert yoo

#DROP PRIMARY KEY
alter table person
drop primary key;

#--------------------------------------lets learn foreign key----------------------
drop table person;

create table person(
id int,
first_name varchar(25),
last_name varchar(25),
age int,
primary key(id));

desc person;

#create another table
create table orders(
orderid int not null,
ordernumber int,
id int,
primary key(orderid),
foreign key(id) references person(id));

select * from person;
insert into person values(1,"saki","choube",22),(2,"saki1","choube1",23),(3,"ray","colon",21),(4,"sai","prem",24);

insert into orders values(1,1,3);
select * from orders;

#from person who has given what orders we have to see, write query
select * from person as ps inner join orders as od
on ps.id=od.id;

select * from person as ps left join orders as od
on ps.id=od.id;

select * from person as ps right join orders as od
on ps.id=od.id;

select * from person as ps left outer join orders as od
on ps.id=od.id
order by age desc;


#------------------------------------------------------------------------

create table customers(
id int auto_increment,
first_name varchar(25),
country varchar(25),
capital varchar(25),
primary key(id));

select * from customers;

insert into customers(first_name,country,capital) values("krish","India","Delhi"),
("sak","Australia","Canberra"),
("sunny","maldives","Male"),
("sunny","India","Delhi");

select * from customers;

#want DETAIL OF PPL from INDIA N MALDIVES
select * from customers where country="India" or country="maldives";


#write query to tell PEOPLE WHO ARE NOT FROM INDIA
select * from customers where country!="India";
#another way
select * from customers where not country="India";



#------------------------------------------------------------------------------------------



create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int , 
housing varchar(30),
loan varchar(30) , 
contact varchar(30),
`day` int,
`month` varchar(30) , 
duration int , 
campaign int,
pdays int , 
previous int , 
poutcome varchar(30) , 
y varchar(30));


select * from bank_details;
insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(29,"management","single","tertiary","no",0,"yes","no","unknown",5,"may",363,1,-1,0,"unknown","no"),
(54,"blue-collar","married","secondary","no",1291,"yes","no","unknown",5,"may",266,1,-1,0,"unknown","no"),
(48,"management","divorced","tertiary","no",-244,"yes","no","unknown",5,"may",253,1,-1,0,"unknown","no"),
(32,"management","married","tertiary","no",0,"yes","no","unknown",5,"may",179,1,-1,0,"unknown","no"),
(42,"admin.","single","secondary","no",-76,"yes","no","unknown",5,"may",787,1,-1,0,"unknown","no"),
(24,"technician","single","secondary","no",-103,"yes","yes","unknown",5,"may",145,1,-1,0,"unknown","no"),
(38,"entrepreneur","single","tertiary","no",243,"no","yes","unknown",5,"may",174,1,-1,0,"unknown","no"),
(38,"management","single","tertiary","no",424,"yes","no","unknown",5,"may",104,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",306,"yes","no","unknown",5,"may",13,1,-1,0,"unknown","no"),
(40,"blue-collar","single","unknown","no",24,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(46,"services","married","primary","no",179,"yes","no","unknown",5,"may",1778,1,-1,0,"unknown","no"),
(32,"admin.","married","tertiary","no",0,"yes","no","unknown",5,"may",138,1,-1,0,"unknown","no"),
(53,"technician","divorced","secondary","no",989,"yes","no","unknown",5,"may",812,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",249,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",790,"yes","no","unknown",5,"may",391,1,-1,0,"unknown","no"),
(49,"blue-collar","married","unknown","no",154,"yes","no","unknown",5,"may",357,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",6530,"yes","no","unknown",5,"may",91,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",100,"no","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",59,"yes","no","unknown",5,"may",273,1,-1,0,"unknown","no"),
(55,"technician","married","secondary","no",1205,"yes","no","unknown",5,"may",158,2,-1,0,"unknown","no"),
(35,"blue-collar","single","secondary","no",12223,"yes","yes","unknown",5,"may",177,1,-1,0,"unknown","no"),
(57,"blue-collar","married","secondary","no",5935,"yes","yes","unknown",5,"may",258,1,-1,0,"unknown","no"),
(31,"services","married","secondary","no",25,"yes","yes","unknown",5,"may",172,1,-1,0,"unknown","no"),
(54,"management","married","secondary","no",282,"yes","yes","unknown",5,"may",154,1,-1,0,"unknown","no"),
(55,"blue-collar","married","primary","no",23,"yes","no","unknown",5,"may",291,1,-1,0,"unknown","no"),
(43,"technician","married","secondary","no",1937,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",384,"yes","no","unknown",5,"may",176,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",582,"no","yes","unknown",5,"may",211,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","no",91,"no","no","unknown",5,"may",349,1,-1,0,"unknown","no"),
(49,"services","divorced","secondary","no",0,"yes","yes","unknown",5,"may",272,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","yes",1,"yes","no","unknown",5,"may",208,1,-1,0,"unknown","no"),
(45,"admin.","single","secondary","no",206,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(47,"services","divorced","secondary","no",164,"no","no","unknown",5,"may",212,1,-1,0,"unknown","no"),
(42,"technician","single","secondary","no",690,"yes","no","unknown",5,"may",20,1,-1,0,"unknown","no"),
(59,"admin.","married","secondary","no",2343,"yes","no","unknown",5,"may",1042,1,-1,0,"unknown","yes"),
(46,"self-employed","married","tertiary","no",137,"yes","yes","unknown",5,"may",246,1,-1,0,"unknown","no"),
(51,"blue-collar","married","primary","no",173,"yes","no","unknown",5,"may",529,2,-1,0,"unknown","no"),
(56,"admin.","married","secondary","no",45,"no","no","unknown",5,"may",1467,1,-1,0,"unknown","yes"),
(41,"technician","married","secondary","no",1270,"yes","no","unknown",5,"may",1389,1,-1,0,"unknown","yes"),
(46,"management","divorced","secondary","no",16,"yes","yes","unknown",5,"may",188,2,-1,0,"unknown","no"),
(57,"retired","married","secondary","no",486,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(42,"management","single","secondary","no",50,"no","no","unknown",5,"may",48,1,-1,0,"unknown","no"),
(30,"technician","married","secondary","no",152,"yes","yes","unknown",5,"may",213,2,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",290,"yes","no","unknown",5,"may",583,1,-1,0,"unknown","no");


select * from bank_details;

#writw a query, select all details whos age is between 32 to 35
select * from bank_details where age>=32 and age<=35;

##write a query, age60 n job retired
select * from bank_details where age=60 and job="retired";

select * from bank_details where  education="unknown" and marital="single" and balance<1000;


/*Questions you can try
with this data try to fine out sum of balance 
Try to find out avarage of balance 
try to find out who is having a min balance 
try to find out who is having a mazxmim balance 
try to prepare a list of all the person who is having loan 
try to find out average balance for all the people whose job role is admin 
try to find out a record  without job whose age is below 45 
try to find out a record where education is primarty and person is jobless
try to find of a record whose bank account is having a negative balance 
try to find our a record who is not having house at all along with there balance 
*/

## Stored Procedures, Views, Indexes, CTE,windows function