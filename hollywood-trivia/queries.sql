-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.
-- YOUR QUERY HERE


SELECT movies.title, movies.rating
  FROM movies WHERE rating IS NOT NULL
  ORDER BY movies.rating
  LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

-- YOUR QUERY HERE
SELECT movies.title
  FROM movies WHERE rating IS NULL
  ORDER BY movies.title;


-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

-- YOUR QUERY HERE
SELECT movies.title
  FROM movies WHERE synopsis LIKE '%thrilling%'
  ORDER BY movies.title;

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, movies.rating
  FROM movies
  JOIN genres ON (genres.id = movies.genre_id)
  WHERE year > 1979
  AND year < 1990
  AND name = 'Science Fiction & Fantasy'
  ORDER BY movies.rating DESC;



-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- YOUR QUERY HERE
SELECT actors.name, movies.title, movies.year
  FROM cast_members
  JOIN actors ON (actors.id = cast_members.actor_id)
  JOIN movies ON (movies.id = cast_members.movie_id)
  WHERE character LIKE '%James Bond%'
  ORDER BY movies.year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, genres.name
  FROM cast_members
  JOIN actors ON (actors.id = cast_members.actor_id)
  JOIN movies ON (movies.id = cast_members.movie_id)
  JOIN genres ON (movies.genre_id = genres.id)
  WHERE actors.name LIKE '%Julianne Moore%'
  ORDER BY genres.name, movies.title;


-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, studios.name AS studio
  FROM movies
  JOIN genres ON (movies.genre_id = genres.id)
  JOIN studios ON (studios.id = movies.studio_id)
  WHERE genres.name LIKE '%Horror%'
  ORDER BY movies.year
  limit 5;
