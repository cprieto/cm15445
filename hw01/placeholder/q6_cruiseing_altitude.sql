SELECT t.original_title AS title, r.votes
FROM titles t
JOIN crew c ON t.title_id = c.title_id
JOIN people p ON c.person_id = p.person_id
JOIN ratings r ON c.title_id = r.title_id
WHERE p.name LIKE '%cruise%' AND p.born = 1962
ORDER BY r.votes DESC
LIMIT 10;