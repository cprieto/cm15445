-- Worked in the same movie as Kidman
WITH colleagues AS (
    SELECT DISTINCT person_id
    FROM crew
    WHERE title_id IN (
        -- movies with nicole kidman as actress
        SELECT title_id
        FROM crew WHERE person_id = (
            -- nicole kidman
            SELECT person_id
            FROM people
            WHERE name LIKE '%kidman%'
              AND born = 1967
        ) AND category IN ('actress', 'self')
    ) AND category IN ('actress', 'actor')
)
SELECT p.name
FROM people p
JOIN colleagues c
ON c.person_id = p.person_id
ORDER BY name;