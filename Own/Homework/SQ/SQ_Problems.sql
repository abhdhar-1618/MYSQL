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
    
    
-- Q2. Population Density
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



-- Q3. Aggregate Listening Data
-- ANSWER

SELECT
user_id,
ROUND(SUM(IFNULL(listen_duration, 0)) / 60.0) AS total_listen_duration,
COUNT(DISTINCT song_id) AS unique_song_count
FROM listening_habits
GROUP BY user_id;

-- Q4. Customer Feedback Analysis
-- ANSWER
WITH filtered_comments AS (
SELECT DISTINCT feedback_id, feedback_text, source_channel, comment_category
FROM customer_feedback
WHERE comment_category != 'short_comments'
AND source_channel = 'social_media'
ORDER BY feedback_id, feedback_text, source_channel, comment_category
)
SELECT feedback_id, feedback_text, source_channel, comment_category
FROM filtered_comments
ORDER BY feedback_id;

-- Q5. Common Friends Script
-- ANSWER

WITH cte AS (
    SELECT friend_id 
    FROM friends
    WHERE user_id = (SELECT user_id FROM users WHERE user_name = 'Karl')
    INTERSECT
    SELECT friend_id 
    FROM friends
    WHERE user_id = (SELECT user_id FROM users WHERE user_name = 'Hans')
)

SELECT cte.friend_id, u.user_name
FROM cte
JOIN users u ON cte.friend_id = u.user_id;

-- Q6. Friday's Likes Count
-- ANSWER

WITH friendships_clean AS (
    SELECT DISTINCT user_name1, user_name2
    FROM friendships
),
friendships_expanded AS (
    SELECT user_name1, user_name2 FROM friendships_clean
    UNION ALL
    SELECT user_name2 AS user_name1, user_name1 AS user_name2 FROM friendships_clean
),
likes_posts_joined AS (
    SELECT 
        l.user_name, 
        l.post_id, 
        l.date_liked,
        p.user_name AS poster_name
    FROM likes l
    JOIN user_posts p ON l.post_id = p.post_id
    WHERE l.date_liked IS NOT NULL
),
friends_likes AS (
    SELECT lp.user_name, lp.post_id, lp.date_liked, lp.poster_name
    FROM likes_posts_joined lp
    JOIN friendships_expanded fe ON lp.user_name = fe.user_name1 AND lp.poster_name = fe.user_name2
),
friday_likes AS (
    SELECT post_id, date_liked
    FROM friends_likes
    WHERE DAYOFWEEK(date_liked) = 6
)
SELECT DATE_FORMAT(date_liked, '%Y-%m-%d') AS date_liked, COUNT(post_id) AS likes
FROM friday_likes
GROUP BY date_liked
ORDER BY date_liked;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'user_posts';

ALTER TABLE user_posts
MODIFY COLUMN user_name VARCHAR(50),
MODIFY COLUMN date_posted date;





-- Q7.
-- ANSWER

-- Q8.
-- ANSWER

-- Q9.
-- ANSWER

-- Q10.
-- ANSWER




-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER

-- Q3.
-- ANSWER 

    
    
    
    
    