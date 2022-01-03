DROP DATABASE IF EXISTS  league;

CREATE DATABASE league;

\c league

CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY,
    title TEXT
);

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    starting_date DATE,
    ending_date DATE
);

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY,
    player_name TEXT,
    player_weight INTEGER,
    player_height FLOAT(1),
    birthdate DATE,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches 
(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES season,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    match_date DATE,
    match_location TEXT,
    referee_1 INTEGER REFERENCES referees,
    referee_2 INTEGER REFERENCES referees,
    referee_3 INTEGER REFERENCES referees
);

CREATE TABLE goals 
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT NOT NULL
);

