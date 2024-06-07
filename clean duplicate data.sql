-- >> ---------------- Delete duplicate data from a table -----------------------------
-- Duplicate data is data repeated several times in your table and can lead to you gettin incorrect insights
-- These are some of the several ways to eliminate redudant data
-- i created a table with duplicate record ---
create database vehicle;
set sql_safe_updates = 0;

use vehicle ;

create table cars(
	car_id int,
    car_name varchar(10),
    car_model VARCHAR(10),
    year year
);

insert into cars
values (2, "Toyota", "Fortuner", 2020),
		(4, "Tesla", "Model S", 2021),
        (3, "Hyundai", "Fx Q", 2021),
        (5, "Toyota", "Fortuner", 2020),
        (7, "Hyundai", "Fx Q", 2021);

select * from cars;
-- duplicate records are identified by use of car_name and car_model fields
-- clearly that means toyota and hyundai ave duplicate records
-- 1. Delete duplicate records from cars table usin an identifier

DELETE from cars
WHERE car_id in (
	select car_id FROM (
		select  max(car_id)
		from cars
		group by car_name, car_model
        having count(*) > 1) as duplicate_id);
        
select * from cars;     

-- 2. use a window funcction- row_number ------------------

DELETE FROM cars 
WHERE car_id in (
	select car_id from(
		select *,
				row_number() over(partition by car_name, car_model) as rn
		from cars) x
	WHERE x.rn > 1);

-- clearly all duplicated rows have been removed
SELECT * from cars;
-- populate your table again
insert into cars
values (5, "Hyundai", "Fx Q", 2021),
       (7, "Toyota", "Fortuner", 2020);
       
-- 3. Use a self join to see and delete the duplicate values
-- now you have to join them bases on name and mode 
DELETE FROM cars 
WHERE car_id in (
	select car_id from(
		select c1.car_id
		from cars c1
		join cars c2 on c1.car_name = c2.car_name and
						c1.car_model = c2.car_model and
						c1.car_id < c2.car_id) as duplicate_id);

-- ceck your table now
select * from cars;

-- 4. use a min function
DELETE FROM cars
WHERE car_id in (
	select car_id from(
		select car_id FROM cars
		WHERE car_id not in(
			select   min(car_id)
			from cars
			GROUP BY car_name, car_model)
            )duplicated_id);
-- now we get a table without duplicates

-- 5. use a back up table 
create table cars_bkup(
	select * from cars 
    where 1 = 2
);

insert into cars_bkup

   select * from cars
   where car_id in(
	select   min(car_id)
			from cars
			GROUP BY car_name, car_model);
            
SELECT * from cars_bkup;
DROP table cars;

-- rename cars_bkup to cars now
ALTER table cars_bkup
rename  to cars;

-- These are some of the ways we can remove redudant data on mysql 




