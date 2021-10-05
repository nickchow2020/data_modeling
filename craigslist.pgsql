DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    preferred_region INTEGER REFERENCES regions
)

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    catogry TEXT UNIQUE NOT NULL
)

CREATE table locations (
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL
)

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    title TEXT NOT NULl,
    context TEXT NOT NULL,
    region INTEGER REFERENCES regions ON DELETE CASCADE,
    location INTEGER REFERENCES locations ON DELETE CASCADE,
    category INTEGER REFERENCES categories ON DELETE CASCADE
)

