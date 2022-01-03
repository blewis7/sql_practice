DROP DATABASE IF EXISTS  craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    user_password TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES region
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    post_text TEXT,
    user_id INTEGER REFERENCES users,
    post_location TEXT,
    region_id INTEGER REFERENCES region,
    category_id INTEGER REFERENCES categories
);
