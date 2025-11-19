CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hardwares (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    capacity VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS websites (
    id SERIAL PRIMARY KEY,
    hw_id INT REFERENCES hardwares(id),
    code_snippet_id INT REFERENCES code_snippets(id) DEFAULT NULL,
    url VARCHAR(255),
    description TEXT,
    year INT NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS social_media_posts (
    id SERIAL PRIMARY KEY,
    hw_id INT REFERENCES hardwares(id),
    platform VARCHAR(50) NOT NULL,
    description TEXT,
    reaction_count INT DEFAULT 0
);
CREATE TABLE IF NOT EXISTS code_snippets (
    id SERIAL PRIMARY KEY,
    hw_id INT REFERENCES hardwares(id),
    language VARCHAR(50) NOT NULL,
    code TEXT NOT NULL,
    description TEXT,
    year INT NOT NULL,
    is_part_of_website BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS photos (
    id SERIAL PRIMARY KEY,
    hw_id INT REFERENCES hardwares(id),
    resolution VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    format VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS videos (
    id SERIAL PRIMARY KEY,
    hw_id INT REFERENCES hardwares(id),
    resolution VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    format VARCHAR(20) NOT NULL,
    duration INT NOT NULL
);


