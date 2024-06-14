---------------------------------STRINGS in MYSQL ------------------------------------
-- These comprises some of string functions in mysql that enable us to work with strings

-- -------------------------------STRINGS in MYSQL ------------------------------------
-- These comprises some of string functions in mysql that enable us to work with strings

use witu;
CREATE TABLE students(
	rollno int not null,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    age int);
    
INSERT INTO students
VALUES (123, "Rajvki", "Quirisha", 15),
		(129, "Doulas", "Breen", 16),
        (164, "Tatik", "Lampard", 15),
        (101, "Said", "Zackie", 14),
        (177, "Allen", "Barlit", 16);

SELECT * FROM students;

-- concatenate ------------------
-- concatenate is used to combine strings
-- add two names Jon and Linda to make a full name
SELECT concat("Jon"," ", "Linda" ) as full_name;

-- extract full namesz of students from our students table
SELECT concat(first_name, " ", last_name) as full_name
FROM students;

-- -------------------- LEFT ---------------------------------
-- is used to extract characters from the left and you need to specify number of characters
-- picks up 5 characters from the left
SELECT left("Prepaid", 5);

SELECT left(first_name, 5) as `left`
from students;

-- -------------------------RIGHT------------------------------
-- This opposite of left function 
-- it picks characters from right
SELECT right("Prepaid", 5);

-- it starts counting from the right
-- Extract 3 characters from right
SELECT right(last_name, 3) as `right`
from students;

-- ---------------TRIM---------------------------------------
-- Trim function is used to get rid of whitespaces on the left and right
-- But if you have white spaces at the middle it doesnt get rid of them
SELECT trim("    I     went        home              ") as sentence;

SELECT trim("   Allan            ") as `name`;

SELECT trim("   Kimberly") as fname;

-------------------- LTRIM ----------------------------------------
-- LTRIM  gets rid of white spaces on the left
SELECT ltrim("        Quirisha") as `name`;

-- RTRIM ets rid of extra white spaces on the right
SELECT rtrim("Poker         	") as `name`;

-- ------------- ----------- UPPER -----------------------
-- coverts your string to upper case
SELECT first_name,
		upper(first_name) as first_name
from students;

-- ucase() works same way as upper 
-- coverts your string to upper case
SELECT ucase(first_name) as first_name
from students;

-- -------------------- LOWER -------------------
-- coverts your string to lower case
SELECT first_name,
		lower(first_name) as first_name
from students;

-- lcase() works the same as lower 
-- it coverts your string to lower case
SELECT lcase(first_name) as first_name
from students;

-- --------------------- substring ----------------------------
-- it is used to extract a part of a string
/*
		syntax
				substring(column , start point, number of characters)
		it takes 3 arguments
			1. specify column name you are targeting
            2. the point from where you need to start 
            3. The number of characters to extract
*/
-- extract 3 characters from firstname and start from first character
SELECT first_name,
		substring(first_name , 1, 3) as F_name_part
FROM students;

-- we can use this on phone numbers to get country code
SELECT substring("+23378181999", 1, 4) as area_code;

-------------------- LOCATE -------------------------------
/*
	it takes two arguments what we want to search and where to search
    it returns the location of what we are looking for
    
*/
SELECT locate("n","Allan");

-- In this case two `a` what locate does it returns the location of first position 
SELECT locate("a", "Allan");

-- ----------------------------------- REPLACE ------------------------------------
/*
	it takes 3 arguments 
		1. where to replace
        2. what is to be removed
        3. what replaces the removed character or word
*/
-- replace vegetable with fruit from "apple is a vegetable"

SELECT replace("apple is a vegetable", "vegetable", "fruit");

-- replace breen with brian where student rollno is 129
SELECT  last_name,
		replace(last_name, "Breen", "Brian") new_name
	FROM students
    WHERE rollno= 129;
    
    -- ----------------------REVERSE--------------------------
    -- is used to reverse a string
    SELECT reverse("Word") as `reverse`;
