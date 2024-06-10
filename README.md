# portfolio-projects
## Data cleaning an exploration in mysql

This repository contains files to projects that i have done in mysql to practise my skills. This includes 
* Date and time functions in mysql
* String functions
* Different ways of removing duplicate data
* views in my sql
* Data cleaning in mysql
* when and how to use CTEs in mysql
  
### Introduction
This repository showcases SQL queries and scripts. SQL (Structured Query Language) is used to retrieve, analyze, and manipulate the data, showcasing various advanced SQL techniques.

### Built with
SQL languages
* MYSQL
* PSQL
* SQL
* SQL LITE
Tools
* MySQL Workbench
* pgAdmin
* DB Browser for SQLite

# Projects and challenges
### Data Cleaning
![clean](https://github.com/allan-pg/portfolio-projects/assets/62595869/739e3887-a359-4236-b7a4-cb7c56955481)


Data cleaning is a vital step in the data preparation process that involves identifying and correcting errors, inconsistencies, and inaccuracies in your dataset to ensure that it is accurate, reliable, and suitable for analysis.Cleaning the data can be so challenging and sometimes tiring, and most importantly time-consuming, hence proper attention is needed to achieve its goal, which tends to be arriving at accurate, consistent, and complete data for analysis. I went ahead to clean the data found on this repo using mysql.

The data set contains 1000 rows and 9 columns.

Before starting the cleaning process I manually assessed the dataset, to look for inconsistencies, errors, null values, duplications, unwanted columns, irrelevant characters, and errors.
![layoff](https://github.com/allan-pg/portfolio-projects/assets/62595869/1467628b-eab8-47e3-8a58-907c43ac1961)

I used mysql to check for any duplicates in our dataset by use window functions. SQL window functions are very useful and work almost identical in all modern databases.
![x](https://github.com/allan-pg/portfolio-projects/assets/62595869/9f43a781-4e69-4700-8f2b-005c8aed8244)

we can also check for duplicates usin inner joins
![i](https://github.com/allan-pg/portfolio-projects/assets/62595869/4d992706-7173-47c4-93ef-d9982934fc23)


Clearly there is redudant data in our dataset. I deleted the by use of a CTE
![de](https://github.com/allan-pg/portfolio-projects/assets/62595869/2217ceab-994a-434d-ab66-68dbd0e9a5f7)

2. Check for null values
![n2](https://github.com/allan-pg/portfolio-projects/assets/62595869/8cc9995a-85af-4ccc-ae6a-7fe5163ef18f)

3. set empty rows to null
![n1](https://github.com/allan-pg/portfolio-projects/assets/62595869/7a9298c8-f4c4-4625-be0f-a6093f82b4a2)

4. check if all the industry now there is no empty value
![n3](https://github.com/allan-pg/portfolio-projects/assets/62595869/438242f7-0cb5-46b2-9f8b-56fcb1bf7c88)

5. populate empty rows usin update
![n4](https://github.com/allan-pg/portfolio-projects/assets/62595869/14f95b30-2a93-4447-b745-454d3b2ca35e)

### Conclusion

DAta cleaning is an important part of data analysis. Data cleanin is a guardian of data integrity and ensures conclusions drawn are accurate and reliable and meaningful.

Clean data is more accurate and consistent.




