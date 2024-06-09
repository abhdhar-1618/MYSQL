SELECT
SUM(serial_number)
FROM elections;


WITH RankedVotes AS (
    SELECT
        parliamentary_constituency,
        candidate,
        total_votes,
        RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS vote_rank
    FROM elections
),
WinnersAndRunnersUp AS (
    SELECT
        parliamentary_constituency,
        MAX(CASE WHEN vote_rank = 1 THEN candidate ELSE NULL END) AS winning_candidate,
        MAX(CASE WHEN vote_rank = 1 THEN total_votes ELSE NULL END) AS winning_votes,
        MAX(CASE WHEN vote_rank = 2 THEN candidate ELSE NULL END) AS runner_up_candidate,
        MAX(CASE WHEN vote_rank = 2 THEN total_votes ELSE NULL END) AS runner_up_votes
    FROM RankedVotes
    GROUP BY parliamentary_constituency
)
SELECT
    parliamentary_constituency,
    winning_candidate,
    winning_votes,
    runner_up_candidate,
    runner_up_votes,
    ((winning_votes - runner_up_votes) / winning_votes * 100) AS percentage_difference
FROM WinnersAndRunnersUp
WHERE runner_up_votes IS NOT NULL;


