-- Find the release_year and average duration of films for each year
SELECT 
release_year,
ROUND(AVG(duration),2) AS avg_duration
FROM films
GROUP BY release_year;

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT
release_year,
country,
MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year ASC, country ASC;

/*Answering business questions
In the real world, every SQL query starts with a business question. Then it is up to you to decide how to write the query that answers the question. Let's try this out.
Which release_year had the most language diversity?
Take your time to translate this question into code. We'll get you started then it's up to you to test your queries in the console.
"Most language diversity" can be interpreted as COUNT(DISTINCT ___). Now over to you.*/

SELECT
release_year,
COUNT(DISTINCT language) AS language_count
FROM films
WHERE language IS NOT NULL
GROUP BY release_year
ORDER BY language_count DESC;

/*
Select country from the films table, and get the distinct count of certification aliased as certification_count.
Group the results by country.
Filter the unique count of certifications to only results greater than 10.
*/

SELECT 
country,
COUNT(DISTINCT certification) AS certification_count
FROM films
GROUP BY country
HAVING COUNT(DISTINCT certification) > 10;


/*Select the country and average_budget from films
Group by country
Filter to countries with an average_budget of more than one billion
Order by descending order of the aggregated budget */

SELECT
country,
ROUND(AVG(budget),2) AS average_budget
FROM films
GROUP BY country
HAVING ROUND(AVG(budget),2) > 1000000000
ORDER BY average_budget DESC;

-- Select the release_year for films released after 1990 grouped by year
SELECT
release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- Modify the query to also list the average budget and average gross
SELECT 
release_year,
ROUND(AVG(budget),2) AS avg_budget,
ROUND(AVG(gross),2) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;

-- Modify the query to see only years with an avg_budget of more than 60 million

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;

-- Order the results from highest to lowest average gross and limit to one

SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC
LIMIT 1;

-- Perform an inner join with cities as c1 and countries as c2 on country code
SELECT 
c1.name AS city,
code,
c2.name AS country,
region,
city_proper_pop
FROM cities AS c1
INNER JOIN countries c2
ON C1.country_code = C2.code
ORDER BY code DESC;


/*
Change the code to perform a LEFT JOIN instead of an INNER JOIN.
After executing this query, have a look at how many records the query result contains.
*/

-- Join right table (with alias)

SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
LEFT JOIN countries c2
ON c1.country_code = c2.code
ORDER BY code DESC;

/*
Complete the LEFT JOIN with the countries table on the left and the economies table on the right on the code field.
Filter the records from the year 2010.
*/

SELECT 
name, 
region, 
gdp_percapita,
year
FROM countries AS c
LEFT JOIN economies AS e
-- Match on code fields
ON c.code = e.code
-- Filter for the year 2010
WHERE year = 2010;

/*
To calculate per capita GDP per region, begin by grouping by region.
After your GROUP BY, choose region in your SELECT statement, 
followed by average GDP per capita using the AVG() function, with AS avg_gdp as your alias.
*/

-- Select region, and average gdp_percapita as avg_gdp
SELECT
region,
AVG (gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY region;

/*
Order the result set by the average GDP per capita from highest to lowest.
Return only the first 10 records in your result.
*/

SELECT 
region, 
AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
-- Return only first 10 records
LIMIT 10;





















