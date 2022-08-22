CREATE DATABASE IF NOT EXISTS trabalhoBd CHARACTER SET utf8mb4;

USE trabalhoBd;

DROP TABLE IF EXISTS trabalhoBd;

CREATE TABLE IF NOT EXISTS pet (
    id_pet INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,raca VARCHAR(255) NOT NULL,
    created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);

/* 1 Faça registro de 10 cachorros e de 10 gatos */

INSERT INTO
    pet(nome,raca)
VALUES
    ('Garfild','Gato'),
    ('Felipao','Gato'),
    ('Benny','Gato'),
    ('Bobby','Cachorro'),
    ('Bonny','Cachorro'),
    ('Soraia','Gato'),
    ('Joaquin','Gato'),
    ('Sheik','Cachorro'),
    ('Paulo','Gato'),
    ('Bernadete','Cachorro'),
    ('Juka','Cachorro'),
    ('Dila','Gato'),
    ('Rodolfo','Gato'),
    ('Nasus','Cachorro'),
    ('Thor','Gato'),
    ('Juca Moreno','Cachorro'),
    ('Garfild','Gato'),
    ('Luna','Cachorro'),
    ('Sage','Cachorro'),
    ('Zeri','Gato'),
    ('Reginaldo','Cachorro');

/* 2 Faça um select geral */

SELECT * FROM pet;

/* 3 Faça um select ordenado pela 
data de criação do registro (created_at) 
de forma que seja decrescente */

SELECT * FROM pet ORDER BY created_at DESC;

/* 4 Faça o mesmo select da 3,
contudo limitando em 3 registros*/

SELECT * FROM pet ORDER BY created_at DESC LIMIT 3;