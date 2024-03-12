/*

Spotify Penetration Analysis:


Market penetration is an important metric for understanding Spotify's performance and growth potential in different regions.
You are part of the analytics team at Spotify and are tasked with calculating the active user penetration rate in specific markets.


For this task, 'active_users' are defined based on the  following criterias:


•	last_active_date: The user must have interacted with Spotify within the last 30 days.
•	monthly_active_sessions: The user must have engaged with Spotify for at least 5 sessions in the past month.
•	listening_hours: The user must have spent at least 10 hours listening on Spotify in the past month.


Based on the condition above, calculate the active 'user_penetration_rate' by using the following formula.


•	Active User Penetration Rate = (Number of Active Spotify Users in the Market / Total Population of the Market)


Total Population of the market is based on both active and passive users.
​
The output should contain 'country' and 'active_user_penetration_rate'. Make sure that all countries that appear in the dataset are also present in the output of your solution.


Let's assume the current_day is 2024-01-31.


*/



WITH active_users AS (
    SELECT
        country,
        SUM(IF(CAST(last_active_date AS DATE) >= '2024-01-31' - INTERVAL 30 DAY
                AND monthly_active_sessions >= 5
                AND listening_hours >= 10, 1, 0)) AS active_users_count,
        total_population
    FROM
        penetration_analysis
    GROUP BY
        country,
        total_population
), penetration_rate AS (
    SELECT
        country,
        -- Calculate the penetration rate, ensuring the result is a float
        CAST(active_users_count AS DECIMAL(18, 10)) / GREATEST(CAST(total_population AS DECIMAL(18, 10)), 1) AS active_user_penetration_rate
    FROM
        active_users
)
SELECT
    country,
    -- Manually constructing the decimal string to ensure visibility of small values
    CONCAT(
        FORMAT(active_user_penetration_rate, 10), -- Use FORMAT for the initial number, specifying precision
        REPEAT('0', 10 - LENGTH(SUBSTRING_INDEX(FORMAT(active_user_penetration_rate, 10), '.', -1))) -- Append additional zeros if necessary
    ) AS active_user_penetration_rate
FROM
    penetration_rate;