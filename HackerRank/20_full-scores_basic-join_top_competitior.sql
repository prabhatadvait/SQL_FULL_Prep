-- output:- 
--     hacker_id,name,total number of challenges by each student

-- order by:-
--     total number of challenges desc,
--     hacker_id

-- if more than one student with same number 
--     then
--         count is less than maximum no of challenges
--             then
--                 Exclude student

SELECT h.hacker_id, h.name
FROM Hackers h
JOIN (
    SELECT s.hacker_id
    FROM Submissions s
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id
    HAVING COUNT(DISTINCT s.challenge_id) > 1
) AS top_hackers
ON h.hacker_id = top_hackers.hacker_id
ORDER BY (
    SELECT COUNT(DISTINCT s.challenge_id)
    FROM Submissions s
    JOIN Challenges c ON s.challenge_id = c.challenge_id
    JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
    WHERE s.hacker_id = h.hacker_id AND s.score = d.score
) DESC, h.hacker_id ASC;
