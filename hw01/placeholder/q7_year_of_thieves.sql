SELECT COUNT(DISTINCT(title_id)) AS num
FROM titles
WHERE premiered = (
    SELECT premiered
    FROM titles
    WHERE original_title
    LIKE 'army of thieves'
);