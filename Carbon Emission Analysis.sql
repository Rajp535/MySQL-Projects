-- creating a database
create database carbon_emissions;
-- using the database
use carbon_emissions;
-- droping the table
drop table emissions;
drop table reduced_carbon;

-- creating table
create table emissions(id int auto_increment primary key,
					   Country varchar(100),
                       Year int,
                       Series varchar(100),
                       Value decimal(10,2));
create table reduced_carbon(id int auto_increment primary key,
							Type varchar(100),
                            Reduced_Carbon_Gt decimal(10,2),
                            How varchar(200));

-- loading csv file into the table
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Carbon Dioxide Emission Estimates.csv' into table emissions
fields terminated by ','
enclosed by ""
lines terminated by '/n'
ignore 1 rows;
-- loading file 2 into the table
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/reduce_Carbon.csv' into table reduced_carbon
fields terminated by ','
enclosed by ""
lines terminated by '/n'
ignore 1 rows;

-- showing the values from the table
select * from emissions;
select * from reduced_carbon;

-- Data Cleaning (checking nulls)
select * from emissions where Country is null or Value is null;

-- Analysis
-- total emissions for a specific year
select sum(Value) as total_values from emissions where year=1975;
-- count of emissions in a specific year
select count(Value) as number_of_emissions from emissions where year=2017;
-- finding countries with the highest emissions in a given year
select Country,Value from emissions where year=2016 order by Value desc limit 3;
-- Average Emissions per year for a country
select Country,Year, avg(Value) as avg from emissions where country ='Zimbabwe' group by Year;
-- growth rate of avg price compared to previous year
select Year, avg(Value) as avg,
(avg(Value)/lag(avg(Value)) over(order by Year))-1 as GrowthRate
from emissions group by Year;
-- Average Emissions in each year per each type
select e.Year,rc.Type,rc.Reduced_Carbon_Gt,avg(e.Value) as avg from emissions e
join reduced_carbon rc on e.id=rc.id GROUP BY e.Year,rc.Type,rc.Reduced_Carbon_Gt;
-- Percentage Reduction for each type
select rc.Type,rc.Reduced_Carbon_Gt,avg(e.Value),(avg(rc.Reduced_Carbon_Gt)/avg(e.Value))*100 as Percent_Reduction
from emissions e join reduced_carbon rc on e.id=rc.id group by rc.Type,rc.Reduced_Carbon_Gt;



