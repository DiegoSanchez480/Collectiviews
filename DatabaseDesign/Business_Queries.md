# SQL Queries

### 1
```sql
-- return all movies watched by a user and when they watched them
select
  m.title,
  wm.watchedDate
from
  movie m
inner join watchedMovie wm on m.movieID = wm.movieID
where wm.username = 'username'
order by
  m.title asc;
```

### 2
```sql
-- return all the ratings for all movies a user has watched in descending order
select
  r.username,
  m.title,
  r.rating
from
  review r
inner join movie m on r.movieID = m.movieID
where r.username = 'username'
order by
  r.rating desc;
```

### 3
```sql
-- return all written reviews left on a specific movie
select
  m.title
  r.username
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
JOIN
  movie
ON
  review.movieID = movie.movieID
WHERE
  movie.title = 'Fantastic 4';
```
