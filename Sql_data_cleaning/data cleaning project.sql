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
-- the above query also needs a where clause e.g where c1.id < c2.id

-- ---------------------- delete the duplicate data -------------------------------------
DELETE FROM company_layoffs
WHERE ( SELECT * FROM (
		SELECT *,
		ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, 'date') rn 
 FROM company_layoffs
 ) duplicates
 WHERE duplicates.rn > 1)