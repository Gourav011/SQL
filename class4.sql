create database sales
use sales

CREATE TABLE if not exists sales1 (
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);


SET SESSION sql_mode = ''


LOAD DATA INFILE  
'C:/sales_data_final.csv'
into table sales1
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

select * from sales1

select str_to_date(order_date,'%m/%d/%Y') from sales1

alter table sales1 
add column order_date_new  date after order_date

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%Y')

alter table sales1
add column ship_date_new date after ship_date

update sales1 
set ship_date_new = str_to_date(ship_date, '%m/%d/%Y')


SET SQL_SAFE_UPDATES = 0;

select * from sales1 where ship_date_new = '2011-01-05'
select * from sales1 where ship_date_new > '2011-01-05'
select * from sales1 where ship_date_new < '2011-01-05'

select now()
select curdate()
select curtime()

select date_sub(now() , interval 1 week) 'last 1 week'

'interview_questions' 
# Show last 1 week records
select * from sales1 where ship_date_new < date_sub(now() , interval 1 week)  

select date_sub(now(), interval 1 week)
select date_sub(now(), interval 30 day)
select date_sub(now(), interval 30 year)
select year(now())
select dayname('2022-09-20')

# adding flage column for current time

alter table sales1
add column flag date after order_id

update sales1
set flag = now()

select * from sales1;

# creating new columns 
alter table sales1
add column day_ date after order_date_new

alter table sales1
add column mounth_ date after order_date_new

alter table sales1
add column year_ date after order_date_new

# filling the data from existing column into new one

# extracting specific data from the column
select month(ship_date_new) from sales1; 


# modify this column into int first
'alter table sales1
add column mounth_ date after order_date_new'

alter table sales1
modify column mounth_ int;

alter table sales1
modify column day_ int;

alter table sales1
modify column year_ int;

update sales1
set mounth_ = month(ship_date_new) 

update sales1
set day_ = date(ship_date_new)

update sales1
set year_ = year(ship_date_new)

select * from sales1

# changing the datatype of the column

alter table sales1
modify column 'year' datetime;


# show what was the average sale in 2011, 2012 ,2013 

select * from sales1;

select avg(sales) from sales1 where `year` = 2011;
select avg(sales) from sales1 where `year` = 2012;
select avg(sales) from sales1 where `year` = 2013;

# another way by using group by command

select year_, avg(sales) from sales1 group by year_;

# show min sales from every year

select year_, min(sales) from sales1 group by year_;

# no of products sold in every year

select year_, sum(quantity) from sales1 group by year_;

select * from sales1;

# show the total cost of a every product or CTC(cost to company)

select (discount+shipping_cost) as ctc from sales1;
select (sales*discount+shipping_cost) as ctc from sales1;

# create column if discount is 0 write no otherwize yes

select if (discount > 0, 'yes', 'no') as discount_flag from sales1;

select order_id, if(discount > 0, 'yes', 'no') as discount_flag from sales1;

select * from sales1;

# count of items with discount
select count(*) from sales1 where discount > 0

# without discount
select count(*) from sales1 where discount <= 0


    ' or '
alter table sales1
add column discount_flag varchar(20) after discount;   

update sales1
set discount_flag = if(discount > 0, 'yes', 'no');


select discount_flag, count(*) from sales1 
group by discount_flag;

'TASK 2'

create database task2
use task2


create table if not exists retail (
invoice_no varchar(30),
stockcode varchar(30),
`description` varchar(100),
quantity varchar(30),
invoicedate varchar(30),
pnitprice decimal(30,5),
customer_id varchar(30),
country varchar(30) );

select * from retail;

load data infile
'C:/Online_Retail.csv'
into table retail
fields  terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows

select * from retail;

select count(*) from retail;