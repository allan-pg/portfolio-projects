-- --------------------------------- DATE AND TIME FUNCTIONS -----------------------------------
-- DATE TIME FUNCTIONS ARE used to manipulate date and time to any desired format 
-- 1. To get the current date and current time 

-- current date gives you the date only
select current_date();

-- current time gives you time only
select current_time();

-- to get both date and time we use current_timestamp
select current_timestamp();

-- In a date column we can get the year or the month or day from dates
-- to get the year
select year(current_date()) as year;

-- to get the month
select month(current_date()) as month;
-- to return month name use monthname() function
select monthname(current_date()) as month_name;

-- to get the day use day() function
select day(current_date()) as day;
-- to get the day name
SELECT dayname(current_date()) as day_name;
-- return day of the week
SELECT dayofweek(current_date()) as day_of_week;
-- return day number of the year
SELECT dayofyear(current_date()) as day_number;

-- we can also get the hour minute or second from time columns
SELECT current_time();

-- to return only hour from current time
SELECT hour(current_time()) as hours;
-- return minutes from current time
SELECT minute(current_time()) as minutes;
-- return seconds from current time
SELECT second(current_time()) as seconds;

-- Extract() -is used to extract a specific component (year, month, day, e.t.c) from date, time or timestamp
-- syntax 
-- --> select extract(component from column_name);
SELECT extract(year from current_date()) as cur_year;

select extract(month from current_date()) as cur_month;

-- datediff() gives us a difference btwen two dates

SELECT datediff(current_date(), '2024-01-01') as date_diference;

-- timediff() gives the difference btwen two times or timestamps

select timediff(current_time(), "12:20:14") as time_diference;
-- from the result the interval is in form of hour : minute: seconds

-- Date add function allows us to add dates --------
-- syntax ---------------
-- 	date_add(date, interval days/month/year)
SELECT date_add(current_date(), interval 20 day) as twnty_days_to_come;
-- we can also add months
SELECT date_add(current_date(), interval 2 month) as two_months_to_come;
-- we can also add a year
SELECT date_add(current_date(), interval 1 year) as one_years_to_come;

-- Date_sub() function is used to subtract dates from certain interval be it days/months/year
-- subtract days
SELECT date_sub(current_date(), interval 20 day) as twnty_days_ago;
-- subtract years
SELECT date_sub(current_date(), interval 1 year) as one_years_ago;

-- --------------sql query examples using the above functions ---------------------------------------------------
-- we can use employees table i have included the data set
select * from employee;
DESCRIBE employee;

-- 1. select emp_id, first_name, last_name and find their ages using date column
SELECT emp_id,
	   first_name,
       last_name,
       datediff(current_date(), date) as ages
from employee;

-- 2. select emp_id, first_name, and add five years to dob where last_name has 6 characters
SELECT emp_id,
		first_name,
        date_add(date, interval 5 year) as five_years_from_birt
from employee
WHERE last_name LIKE "______";

-- 3. select emp_id, first_name, last_name and find the difference from hire_date to current_date where age is reater tan 40

SELECT first_name,
		last_name,
        datediff(current_date(), hire_date) as "years hired"
	FROM employee
    WHERE age > 40;
    
-- 4.find employees born in 1990 and above
SELECT * FROM employees
WHERE date > "1990-01-01";

-- 5. find employees from engineering hired in the year 2010 on any month
SELECT * FROM employee
WHERE hire_date  between "2010-01-01" and "2010-12-31"; 

