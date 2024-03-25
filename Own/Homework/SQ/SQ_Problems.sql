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


-- Q7. Weekly Orders Report

-- ANSWER
WITH filtered_orders AS (
    SELECT 
        stage_of_order,
        DATE_FORMAT(week, '%Y-%m-%d') - INTERVAL (WEEKDAY(week) + 1) DAY AS week_start,
        quantity  
    FROM 
        orders_analysis
    WHERE 
        QUARTER(week) = 1 AND  -- Filters for Q1
        YEAR(week) = 2023  -- Filters for the year 2023
)
SELECT 
    DATE_FORMAT(week_start, '%Y-%m-%d') AS week, 
    sum(quantity)
FROM 
    filtered_orders
GROUP BY 1
ORDER BY 
    week_start;

-- Q8. Top Monthly Sellers
-- ANSWER

WITH january_sales AS (
    SELECT *
    FROM sales_data
    WHERE month = '2024-01'
),
ranked_sales AS (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY product_category ORDER BY total_sales DESC) AS sales_rank
    FROM january_sales
)
SELECT
    product_category,
    seller_id,
    total_sales,
    month
FROM
    ranked_sales
WHERE
    sales_rank <= 3
ORDER BY
    product_category, sales_rank;

-- Q9. Peak Online Time
-- ANSWER

WITH user_activity_with_time_period AS (
    SELECT
        start_timestamp,
        end_timestamp,
        user_count,
        device_type,
        CONCAT(start_timestamp, ' to ', end_timestamp) AS time_period
    FROM
        user_activity
),
ranked_user_activity AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY device_type ORDER BY user_count DESC) AS `rank`
    FROM
        user_activity_with_time_period
)
SELECT
    user_count,
    time_period,
    device_type
FROM
    ranked_user_activity
WHERE
    `rank` = 1;

-- Q10. Movie Duration Match
-- ANSWER

SELECT
    fs.flight_id,
    ec.movie_id,
    ec.duration AS movie_duration
FROM
    flight_schedule fs
JOIN
    entertainment_catalog ec ON ec.duration <= fs.flight_duration
WHERE
    fs.flight_id = 101
ORDER BY
    ec.duration;

-- Q11. Friday Purchases
-- ANSWER

WITH RECURSIVE all_weeks AS (
    SELECT 1 AS week_number
    UNION ALL
    SELECT week_number + 1 FROM all_weeks WHERE week_number < 13
),
friday_purchases AS (
    SELECT WEEK(date) AS week_number,
    AVG(amount_spent) AS mean_amount
    FROM user_purchases
    WHERE DAYNAME(date) = 'Friday' AND QUARTER(date) = 1
    GROUP BY WEEK(date)
)
SELECT all_weeks.week_number,
    COALESCE(friday_purchases.mean_amount, 0) AS mean_amount
FROM all_weeks
LEFT JOIN friday_purchases ON all_weeks.week_number = friday_purchases.week_number;

-- Q12. Finding Doctors
-- ANSWER

SELECT first_name, last_name
FROM employee_list
WHERE last_name = 'Johnson' AND profession = 'Doctor';


-- Q13. Employees With Same Birth Month
-- ANSWER
SELECT profession AS department,
    SUM(CASE WHEN MONTH(birthday) = 1 THEN 1 ELSE 0 END) AS month_1,
    SUM(CASE WHEN MONTH(birthday) = 2 THEN 1 ELSE 0 END) AS month_2,
    SUM(CASE WHEN MONTH(birthday) = 3 THEN 1 ELSE 0 END) AS month_3,
    SUM(CASE WHEN MONTH(birthday) = 4 THEN 1 ELSE 0 END) AS month_4,
    SUM(CASE WHEN MONTH(birthday) = 5 THEN 1 ELSE 0 END) AS month_5,
    SUM(CASE WHEN MONTH(birthday) = 6 THEN 1 ELSE 0 END) AS month_6,
    SUM(CASE WHEN MONTH(birthday) = 7 THEN 1 ELSE 0 END) AS month_7,
    SUM(CASE WHEN MONTH(birthday) = 8 THEN 1 ELSE 0 END) AS month_8,
    SUM(CASE WHEN MONTH(birthday) = 9 THEN 1 ELSE 0 END) AS month_9,
    SUM(CASE WHEN MONTH(birthday) = 10 THEN 1 ELSE 0 END) AS month_10,
    SUM(CASE WHEN MONTH(birthday) = 11 THEN 1 ELSE 0 END) AS month_11,
    SUM(CASE WHEN MONTH(birthday) = 12 THEN 1 ELSE 0 END) AS month_12
FROM employees_list
GROUP BY profession;


-- Q14. Most Profitable Companies
-- ANSWER

SELECT company,
       profit
FROM
  (SELECT *,
          rank() OVER (
                       ORDER BY profit DESC) as rnk
   FROM
     (SELECT company,
             sum(profits) AS profit
      FROM forbes_global_2010_2014
      GROUP BY company) sq) sq2
WHERE rnk <=3

-- Q15. Workers With The Highest Salaries
-- ANSWER (Below code is not running due to server error)

SELECT *
FROM
  (SELECT CASE
              WHEN salary =
                     (SELECT max(salary)
                      FROM worker) THEN worker_title
          END AS best_paid_title
   FROM worker a
   INNER JOIN title b ON b.worker_ref_id=a.worker_id
   ORDER BY best_paid_title) sq
WHERE best_paid_title IS NOT NULL;

-- Q16. Users By Average Session Time
-- ANSWER
SELECT user_id, AVG(TIMESTAMPDIFF(SECOND, load_time, exit_time)) AS session_time
FROM (
    SELECT 
        DATE(timestamp), 
        user_id, 
        MAX(IF(action = 'page_load', timestamp, NULL)) as load_time,
        MIN(IF(action = 'page_exit', timestamp, NULL)) as exit_time
    FROM facebook_web_log
    GROUP BY 1, 2
) t 
GROUP BY user_id
HAVING session_time IS NOT NULL;


-- Q17. Activity Rank
-- ANSWER

SELECT from_user, 
       count(*) as total_emails,
       ROW_NUMBER() OVER(ORDER BY count(*) DESC, from_user ASC) AS ranked
FROM google_gmail_emails 
GROUP BY from_user
ORDER BY 2 DESC, 1

-- Q18. Algorithm Performance

-- ANSWER (Below code is not running due to server error)
/*
SELECT search_id, 
       MAX(CASE WHEN clicked = 0 THEN 1
            WHEN clicked = 1 AND search_results_position > 3 THEN 2
            WHEN clicked = 1 AND search_results_position <= 3 THEN 3
            END) AS rating
FROM fb_search_events
GROUP BY 1
*/
-- Q19. Distances Traveled

-- ANSWER (Below code is not running due to server error)

SELECT
    u.id,
    u.name,
    SUM(r.distance) total_dist
FROM
    lyft_rides_log r
INNER JOIN
    lyft_users u ON r.user_id = u.id
GROUP BY u.id, u.name
ORDER BY total_dist DESC
LIMIT 10;


-- Q20.Finding User Purchases
-- ANSWER (Reults are not showing as there is date formatting issue. Code is correct)

SELECT DISTINCT a1.user_id
FROM amazon_transactions a1
JOIN amazon_transactions a2 ON a1.user_id = a2.user_id
AND a1.id <> a2.id
AND DATEDIFF(a2.created_at, a1.created_at) BETWEEN 0 AND 7
ORDER BY a1.user_id;

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

    
    
    
    
    