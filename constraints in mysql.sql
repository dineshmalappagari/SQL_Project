# Constraints in My Sql 
# Constraints are nothing but its a set of instrections that we want to fallow while inserting the records in to the table

#Type of Constraints
-- 1. Primary Key Constraints
-- 2. Foreign Key Constraints 
-- 3. Check Constraints
-- 4. Default Constraints
-- 5. Unique 
-- 6. Not Null Constraints

# Constraints can be created while creating the table or by using alter table

drop database if exists restaurant;
create database if not exists restaurant;
use restaurant;
create table if not exists hotels(
id int not null primary key,
hotel_name varchar(30) not null,
rating varchar(2));



create table employee(
emp_id int not null primary key auto_increment,         # here i am using both primary key and as well as not null and auto_increment constraints
name varchar(30),
age varchar(2) default 18 check(age>=18),    # here i am using both check and default constraints
phone_number varchar(10) unique,
id int,
foreign key (id) references hotels(id));

insert into employee (name,phone_number,id) values('Ramu',987825348,1),('ramesh',862873,2);
insert into employee values(7,'chitra',12,76983432,1);

select * from employee;



describe hotels;
describe employee;


describe hotels;
describe employee;
select * from hotels;
# Now will insert the records into the employee table

insert into hotels values(1,'krishna_sagar',3),(2,'sagar',4);
select * from hotels;

insert into employee values(1,'Jeevan',24,9141919300,1),(2,'vinutha',26,9019032001,2);
select * from employee;
insert into employee (emp_id,name,id) values(3,'renuka',5);
select * from employee;














