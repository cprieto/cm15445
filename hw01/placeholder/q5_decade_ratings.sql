-- Using a subquery is faster than using a CTE in this case
SELECT decade || 's' AS decade, avg_rating, top_rating, min_rating, num_releases
FROM (
    SELECT (premiered / 10) * 10 as decade,
           round(AVG(rating), 2) AS avg_rating,
           max(rating) AS top_rating,
           min(rating) AS min_rating,
           count(*) AS num_releases
    FROM titles
    JOIN ratings r ON titles.title_id = r.title_id
    WHERE premiered IS NOT NULL
    GROUP BY decade)
ORDER BY avg_rating DESC, decade;