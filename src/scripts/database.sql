CREATE DATABASE homeobras;
USE homeobras;

CREATE TABLE users
(
  id INT NOT NULL AUTO_INCREMENT,
  type INT,
  name VARCHAR(120),
  login VARCHAR(120),
  password VARCHAR(120),
  PRIMARY KEY (id)
);

