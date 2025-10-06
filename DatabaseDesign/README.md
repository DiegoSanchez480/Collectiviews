# Group - Database Design
## Models
- **1 - Conceptual Model**

```Notes/Description```

![Conceptual Model](./Models/ConceptualModel.png)
- - -

- **2 - Logical Model**

```Our logical model has four tables. The extra table, watchedMovie, comes from the watched relation from the conceptual model. The purpose of the table is to resolve the many to many relationship between user and movie by introducing a composite key. The composite key ensures that a user can only have one instance of a movie as watched. The user table has a username as the primary key, movieId for movie, and reviewId for reviews. The watchedMovie table has a composite key of username and movieId which are foreign keys from user and movie tables respectively. This effectively connects the user and movie tables. Finally, the review table has username and movieId as foreign keys to link both user and movie tables to review.```

![Logical Model](./Models/LogicalModel.png)
- - -

- **3 - Physical Model**

```Notes/Description```

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
