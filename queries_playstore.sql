-- Comments in SQL Start with dash-dash --
--1: Web Browser For Android--
SELECT app_name FROM analytics WHERE id = 1880;

--2--
SELECT id, app_name FROM analytics WHERE last_updated = 'August 01, 2018';

--3--
SELECT category, COUNT(*) FROM analytics GROUP BY category;

--4--
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

--5--
SELECT app_name FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

--6--
SELECT category, AVG(rating) FROM analytics GROUP BY category ORDER BY AVG(rating) DESC;

--7--
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

--8--
SELECT app_name, rating FROM analytics WHERE min_installs <= 50 AND rating > 0 ORDER BY rating DESC;

--9--
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

--10--
SELECT app_name, reviews FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

--11--
--subquery method--
SELECT app_name, last_updated FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

--12--
SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

--13--
SELECT SUM(reviews) FROM analytics;

--14--
SELECT category, COUNT(*) FROM analytics GROUP BY category HAVING COUNT(*) > 300;

--15--
SELECT app_name, reviews, min_installs, (min_installs/reviews) AS proportion FROM analytics 
    WHERE min_installs >= 100000 
    AND (min_installs/reviews) = (SELECT MAX(min_installs/reviews) FROM analytics);

--FS1--
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;

--FS2--
SELECT * FROM analytics WHERE app_name ILIKE '%facebook%';

--FS3--
SELECT * FROM analytics WHERE array_length(genres, 1) = 2;

--FS4--
SELECT * FROM analytics WHERE genres @> '{"Education"}';
