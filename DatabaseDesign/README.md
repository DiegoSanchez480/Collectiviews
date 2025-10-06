# Group - Database Design
## Models
- **1 - Conceptual Model**

```markdown
# Entities
Our conceptual model has 3 entities:
- Users: The consumer of the app. This entity holds information about the User's `username`, `birth date`, `name`, and `reviews`.
- Movies: The main entity that Users interact with either by watching or reviewing. This entity holds information such as
`movie ID`, `title`, `release date`, and `director`
- Reviews: This is the entity that holds the data about Reviews such as the `review ID`, `movie`, `date`, `rating`, and `content` of the
review. This entity connects Users and Movies.

# Relationships
There are three main interactions that are between Users and Movies, Users and Reviews, and Reviews and Movies.
- There is a many-to-many relationship between Users and the Movies they have watched. Many Users
can watch many Movies. Many Movies have also been watched by many Users.
- A User can write many reviews but Reviews are tied to only one User.
- For the relationship between Reviews and Movies, one Movie can have many Reviews but one Review
can only be tied to a single Movie.

# Main Actions
1. User can watch many Movies
2. User writes many Reviews, but each Review is tied to a unique Movie.
3. Reviews populate the Movie's review tab
```

![Conceptual Model](./Models/ConceptualModel.png)
- - -

- **2 - Logical Model**

```Our logical model has four tables. The extra table, watchedMovie, comes from the watched relation from the conceptual model. The purpose of the table is to resolve the many to many relationship between user and movie by introducing a composite key. The composite key ensures that a user can only have one instance of a movie as watched. The user table has a username as the primary key, movieId for movie, and username and movieId for review. The watchedMovie table has a composite key of username and movieId which are foreign keys from user and movie tables respectively. This effectively connects the user and movie tables. Finally, the review table has username and movieId as foreign keys to link both user and movie tables to review.```

![Logical Model](./Models/LogicalModel.png)
- - -

- **3 - Physical Model**

```markdown
# Entities
- Movie
  - Primary Key: `movieID`
  - Attributes: `title`, `director`, `genre`, `releaseDate`
  - Represents individual films in the database.

- User
  - Primary Key: `username`
  - Attributes: `name`, `password_hash`, `birthYear`
  - Represents registered users who can review and track movies.

- Review
  - Composite Primary Key: (`username`, `movieID`)
  - Foreign Keys: 
    - `username` → `user(username)`  
    - `movieID` → `movie(movieID)`
  - Attributes: `rating`, `writtenReview`, `reviewDate`
  - Connects users and movies through ratings and written feedback.

- WatchedMovie
  - Composite Primary Key: (`username`, `movieID`)
  - Foreign Keys:  
    - `username` → `user(username)`  
    - `movieID` → `movie(movieID)`
  - Attribute: `watchedDate`
  - Tracks which movies each user has watched and when.

# Relationships
- A User can write multiple Reviews, but only one per Movie (1:Many from User → Review, Many:1 from Review → Movie).  
- A User can watch multiple Movies, each stored in WatchedMovie (Many:many so made WatchedMovie table).  
- Movie and User are connected through both Review and WatchedMovie tables.

# Main User Actions
- Register and log in as a user.  
- Browse or search for movies.  
- Record movies they’ve watched.  
- Write, edit, or view reviews and ratings for movies. 
```

![Physical Model](./Models/PhysicalModel.png)

Physical Model Source Code
[Physical Model Source Code](./PhysicalModelSourceCode.dbml)
- - -

## Table Initialization

```Initialization Scripts includes all tables required for the Database.```

[Initialization Scripts](./InitializationScripts/init_collectiviews.sql)

[Docker Compose File](./docker-compose.yml)

### How to use a Docker compose file to create a database in MariaDB
1. Create or recieve a docker-compose.yml file to act as a blueprint for the Docker container you wish to set up
2. Place the docker-compose.yml file in a directory with an SQL init file
3. Navigate to the directory in your computer's terminal
4. Run the command `docker compose up` to build the container
5. In DBeaver, navigate to the top left of the screen and click the "New Database Connection" button to open the new connection menu
6. Select the database driver you wish to use (this should be specified in the docker-compose.yml file) and click next
7. Under the "Server" menu, ensure that the port listed matches the one mapped in the compose file
8. Under the "Authentication" menu, enter the username and password displayed in the compose file
9. Click "Finish" and DBeaver will connect to the container and you should be able to interact with the database


## Business Related SQL Queries

```SQL Queries file contains descriptions of each query.```

[SQL Queries](./BusinessSqlQueries/Business_Queries.md)
