show databases;

use class;

select * from bank;

# Create Function or automate Queries

DELIMITER &&
create procedure `data`()
begin
	select * from bank;
end &&

# Calling the function

call `data`()

Delimiter &&
create procedure senior_citizen()
begin 
select * from bank where age <= 60;
end &&

call senior_citizen()

# Parameterizing the procedure

delimiter &&
create procedure avg_bal_jobrole()
begin
	select avg(balance) from bank where job = 'admin.';
end &&

call avg_bal_jobrole()

delimiter &&
create procedure avg_bal_jobrole1(in hello varchar(30))  # hello is a place holder
begin
	select avg(balance) from bank where job = hello;
end &&

call avg_bal_jobrole1('admin.')   # giving parameter inside the function
call avg_bal_jobrole1('retired')
call avg_bal_jobrole1('unknown')

# Using multiple parameters 
delimiter &&
create procedure sel_edu_job1(in p1 varchar(30), in p2 varchar(30))
begin
	select * from bank where education = p1 and job = p2;
end &&

call sel_edu_job1('tertiary', 'retired')

call `data`()

# Creating view for specific data from the original data or view is the subset of the dataset
create view bank_view as select age, job, marital, balance, education from bank;

select * from bank_view

select avg(balance) from bank_view where job = 'admin.'
