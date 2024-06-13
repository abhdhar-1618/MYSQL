SELECT
SUM(serial_number)
FROM elections;

SELECT * FROM elections;

/*
Find out the percentage differenece between winning candidate votes and runner up candidate votes
*/
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

-- count of parties competing in the 2024 elections
SELECT
party,
COUNT(party) AS Party_Count
FROM elections
GROUP BY party
Order By Party_Count Desc;


-- List all candidates along with their respective parties.

SELECT
candidate,
party
FROM elections;

-- Find the total number of EVM votes cast in the Andhra Pradesh state.

SELECT 
SUM(evm_votes) AS votes
FROM elections
WHERE state = 'Andhra Pradesh';


-- Retrieve the total number of votes (EVM votes + postal votes) for each candidate.(adding features of party, state, constituency)

SELECT
candidate,
party,
state,
parliamentary_constituency,
(evm_votes + postal_votes) AS total_votes
FROM elections
WHERE total_votes IS NOT NULL
ORDER BY total_votes ASC;




SELECT
    candidate,
    party,
    state,
    parliamentary_constituency,
    (evm_votes + postal_votes) AS total_votes
FROM elections
WHERE evm_votes + postal_votes > 0
ORDER BY total_votes ASC;


SELECT 
(evm_votes + postal_votes) AS total_votes
FROM elections
WHERE candidate = 'KAMAL KUMAR VERMA (BHASAUR)';

SELECT
parliamentary_constituency,
candidate,
evm_votes,
postal_votes,
total_votes
FROM elections
WHERE evm_votes IS NULL
OR postal_votes IS NULL
ORDER BY evm_votes ASC;


UPDATE elections
SET 
evm_votes = COALESCE(evm_votes, 0),
postal_votes = COALESCE(postal_votes, 0),
total_votes = COALESCE(total_votes, 0);

SELECT * FROM elections;

SELECT
party,
COUNT(candidate) AS Contenders 
FROM elections
WHERE party = 'Bharatiya Janata Party'
GROUP BY party;


-- contesting candidates and winning candidates

-- Create a CTE to find the winning candidate in each parliamentary constituency
WITH Winners AS (
    SELECT
        parliamentary_constituency,
        candidate,
        party,
        RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS ranked 
    FROM elections
)
-- Aggregate the number of contestants and winning contestants per party
SELECT
    e.party,
    COUNT(DISTINCT e.candidate) AS contestants,
    COUNT(DISTINCT w.candidate) AS winning_contestants
FROM elections e
LEFT JOIN Winners w
ON e.candidate = w.candidate AND w.ranked = 1
GROUP BY e.party;

-- Count the Total Number of Candidates from Each Party

SELECT
party,
COUNT(*) AS contestants
FROM elections
GROUP BY party;

/*
Find out the percentage differenece between winning candidate votes and runner up candidate votes
*/

WITH ranked_candidates AS (
    SELECT parliamentary_constituency, candidate, total_votes,
           RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS ranks
    FROM elections
),
winners AS (
    SELECT parliamentary_constituency, candidate AS winning_candidate, total_votes AS winning_votes
    FROM ranked_candidates
    WHERE ranks = 1
),
runners_up AS (
    SELECT parliamentary_constituency, candidate AS runner_up_candidate, total_votes AS runner_up_votes
    FROM ranked_candidates
    WHERE ranks = 2
)
SELECT w.parliamentary_constituency, w.winning_candidate, r.runner_up_candidate,
       ((w.winning_votes - r.runner_up_votes) * 100.0 / w.winning_votes) AS percentage_difference
FROM winners w
JOIN runners_up r ON w.parliamentary_constituency = r.parliamentary_constituency;


-- How do you rank candidates within each constituency based on their total votes?

SELECT parliamentary_constituency, candidate, total_votes,
       RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS ranked
FROM elections;


-- How do you select only the winning candidate from each constituency?

WITH ranked_candidates AS (
    SELECT parliamentary_constituency, candidate, total_votes,
           RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS rank_position
    FROM elections
)
SELECT parliamentary_constituency, candidate AS winning_candidate, total_votes AS winning_votes
FROM ranked_candidates
WHERE rank_position = 1;

-- Rank the candidates based on their total votes within each constituency, including ties.

SELECT parliamentary_constituency, candidate, total_votes,
RANK() OVER (PARTITION BY parliamentary_constituency ORDER BY total_votes DESC) AS rank_position
FROM elections;

-- table check table

SELECT *
FROM elections
LIMIT 3;










 















