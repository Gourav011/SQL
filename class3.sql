create database dress_data1;
use dress_data1;


create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating` varchar(30),	
`Size`	varchar(30),	
`Season` varchar(30),	
`NeckLine` varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType` varchar(30),	
`Decoration` varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30))

# loding data in bulk

load data infile 
'C:/AttributeDataSet.csv'
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from dress;

' Constraints in SQL '

# there can be only one auto column and it must be defined as a key

create table if not exists test(
test_id int auto_increment,  # it will add values automatically
test_name varchar(30),
test_mailid varchar(30),
primary key(test_id))

select * from test;

insert into test (test_name, test_mailid) values 
('Ram','@gmail.com'),
('Sham','@gmail.com'),
('shubham','@gmail.com')

select * from test;


create table if not exists test1(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_salary int check(test_salary > 1000)) # check Constraint work as a condition

insert into test1 values 
(1,'Ram','@gmail.com',2000),
(2,'Sham','@gmail.com',900),   #Error Code: Check constraint 'test1_chk_1' is violated
(3,'shubham','@gmail.com', 3000)

insert into test1 values 
(1,'Ram','@gmail.com',2000),
(2,'Sham','@gmail.com',5000),   
(3,'shubham','@gmail.com', 3000)

select * from test;

create table if not exists test2(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_adress varchar(30) check(test_adress = 'Delhi'), # it will allow only Delhi records 
test_salary int check(test_salary > 1000))

insert into test2 values 
(1,'Ram','@gmail.com','Delhi',2000),
(2,'Sham','@gmail.com','Delhi',5000),   
(3,'shubham','@gmail.com','Delhi',3000)

select * from test2;

alter table test2 add check (test_id > 0 ) # alter table used to add Constraint after table is created

insert into test2 values 
(-1,'Ram','@gmail.com','Delhi',2000),  # Error -1
(2,'Sham','@gmail.com','Delhi',5000),   
(3,'shubham','@gmail.com','Delhi',3000)

insert into test2 values 
(1,'Ram','@gmail.com','Delhi',2000), 
(2,'Sham','@gmail.com','Delhi',5000),   
(3,'shubham','@gmail.com','Delhi',3000)

create table if not exists test3(
test_id int not null, # it will not except any null value
test_name varchar(30),
test_mailid varchar(30))

insert into test3 (test_name, test_mailid)
values
('Ram','@gmail.com')  # Error Code: Field test_id doesnt have a default value

insert into test3 values (1,'ram','@gmail.com')

create table if not exists test4(
test_id int not null auto_increment, 
test_name varchar(30),
test_mailid varchar(30),
primary key(test_id))


insert into test4 (test_name, test_mailid)
values
('Ram','@gmail.com')

create table if not exists test5(
test_id int not null default 0, # default it will add zero value if no value is given
test_name varchar(30),
test_mailid varchar(30))

insert into test5 (test_name, test_mailid)
values
('Ram','@gmail.com')

select * from test5;

insert into test5 values
(2,'Ram','@gmail.com')

select * from test5;
 
create table if not exists test6(
test_id int not null default 0, 
test_name varchar(30),
test_mailid varchar(30) unique ) # it will allow only unique value

insert into test6 values
(2,'Ram','@gmail.com')


create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
teast_adress varchar(30) check (teast_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id))

# auto_increment always starts from highest number in the table