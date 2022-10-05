SELECT name, IFNULL(died, strftime('%Y', 'now')) - born AS age
FROM people
WHERE born >= 1900
ORDER BY age DESC, name
LIMIT 20;