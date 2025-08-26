SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN NAME END) AS Actor
    FROM(
        SELECT 
    Name,
    Occupation,
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
FROM OCCUPATIONS
    ) AS ranked
GROUP BY rn
ORDER BY rn;