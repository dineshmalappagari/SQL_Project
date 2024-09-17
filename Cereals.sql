# Exercise 
# Database: cereals 
# Queries
  

use Cereals;

-- 1. Add index name fast on name. 
create index fast on cereals_table(name);
select max(length(name)) from cereals_table;
alter table cereals_table modify name varchar(40);
show index from cereals_table;

-- 2. Describe the schema of table 
describe cereals_table;

-- 3. Create view name as see where users can not see type column [first run appropriate query then create view] 
create view see as (select name,mfr,calories,protein,fat,sodium,
fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_table) ;
select * from see;

-- 4. Rename the view as saw 
rename table see to saw;
select * from saw;

-- 5. Count how many are cold cereals 
select type,count(*) No_of_cold_cereals from cereals_data where type = 'C';

-- 6. Count how many cereals are kept in shelf 3 
select * from cereals_table;
select shelf,count(*) no_of_cereals from cereals_table where shelf=3;

-- 7. Arrange the table from high to low according to ratings 
select * from cereals_table;
select * from cereals_table order by rating desc;

-- 8. Suggest some column/s which can be Primary key 
select count(distinct(name)),count(*) from cereals_data;  

-- 9. Find average of calories of hot cereal and cold cereal in one query 
select type,round(avg(calories),2) as Average_calories from cereals_table group by type;

-- 10. Add new column as HL_Calories where more than average calories should be categorized as 
-- HIGH and less than average calories should be categorized as LOW 

select *,case when calories >106.97 then 'High' else 'low' end HL_Calories from cereals_data;

alter table cereals_table add column HL_calories varchar(4);

select round(avg(calories),2) from cereals_data;

update cereals_table set HL_calories = case when calories >106.97 then 'HIGH' else 'LOW' end;
select * from cereals_table;

alter table cereals_table drop column HL_calories;

-- 11. List only those cereals whose name begins with B 
select * from cereals_table where name like 'B%';

-- 12. List only those cereals whose name begins with F 
select * from cereals_table where name like 'F%';

-- 13. List only those cereals whose name ends with s 
select * from cereals_table where name like '%s';

-- 14. Select only those records which are HIGH in column HL_calories and mail
--  to jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 
alter table cereals_data add column HL_Calories varchar(4); 
update cereals_data set HL_Calories = case when calories > 106.97 then 'HIGH' else 'LOW' end;

select * from cereals_data where HL_Calories = 'HIGH';

-- 15. Find maximum of ratings
select max(rating) as Max_rating from cereals_table;

-- 16. Find average ratings of those were High and Low calories 
select type,round(avg(rating),2) from cereals_table group by type;

-- 17. Craete two examples of Sub Queries of your choice and give explanation 
-- in the script itself with remarks by using # 

-- 18. Remove column fat 
alter table cereals_table drop column fat;

-- 19. Count records for each manufacturer [mfr] 
select mfr,count(*) as No_of_Manufacture from cereals_table group by mfr;

-- 20. Select name, calories and ratings only   
select name,calories,rating from cereals_table;

















