CREATE DATABASE IF NOT EXISTS aprenderjoin CHARACTER SET utf8mb4;

USE aprenderjoin;

DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS estado;

CREATE TABLE IF NOT EXISTS estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM('sul','sudeste','centro-oeste','nordeste','norte')

);

CREATE TABLE IF NOT EXISTS cidade (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);


INSERT INTO 
    estado(nome,regiao)
values
    ('Parana','sul'),
    ('Sao Paulo','sudeste'),
    ('Rio de Janeiro','sudeste'),
    ('Bahia','nordeste'),
    ('Pernambuco','nordeste'),
    ('Para','norte'),
    ('Mato Grosso','centro-oeste');

    SET @idParana:=(SELECT id_estado FROM estado WHERE estado.nome = "Parana");
    SET @idSaoPaulo:=(SELECT id_estado FROM estado WHERE estado.nome = "Sao Paulo");
    SET @idRioDeJaneiro:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio de Janeiro");
    SET @idBahia:=(SELECT id_estado FROM estado WHERE estado.nome = "Bahia");
    SET @idPernambuco:=(SELECT id_estado FROM estado WHERE estado.nome = "Pernambuco");
    SET @idParan:=(SELECT id_estado FROM estado WHERE estado.nome = "Para");
    SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");
   
   
   
   
   
   
   
   
   
   
    