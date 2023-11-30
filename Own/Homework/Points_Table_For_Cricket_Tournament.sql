-- Command to CREATE a new table
-- press CTRL + SHIFT + ENTER to run the selected part of the query
CREATE TABLE MatchResults (
    Team_1 VARCHAR(50),
    Team_2 VARCHAR(50),
    Winner VARCHAR(50)
);

-- Command to enter data into created table

INSERT INTO MatchResults (Team_1, Team_2, Winner) VALUES
    ('India', 'SL', 'India'),
    ('SL', 'Aus', 'Aus'),
    ('SA', 'Eng', 'Eng'),
    ('Eng', 'NZ', 'NZ'),
    ('Aus', 'India', 'India');

/*PROBLEM STATEMENT :- From the above data create a table showing Team_Name, Total Number_of_Matches_Played, 
                      Toatal No_of_Matches_Won and Total Number_of_Matches_Lost by each team*/

-- SOLUTION

-- Command to SELECT and display all the data in an SQL table

SELECT * FROM matchresults

-- The below code will show a grid of Winners and losers from Team_1 Column

SELECT Team_1, CASE WHEN Team_1=winner THEN 1 ELSE 0 END AS win_flag
FROM matchresults

-- The below code will show a grid of Winners and losers from both Team_1 and Team_2 Columns

SELECT Team_1, CASE WHEN Team_1=winner THEN 1 ELSE 0 END AS win_flag
FROM matchresults
UNION ALL
SELECT Team_2, CASE WHEN Team_2=winner THEN 1 ELSE 0 END AS win_flag
FROM matchresults


/*The below command will show a grid of Team_Name, Total Number_of_Matches_Played, 
Toatal No_of_Matches_Won and Total Number_of_Matches_Lost by each team*/

SELECT Team_1 as Team_Name, COUNT(1) AS No_of_Matches_Played, SUM(win_flag) AS No_of_Matches_Won, COUNT(1) - SUM(win_flag) AS No_of_Losses
FROM (
SELECT Team_1, CASE WHEN Team_1=winner THEN 1 ELSE 0 END AS win_flag
FROM matchresults
UNION ALL
SELECT Team_2, CASE WHEN Team_2=winner THEN 1 ELSE 0 END AS win_flag
FROM matchresults) A
GROUP BY Team_Name
ORDER bY No_of_Matches_Won DESC

/*In summary, this query is designed to provide a summary of the performance of each team 
in terms of the number of matches played, the number of matches won, and the number of losses. 
The results are ordered by the number of matches won in descending order, showing the most successful teams first.*/















