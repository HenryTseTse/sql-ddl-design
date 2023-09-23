-- from the terminal run:
-- psql < craigslist.sql

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
)

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)


CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    encrypted_password TEXT NOT NULL,
    preferred_region_id INT NOT NULL
)

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE
)