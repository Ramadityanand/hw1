-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.

DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS crew;

-- Create new tables, according to the domain model

CREATE TABLE movie (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  MPAA_rating TEXT,
  director_id INTEGER
);

CREATE TABLE people (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  character_name TEXT
);

CREATE TABLE crew (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  people_id INTEGER,
  character_id INTEGER
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary

-- Populating movie table with data

INSERT INTO movie (
  title, year, MPAA_rating, director_id
)
VALUES (
  "Batman Begins", 2005, "PG-13", 1
);
INSERT INTO movie (
  title, year, MPAA_rating, director_id
)
VALUES (
  "The Dark Knight", 2008, "PG-13", 1
);
INSERT INTO movie (
  title, year, MPAA_rating, director_id
)
VALUES (
  "The Dark Knight Rises", 2012, "PG-13", 1
);

-- Populating people table with data

INSERT INTO people (
  name
)
VALUES (
  "Christopher Nolan"
);
INSERT INTO people (
  name
)
VALUES (
  "Christian Bale"
);
INSERT INTO people (
  name
)
VALUES (
  "Michael Caine"
);
INSERT INTO people (
  name
)
VALUES (
  "Liam Neeson"
);
INSERT INTO people (
  name
)
VALUES (
  "Katie Holmes"
);
INSERT INTO people (
  name
)
VALUES (
  "Gary Oldman"
);
INSERT INTO people (
  name
)
VALUES (
  "Heath Ledger"
);
INSERT INTO people (
  name
)
VALUES (
  "Aaron Eckhart"
);
INSERT INTO people (
  name
)
VALUES (
  "Maggie Gyllenhaal"
);
INSERT INTO people (
  name
)
VALUES (
  "Tom Hardy"
);
INSERT INTO people (
  name
)
VALUES (
  "Joseph Gordon-Levitt"
);
INSERT INTO people (
  name
)
VALUES (
  "Anne Hathaway"
);

-- Populating Character table with data

INSERT INTO character (
  character_name
)
VALUES (
  "Bruce Wayne"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Alfred"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Ra's Al Ghul"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Rachel Dawes"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Commissioner Gordon"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Joker"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Harvey Dent"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Bane"
);
INSERT INTO character (
  character_name
)
VALUES (
  "John Blake"
);
INSERT INTO character (
  character_name
)
VALUES (
  "Selina Kyle"
);

-- Populating crew table with data - Foriegn ID keys

INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    1,2,1
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    1,3,2
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    1,4,3
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    1,5,4
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    1,6,5
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    2,2,1
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    2,7,6
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    2,8,7
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    2,3,2
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    2,9,4
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    3,2,1
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    3,6,5
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    3,10,8
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    3,11,9
);
INSERT INTO crew (
  movie_id, people_id, character_id
)
VALUES (
    3,12,10
);

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output

.width 25, 5, 5, 30
SELECT movie.title, movie.year, movie.MPAA_rating, people.name
FROM movie INNER JOIN people ON movie.director_id = people.id
GROUP BY movie.title;

-- Prints a header for the crew output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output

.width 25, 25, 25
SELECT movie.title, people.name, character.character_name
FROM crew
INNER JOIN movie ON crew.movie_id = movie.id
INNER JOIN people ON people.id = crew.people_id
INNER JOIN character ON character.id = crew.character_id;
