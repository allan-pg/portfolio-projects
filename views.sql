use layoffs;
-- link to the dataset 

-- ------------------------ VIEWS IN MYSQL ----------------------------------------------
-- A view is a virtual table based on the result set of an sql statement
-- The fields in a view are just a replica of field in a real table in the database
-- They are not real tables but one can perform sql operations on them as if they were real
-- views can also be used to limit what other users can see rather than the whole table

select * FROM company_layoffs;
-- 1. create a view called all_layoffs to see all layoffs in our company_layoffs table

CREATE VIEW  all_layoffs as(
	select *
    from company_layoffs
);

-- 2. now you can view data from all_layoffs view just as normal table

select *  from all_layoffs;

-- 3. you can perform operations on it
-- sum
select sum(funds_raised_millions ) as total_funds_raised
from all_layoffs;

-- filter data
select * from all_layoffs
WHERE funds_raised_millions > 150;

-- 4. to delete a view
DROP VIEW all_layoffs;

-- create a view comprising of only what we want our client to see
CREATE VIEW employees_laid_off as (
		select company,
               location,
               total_laid_off
		from company_layoffs
);

-- from employees_laid_off virtual table only 3 fields are selected
select * from employees_laid_off;