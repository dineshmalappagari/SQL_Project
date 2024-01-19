# Case Statement in My Sql By Jeevan Raj
# Case are Nothing but contitional statement if then else statement
drop database restaurant;
create database restaurant;
use restaurant;
create table hotels(
id int not null primary key,
hotel_name varchar(30) not null,
rating varchar(2));

alter table hotels add column customer_gender varchar(2) after hotel_name;
select * from hotels;
insert into hotels values(1,'Shanthi Sagar','M',8),(2,'abc','f',6),(3,'MTR','f',7),(4,'xyz','m',3),(5,'maruthi','f',3);
select * from hotels;

# Now will create case statement
select *,case when rating <5 then 'Bad Hotel' when rating <8 then 'Normal Hotel' else 'Super Hotel' end as Hotel_Review from hotels;

# will update the data to the table 
alter table hotels modify customer_gender varchar(10);
update hotels set customer_gender = case customer_gender when 'M' then 'Male' when 'f' then 'female' end ;

select * from hotels;



