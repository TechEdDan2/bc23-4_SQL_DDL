-- Part 01: Schema Design - (Fake) Craigslist

-- Only use this if we are testing... you don't want to 
--  delete data in a DB in production
DROP DATABASE IF EXISTS my_craigslist_db;
CREATE DATABASE my_craigslist_db;
\c my_craigslist_db;

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT Null,
    region_id INTEGER REFERENCES regions
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    cat_id INTEGER REFERENCES categories,
    region_id INTEGER REFERENCES regions,
    title TEXT,
    description TEXT,
    location TEXT
);