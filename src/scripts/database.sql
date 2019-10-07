CREATE DATABASE homeobras;
USE homeobras;

CREATE TABLE users
(
  id INT NOT NULL AUTO_INCREMENT,
  type INT,
  name VARCHAR(120),
  login VARCHAR(120),
  password VARCHAR(120),
  cpf VARCHAR(20),
  data VARCHAR(20),
  PRIMARY KEY (id)
);

ALTER TABLE users ADD nota VARCHAR(11) DEFAULT ' ';
ALTER TABLE users ADD url TEXT;