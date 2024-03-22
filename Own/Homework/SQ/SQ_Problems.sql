-- Q1. Spotify Penetration Analysis
-- ANSWER
WITH active_users AS (
    SELECT
        country,
        SUM(CASE WHEN CAST(last_active_date AS DATE) >= DATE_SUB('2024-01-31', INTERVAL 30 DAY)
                AND monthly_active_sessions >= 5
                AND listening_hours >= 10 THEN 1 ELSE 0 END) AS active_users_count,
        COUNT(*) AS total_users,
        total_population 
    FROM
        penetration_analysis
    GROUP BY
        country,
        total_population
), penetration_rate AS (
    SELECT
        country,
        -- Ensure division by at least 1 to avoid division by zero
        -- Convert the result to FLOAT for accurate division
        CAST(active_users_count AS FLOAT) / GREATEST(total_population, 1) AS active_user_penetration_rate
    FROM
        active_users
)
SELECT
    country,
    -- Format the penetration rate with 10 decimal places. Adjust the format as needed.
    FORMAT(active_user_penetration_rate, 10) AS active_user_penetration_rate
FROM
    penetration_rate;
    
    
-- Q1. Population Density
-- ANSWER

WITH density AS (
    SELECT 
        city, 
        country, 
        ROUND(population / IF(area = 0, NULL, area)) AS density
    FROM 
        cities_population
    WHERE 
        area > 0
),
max_density AS (
    SELECT 
        city, 
        country, 
        density
    FROM 
        density
    WHERE 
        density = (SELECT MAX(density) FROM density)
),
min_density AS (
    SELECT 
        city, 
        country, 
        density
    FROM 
        density
    WHERE 
        density = (SELECT MIN(density) FROM density)
),
combined_density AS (
    SELECT * FROM max_density
    UNION ALL
    SELECT * FROM min_density
)
SELECT 
    city, 
    country, 
    density
FROM 
    combined_density
ORDER BY 
    density ASC;


    
    
    
    
    