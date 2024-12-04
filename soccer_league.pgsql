-- Part 01: Schema Design - soccer league

-- Only use this if we are testing... you don't want to 
--  delete data in a DB in production
DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT,
    location TEXT
);

CREATE TABLE refs(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT,
    position TEXT,
    birthday DATE,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES seasons,
    ref_id INTEGER REFERENCES refs,
    game_date DATE,
    location TEXT,
    game_time TIMESTAMP
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    num_goals INTEGER
);

CREATE TABLE standings(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result TEXT
);
