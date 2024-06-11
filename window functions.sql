-- window functions in mysql------------------------------------------
-- window functions allow us to make sql statement about rows that are related during processing
/*
-- Actual function such as Sum, Count, Avg, First, Lead, Row_number, dense_rank and so on.
Over clause which makes analytical function different from Aggregate functions and it is further divided into three parts:
		a) Partition By clause which partitioned the data into groups based on the column(s)
		b) Order By clause which orders the rows within a partition and is not same as order by clause at the end of the query
		c) Windowing clause which is a very important part of analytical query syntax but is greatly misunderstood or under-utilized.
        
SYNTAX FOR WINDOW FUNCTIONS
	FUNCTION_NAME( column | expression,column | expression,... ) 
	OVER 
	( Partition-Clause Order-by-Clause Windowing-Clause )
*/

use human_resource;
SELECT  * FROM hr;

-- 1. find the number of employees per department oder by department WITH highest no. of employee
SELECT  
        DISTINCT(department),
        count(emp_id) over(PARTITION BY department ORDER BY department desc ) as no_of_employee
	FROM hr
    ORDER BY no_of_employee DESC;
    
-- 2. find the number of employees per gender
SELECT  
        DISTINCT(gender),
        count(emp_id) over(PARTITION BY gender) as no_of_employee
	FROM hr;
    
-- 3. find max and min age per department 
SELECT  
        DISTINCT(department),
        max(age) over(PARTITION BY department) as max_age,
        min(age) over(PARTITION BY department) as min_age
	FROM hr
    ORDER BY max_age DESC;
    
-- 4. find the average age per department usin average function
SELECT DISTINCT(gender),
		avg(age) OVER(PARTITION BY gender )
	FROM hr;

-------------------------- ROW_NUMBER() --------------------------------------------
/*
	Row number gives rankin 1, 2, 3 within the partition by conditions
    and restarts upon reaching another unique group
*/
-- give the row number per department order by age ascending
SELECT emp_id,
		full_name,
        age,
        department,
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY age ASC) as `row_number`
FROM hr;

------------------------------ RANK() ----------------------------------------------
/*	rank function works the same as row number
	The rank function in SQL assigns the rank based on the defined attributes to each row within the given partition
	show the rank  and partition department and age wise
*/
SELECT emp_id,
	   full_name,
       department,
       age,
       RANK() OVER(PARTITION BY  department) rnk
FROM hr;

------------------------------- LAG() ----------------------------------------
-- LAG() allows us to compare condition with the previous row of current row.

/* we want to know person's age and next age in that department */
/* that is an additional column LAG. First row has no value because there is no previous value to compare.
So it continues to next row and lag value of that second row will be the value of previous row, etc.
It will restart again when we reache to another department.
*/
SELECT emp_id,
		full_name,
        age,
        department,
        LAG(age) OVER(PARTITION BY department ) as `previous age`
FROM hr;

--------------------- LEAD() function ---------------------------
-- opposite of LAG()
-- LEAD() allows us to compare condition with the next row of current row.
-- Check for next persons age per department
SELECT emp_id,
		full_name,
        age,
        department,
        LEAD(age) OVER(PARTITION BY department ) as `previous age`
FROM hr;

--------------------- NTILE(bins number) function ---------------------------
-- allows to create bins/ bucket

/* there are bins (1-10) assigned each employees based on the  specific department
and bin number restart for another department agian */
SELECT	emp_id,
	    full_name,
        department,
        NTILE(10) over(PARTITION BY department) as n_tile
	FROM hr;
        





	