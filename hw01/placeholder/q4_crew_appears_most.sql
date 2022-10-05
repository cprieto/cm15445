WITH appearances AS (
    SELECT person_id, COUNT(1) AS num_appearances
    FROM crew
    GROUP BY person_id
    ORDER BY num_appearances DESC
    LIMIT 20
)
SELECT name, num_appearances
FROM people p
JOIN appearances a
ON a.person_id = p.person_id;