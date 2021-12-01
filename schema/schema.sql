CREATE DATABASE IF NOT EXISTS wello;

USE wello;

DROP TABLE IF EXISTS emotion_note;
DROP TABLE IF EXISTS stress_note;
DROP TABLE IF EXISTS daily_note;
DROP TABLE IF EXISTS user_template;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS inspirational_source;
DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS citation;
DROP TABLE IF EXISTS podcast;


CREATE TABLE emotion_note (
    id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emotion VARCHAR(30) NOT NULL DEFAULT '',
    time DATE,
    triggers VARCHAR(30) NOT NULL DEFAULT '',
    time_range INT,
    effect INT
);

CREATE TABLE stress_note (
    id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emotion VARCHAR(30) NOT NULL DEFAULT '',
    time DATE,
    triggers VARCHAR(30) NOT NULL DEFAULT '',
    time_range INT,
    effect INT
);

CREATE TABLE daily_note (
    id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emotion VARCHAR(30) NOT NULL DEFAULT '',
    time DATE,
    triggers VARCHAR(30) NOT NULL DEFAULT '',
    time_range INT,
    effect INT
);

CREATE TABLE user (
    uuid varchar(64) NOT NULL
    username varchar(64) NOT NULL,
    password varchar(64) NOT NULL,
    age INT UNSIGNED,
    PRIMARY KEY (username, password)
);

CREATE TABLE admin AS (SELECT * FROM user);
ALTER TABLE admin ADD (
    id INT UNSIGNED NOT NULL AUTO_INCEREMENT,
    test_value INT,
    PRIMARY KEY (id)
);

CREATE TABLE meditation (
    serial_number INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lenght INT UNSIGNED NOT NULL DEFAULT 0,
    emotions_before INT,
    emotions_after INT
);

CREATE TABLE inspirational_source (
    id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE citation AS (SELECT * FROM inspirational_source);
ALTER TABLE citation ADD (
    text VARCHAR(255),
    author VARCHAR(255)
);

CREATE TABLE article AS (SELECT * FROM inspirational_source);
ALTER TABLE article ADD (
    name VARCHAR(255),
    author VARCHAR(255),
    text VARCHAR(255)
);

CREATE TABLE podcast AS (SELECT * FROM inspirational_source);
ALTER TABLE podcast ADD (
    name VARCHAR(255),
    author VARCHAR(255),
    theme VARCHAR(255)
);
