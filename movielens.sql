USE movielens;

-- Question 1
SELECT title, release_date FROM movies WHERE release_date BETWEEN "1983-01-01" AND "1993-12-31";

-- Question 2
SELECT m.title, AVG(r.rating) FROM movies m
 INNER JOIN ratings r ON m.id = r.movie_id
GROUP BY m.title ORDER BY AVG(r.rating);

-- Question 3