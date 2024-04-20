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
AVG(gdp_percapita) AS avg_gdpv
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
-- Return only first 10 records
LIMIT 10;

/*
Perform a full join with countries (left) and currencies (right).
Filter for the North America region or NULL country names.
(some data may be missing from the below tables)
*/

SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
FULL JOIN currencies
USING (code)
-- Where region is North America or name is null
WHERE region = 'North America' OR name IS NULL
ORDER BY region;


/*
Complete the FULL JOIN with countries as c1 on the left and languages as l on the right, 
using code to perform this join.Next, chain this join with another FULL JOIN, 
placing currencies on the right, joining on code again.
*/
/*
SELECT 
	c1.name AS country, 
    region, 
    l.name AS language,
	basic_unit, 
    frac_unit
FROM countries as c1 
-- Full join with languages (alias as l)
FULL JOIN languages l
USING (code)
-- Full join with currencies (alias as c2)
FULL JOIN currencies c2
USING (code)
WHERE region LIKE 'M%esia';

*/

SELECT 
    c1.name AS country, 
    region, 
    l.name AS language,
    c2.basic_unit, 
    c2.frac_unit
FROM 
    countries AS c1 
LEFT JOIN 
    languages AS l ON c1.code = l.code
RIGHT JOIN 
    currencies AS c2 ON c1.code = c2.code
WHERE 
    region LIKE 'M%esia';

-- TESTING
SELECT * FROM monarchs
INNER JOIN presidents
ON monarchs.country = presidents.country;


-- UNION

-- Select all fields from economies2015
SELECT * FROM economies2015
-- Set operation
UNION
-- Select all fields from economies2019
SELECT * FROM economies2019
ORDER BY code, year;






SELECT 
    c.name AS country,
    -- Count matches in each of the 3 seasons
    COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
    COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
    COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM 
    country AS c
LEFT JOIN 
    matches AS m
ON 
    c.id = m.country_id
GROUP BY 
    c.name;


/*
Create 3 CASE statements to "count" matches in the '2012/2013', '2013/2014', and '2014/2015' seasons, respectively.
Have each CASE statement return a 1 for every match you want to include, and a 0 for every match to exclude.
Wrap the CASE statement in a SUM to return the total matches played in each season.
Group the query by the country name alias.
*/

SELECT 
	c.name AS country,
    -- Sum the total records in each season where the home team won
	SUM(CASE WHEN m.season = '2012/2013' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2012_2013,
 	SUM(CASE WHEN m.season = '2013/2014' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY c.name;


SELECT home_team_goal
FROM matches
LIMIT 10;

/*
Complete the subquery inside the FROM clause. Select the country name from the country table, along with the date, the home goal, the away goal, and the total goals columns from the match table.
Create a column in the subquery that adds home and away goals, called total_goals. This will be used to filter the main query.
Select the country, date, home goals, and away goals in the main query.
Filter the main query for games with 10 or more total goals.
*/

SELECT
	-- Select country, date, home, and away goals from the subquery
    country,
    date,
    home_goal,
    away_goal
FROM 
	-- Select country name, date, home_goal, away_goal, and total goals in the subquery
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM matches AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subq
-- Filter by total goals scored in the main query
WHERE total_goals >= 10;


/*
In the subquery, select the average total goals by adding home_goal and away_goal.
Filter the results so that only the average of goals in the 2013/2014 season is calculated.
In the main query, select the average total goals by adding home_goal and away_goal. This calculates the average goals for each league.
Filter the results in the main query the same way you filtered the subquery. Group the query by the league name.
*/

SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM matches
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN matches AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE m.season = '2013/2014'
GROUP BY l.name;

/*
Select the average goals scored in a match for each league in the main query.
Select the average goals scored in a match overall for the 2013/2014 season in the subquery.
Subtract the subquery from the average number of goals calculated for each league.
Filter the main query so that only games from the 2013/2014 season are included.
*/

SELECT
	-- Select the league name and average goals scored
	l.name AS league,
	ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Subtract the overall average from the league average
	ROUND(AVG(m.home_goal + m.away_goal) - 
		(SELECT AVG(home_goal + away_goal)
		 FROM matches 
         WHERE season = '2013/2014'),2) AS diff
FROM league AS l
LEFT JOIN matches AS m
ON l.country_id = m.country_id
-- Only include 2013/2014 results
WHERE m.season = '2013/2014'
GROUP BY l.name;

/*
Extract the average number of home and away team goals in two SELECT subqueries.
Calculate the average home and away goals for the specific stage in the main query.
Filter both subqueries and the main query so that only data from the 2012/2013 season is included.
Group the query by the m.stage column.
*/

SELECT 
	-- Select the stage and average goals for each stage
	m.stage,
    ROUND(AVG(m.home_goal + m.away_goal),2) AS avg_goals,
    -- Select the average overall goals for the 2012/2013 season
    ROUND((SELECT AVG(home_goal + away_goal) 
           FROM matches 
           WHERE season = '2012/2013'),2) AS overall
FROM matches AS m
-- Filter for the 2012/2013 season
WHERE m.season = '2012/2013'
-- Group by stage
GROUP BY m.stage;

/*
Calculate the average home goals and average away goals from the match table for each stage in the FROM clause subquery.
Add a subquery to the WHERE clause that calculates the overall average home goals.
Filter the main query for stages where the average home goals is higher than the overall average.
Select the stage and avg_goals columns from the s subquery into the main query.
*/

SELECT 
	-- Select the stage and average goals from the subquery
	s.stage,
	ROUND(s.avg_goals,2) AS avg_goals
FROM 
	-- Select the stage and average goals in 2012/2013
	(SELECT
		 stage,
         AVG(home_goal + away_goal) AS avg_goals
	 FROM matches
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM matches WHERE season = '2012/2013');
                    
                    
/*
Create a subquery in SELECT that yields the average goals scored in the 2012/2013 season. Name the new column overall_avg.
Create a subquery in FROM that calculates the average goals scored in each stage during the 2012/2013 season.
Filter the main query for stages where the average goals exceeds the overall average in 2012/2013.
*/

SELECT 
	-- Select the stage and average goals from s
	s.stage,
    ROUND(s.avg_goals,2) AS avg_goal,
    -- Select the overall average for 2012/2013
    (SELECT AVG(home_goal + away_goal) FROM matches WHERE season = '2012/2013') AS overall_avg
FROM 
	-- Select the stage and average goals in 2012/2013 from match
	(SELECT
		 stage,
         AVG(home_goal + away_goal) AS avg_goals
	 FROM matches
	 WHERE season = '2012/2013'
	 GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.avg_goals > (SELECT AVG(home_goal + away_goal) 
                    FROM matches WHERE season = '2012/2013');
                    
/*
Select the country_id, date, home_goal, and away_goal columns in the main query.
Complete the AVG value in the subquery.
Complete the subquery column references, so that country_id is matched in the main and subquery.
*/

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal, 
    main.away_goal
FROM matches AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM matches AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);
         
/*
Select the country_id, date, home_goal, and away_goal columns in the main query.
Complete the subquery: Select the matches with the highest number of total goals.
Match the subquery to the main query using country_id and season.
Fill in the correct logical operator so that total goals equals the max goals recorded in the subquery.
*/

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM matches AS main
WHERE 
	-- Filter for matches with the highest number of goals scored
	(home_goal + away_goal) = 
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM matches AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);

SELECT 
	-- Select country ID, date, home, and away goals from match
	country_id,
    date,
    home_goal,
    away_goal
FROM (
    SELECT 
        main.country_id,
        main.date,
        main.home_goal,
        main.away_goal,
        RANK() OVER (PARTITION BY main.country_id, main.season ORDER BY main.home_goal + main.away_goal DESC) AS goal_rank
    FROM matches AS main
) AS ranked
WHERE goal_rank = 1;

/*
Select the country_id, date, home_goal, and away_goal columns in the main query.
Complete the subquery: Select the matches with the highest number of total goals.
Match the subquery to the main query using country_id and season.
Fill in the correct logical operator so that total goals equals the max goals recorded in the subquery.
*/

SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal,
    main.away_goal
FROM matches AS main
WHERE 
	-- Filter for matches with the highest number of goals scored
	(home_goal + away_goal) = 
        (SELECT MAX(sub.home_goal + sub.away_goal)
         FROM matches AS sub
         WHERE main.country_id = sub.country_id
               AND main.season = sub.season);


/*
Complete the main query to select the season and the max total goals in a match for each season. Name this max_goals.
Complete the first simple subquery to select the max total goals in a match across all seasons. Name this overall_max_goals.
Complete the nested subquery to select the maximum total goals in a match played in July across all seasons.
Select the maximum total goals in the outer subquery. Name this entire subquery july_max_goals.
*/

SELECT
	-- Select the season and max goals scored in a match
	season,
    MAX(home_goal + away_goal) AS max_goals,
    -- Select the overall max goals scored in a match
   (SELECT MAX(home_goal + away_goal) FROM matches) AS overall_max_goals,
   -- Select the max number of goals scored in any match in July
   (SELECT MAX(home_goal + away_goal) 
    FROM matches
    WHERE id IN (
          SELECT id FROM matches WHERE EXTRACT(MONTH FROM date) = 07)) AS july_max_goals
FROM matches
GROUP BY season;


/*
Generate a list of matches where at least one team scored 5 or more goals.
*/

-- Select matches where a team scored 5+ goals
SELECT
	country_id,
    season,
	id
FROM matches
WHERE home_goal >=5 OR away_goal >=5;


/*
Turn the query from the previous step into a subquery in the FROM statement.
COUNT the match ids generated in the previous step, and group the query by country_id and season.
*/

-- Count match ids
SELECT
    country_id,
    season,
    COUNT(id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM matches
	WHERE home_goal >= 5 OR away_goal >= 5)
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;


/*
Finally, declare the same query from step 2 as a subquery in FROM with the alias outer_s.
Left join it to the country table using the outer query's country_id column.
Calculate an AVG of high scoring matches per country in the main query.
*/

SELECT
	c.name AS country,
    -- Calculate the average matches per season
	AVG(outer_s.matches) AS avg_seasonal_high_scores
FROM country AS c
-- Left join outer_s to country
LEFT JOIN (
  SELECT country_id, season,
         COUNT(id) AS matches
  FROM (
    SELECT country_id, season, id
	FROM matches
	WHERE home_goal >= 5 OR away_goal >= 5) AS inner_s
  -- Close parentheses and alias the subquery
  GROUP BY country_id, season) AS outer_s
ON c.id = outer_s.country_id
GROUP BY country;

/*
Complete the syntax to declare your CTE.
Select the country_id and match id from the match table in your CTE.
Left join the CTE to the league table using country_id.
*/

-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id, 
  		id
    FROM matches
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(match_list.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;

/*
Declare your CTE, where you create a list of all matches with the league name.
Select the league, date, home, and away goals from the CTE.
Filter the main query for matches with 10 or more goals.
*/

-- Set up your CTE
WITH match_list AS (
  -- Select the league, date, home, and away goals
    SELECT 
  		l.name AS league, 
     	m.date, 
  		m.home_goal, 
  		m.away_goal,
       (m.home_goal + m.away_goal) AS total_goals
    FROM matches AS m
    LEFT JOIN league as l ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT league, date, home_goal, away_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >= 10;


/*
Declare a CTE that calculates the total goals from matches in August of the 2013/2014 season.
Left join the CTE onto the league table using country_id from the match_list CTE.
Filter the list on the inner subquery to only select matches in August of the 2013/2014 season.
*/


-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id,
  	   (home_goal + away_goal) AS goals
    FROM matches
  	-- Create a list of match IDs to filter data in the CTE
    WHERE id IN (
       SELECT id
       FROM matches
       WHERE season = '2013/2014' AND EXTRACT(MONTH FROM date) = 8))
-- Select the league name and average of goals in the CTE
SELECT 
	l.name,
    AVG(match_list.goals)
FROM league AS l
-- Join the CTE onto the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;

/*
Create a query that left joins team to match in order to get the identity of the home team. This becomes the subquery in the next step.
*/

SELECT 
	m.id, 
    t.team_long_name AS hometeam
-- Left join team to match
FROM matches AS m
LEFT JOIN TEAM as t
ON m.hometeam_id = team_api_id;

/*
Add a second subquery to the FROM statement to get the away team name, 
changing only the hometeam_id. Left join both subqueries to the match table on the id column.
*/

SELECT
	m.date,
    -- Get the home and away team names
    home.hometeam,
    away.awayteam,
    m.home_goal,
    m.away_goal
FROM matches AS m

-- Join the home subquery to the match table
LEFT JOIN (
  SELECT matches.id, team.team_long_name AS hometeam
  FROM matches
  LEFT JOIN team
  ON matches.hometeam_id = team.team_api_id) AS home
ON home.id = m.id

-- Join the away subquery to the match table
LEFT JOIN (
  SELECT matches.id, team.team_long_name AS awayteam
  FROM matches
  LEFT JOIN team
  -- Get the away team ID in the subquery
  ON matches.awayteam_id = team.team_api_id) AS away
ON away.id = m.id;


/*
Using a correlated subquery in the SELECT statement, match the team_api_id column from team to the hometeam_id from match.
*/

SELECT
    m.date,
   (SELECT team_long_name
    FROM team AS t
    -- Connect the team to the match table
    WHERE t.team_api_id = m.hometeam_id) AS hometeam
FROM matches AS m;

/*
Create a second correlated subquery in SELECT, yielding the away team's name.
Select the home and away goal columns from match in the main query.
*/

SELECT
    m.date,
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.hometeam_id) AS hometeam,
    -- Connect the team to the match table
    (SELECT team_long_name
     FROM team AS t
     WHERE t.team_api_id = m.awayteam_id) AS awayteam,
    -- Select home and away goals
     m.home_goal,
     m.away_goal
FROM matches AS m;





