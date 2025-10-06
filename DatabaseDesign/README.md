# Group - Database Design
## Models
- **1 - Conceptual Model**

```markdown
# Entities
Our conceptual model has 3 entities:
- Users: The consumer of the app. This entity holds information about the user's username, birth date, name, and reviews.
- Movies: The main entity that users interact with either by watching or reviewing. This entity holds information such as
movie ID, title, release date, and director
- Reviews: This is the entity that holds the data about reviews such as the review ID, movie, date, rating, and content of the
review. This entity connects users and movies.

# Relationships
There are three main interactions that are between users and movies, users and reviews, and reviews and movies.
- There is a many-to-many relationship between users and the movies they have watched. Many users
can watch many movies. Many movies have also been watched by many users.
- A user can write many reviews but reviews are tied to only one user.
- For the relationship between reviews and movies, one movie can have many reviews but one review
can only be tied to a single movie.

# Main Actions
1. User can watch many movies
2. User writes many reviews, but each review is tied to a unique movie.
3. Reviews populate the movie's review tab
```

![Conceptual Model](./Models/ConceptualModel.png)
- - -

- **2 - Logical Model**

```Our logical model has four tables. The extra table, watchedMovie, comes from the watched relation from the conceptual model. The purpose of the table is to resolve the many to many relationship between user and movie by introducing a composite key. The composite key ensures that a user can only have one instance of a movie as watched. The user table has a username as the primary key, movieId for movie, and username and movieId for review. The watchedMovie table has a composite key of username and movieId which are foreign keys from user and movie tables respectively. This effectively connects the user and movie tables. Finally, the review table has username and movieId as foreign keys to link both user and movie tables to review.```

![Logical Model](./Models/LogicalModel.png)
- - -

- **3 - Physical Model**

```markdown
# 
```

![Physical Model](./Models/PhysicalModel.png)
- - -

## Table Initialization

```Initializaiton Scripts includes all tables required for the Database.```

[Initialization Scripts](./InitializationScripts/init_collectiviews.sql)

[Docker Compose File](./docker-compose.yml)

```INSERT INITIALIZATION INSTRUCTIONS FOR DOCKER/DBEAVER FOLLOWING ASSIGNMENT RULES```

## Business Related SQL Queries

```SQL Queries file contains descriptions of each query.```

[SQL Queries](./BusinessSqlQueries/Business_Queries.md)
