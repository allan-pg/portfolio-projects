create database layoffs;

use layoffs;

-- shows data type used in each column

describe company_layoffs;

-- data cleaning is necessary since you dont want to deal with obsolete and redudant data
-- follow the following steps during data cleaning
-- 1. check for duplicate data and remove it
-- 2. look out for null values and a way of solvin it
-- 3. standard data and fix any errors
-- 4. remove any unnecesary rows and column

-- -------------------------------------------------------------------------------
-- ------------------ - DATA CLEANING ---------- ---------------------------------

SELECT * FROM company_layoffs; 

-- set sql safe updates to zero 
set sql_safe_updates = 0;
-- 1. check for duplicate values in our data set
-- There are several ways to do it - 
-- use a window function
-- use inner joins 
-- use min() function incase of int id

SELECT *,
		ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, 'date') rn 
 FROM company_layoffs;
 
 -- duplicate values are 
 SELECT * FROM (
		SELECT *,
		ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, 'date') rn 
 FROM company_layoffs
 ) duplicates
 WHERE duplicates.rn > 1;
 
 -- use inner join
 
 SELECT c1.* FROM company_layoffs c1
 join company_layoffs c2 on c1.company = c2.company and 
							c1.location = c2.location and 
                            c1.industry = c2.industry and 
                            c1.total_laid_off = c2.total_laid_off and
                            c1.date = c2.date;
-- the above query also needs a where clause e.g where c1.id < c2.id to see duplicates

-- ---------------------- delete the duplicate data -------------------------------------
WITH delete_cte as (
		SELECT * FROM (
				SELECT *,
				ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, 'date') rn 
				FROM company_layoffs
				) duplicates
		WHERE duplicates.rn > 1
)
DELETE from delete_cte;

-- add row number column
alter table company_layoffs
ADD COLUMN row_num int;

select * from company_layoffs;

-- delete column
alter table company_layoffs
drop COLUMN row_num;

-- i created another table so as to insert a row number to filter out duplicated data
CREATE TABLE company_layoff (
`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT
);

INSERT INTO company_layoff
(`company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
`row_num`)
SELECT `company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		company_layoffs;

-- to see duplicate data         
select * from company_layoff
WHERE row_num > 1;        

-- now delete the duplicate data
DELETE FROM company_layoff
WHERE row_num > 1;

-- 2. Check for any null values
select * from company_layoff
WHERE industry is NULL or industry = '';
;

select * from company_layoff
WHERE total_laid_off is NULL or total_laid_off = '';

-- lot of null values in our total_laid off column
select * from company_layoff
WHERE total_laid_off = ' ';

select * from company_layoff
WHERE percentage_laid_off is NULL;

select * from company_layoff
WHERE percentage_laid_off = ' ';

-- set empty rows to null
UPDATE company_layoff
SET industry = null
WHERE industry = '';
--



-- make te data even
SELECT DISTINCT industry
FROM COMPANY_LAYOFF 
ORDER BY industry;

-- check if all the industry now there is no empty value 
SELECT *
FROM company_layoff
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

-- select a company that starts with the letters bally to ceck industry entry
SELECT *
FROM company_layoff
WHERE company LIKE 'Bally%';

-- do the same for colum company that starts with the letter airbnb
SELECT *
FROM company_layoff
WHERE company LIKE 'airbnb%';

-- -- it looks like airbnb is a travel, but this one just isn't populated.
-- I'm sure it's the same for the others. What we can do is
-- write a query that if there is another row with the same company name, it will update it to the non-null industry values
-- makes it easy so if there were thousands we wouldn't have to manually check them all

UPDATE company_layoff t1
JOIN company_layoff t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


