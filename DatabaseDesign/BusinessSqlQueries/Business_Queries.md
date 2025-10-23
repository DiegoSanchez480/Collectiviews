# SQL Queries

### 1
```sql
-- returns all movies reviewed by a user, the review content, and when they watched each | This is to be used in a dashboard or home menu for users
select
  m.title,
  wm.watchedDate,
  r.rating,
  r.writtenReview
from
  movie m
inner join watchedMovie wm on m.movieID = wm.movieID
left join review r on (m.movieID = r.movieID and wm.username = r.username)
where wm.username = 'username'
order by
  r.reviewDate desc;
```

### 2
```sql
SELECT 
  u.username,
  m.title,
  r.rating,
  r.reviewDate,
  wm.watchedDate
FROM `user` u
JOIN watchedMovie wm ON u.username = wm.username
JOIN movie m ON wm.movieID = m.movieID
LEFT JOIN review r ON wm.username = r.username AND wm.movieID = r.movieID
ORDER BY r.rating DESC;
```

### 3
```sql
-- return all written reviews left on a specific movie
select
  m.title,
  r.username,
  r.writtenReview
from
  review r
inner join movie m on m.movieID = r.movieID
where m.title = 'title'
order by
  r.username asc;
```

### 4
```sql
-- return all usernames
SELECT username
FROM user;
```

### 5
```sql
-- return all individual numerical ratings of a specific movie
SELECT
  rating
FROM
  review
INNER JOIN
  movie
ON
  review.movieID = movie.movieID
WHERE
  movie.title = 'Fantastic 4';
```

### 6
```sql
-- Find movies from a specific genre
SELECT title, director
FROM movie
WHERE genre = "Horror";
```

### 7
```sql
-- Return the age of a user
SELECT username, name, birthDate,
       TIMESTAMPDIFF(YEAR, birthDate, CURDATE()) AS age
FROM user;
```
