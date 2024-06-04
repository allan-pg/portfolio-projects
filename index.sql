CREATE DATABASE school;

use school;

CREATE TABLE class(
adm int not null,
first_name VARCHAR(15),
last_name VARCHAR(15),
age int
);
INSERT INTO class
values(1001, "Joan", "Nerianj", 14),
		(1002, "Werner", "Kimberly", 15),
        (1003, "Armol", "Vase", 13),
        (1004, "Jokil", "Ablo", 16),
        (1005, "Dester", "Daps", 15),
        (1006, "Peter", "Uwae", 14),
        (1007, "Delo", "Waren", 15);
        
-- ------------------------------------------- SQL INDEXING -------------------------------------------------------------------------
-- SQL Index is a binary tree data structure
-- Indexes are used to find values in a column more quickly
-- MYSQL searces sequentially through a column meaning it has to look at every value in a column
-- This may be expensive and time consuming when havin a table with million of records
-- update takes more time and select takes less time meaning :-
-- indexes are used on tables we use select statements more often but not on tables we update regularly

-- select all data from your TABLE

SELECT * FROM CLASS;

-- 1. to check for indexes in your database

SHOW INDEXES from class;

-- 2. clearly our table has no indexes so lets add an index
-- lets make first name our index

create INDEX first_name_idx
on class(first_name);
-- we have created an index successful
-- check it out by showin indexes on your table

-- use the first name index to search for any student on our clas table
select *
from class
WHERE first_name like "_o%";

-- on a more larger table index are more useful since now MYSQL does not need to look at every value but only on the index
-- 3. to delete an index from a table
ALTER TABLE class
DROP INDEX first_name_idx;
