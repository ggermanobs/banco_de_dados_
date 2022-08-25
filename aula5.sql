CREATE DATABASE IF NOT EXISTS aprenderjoin CHARACTER SET utf8mb4;

USE aprenderjoin;

DROP TABLE IF EXISTS restaurantes;
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
    SET @idPara:=(SELECT id_estado FROM estado WHERE estado.nome = "Para");
    SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");

INSERT INTO cidade (nome, id_estado) VALUES
    ('Curitiba',@idParana),
    ('Londrina',@idParana),
    ('Paranagua',@idParana),
    ('Sao Paulo',@idSaoPaulo),
    ('Sorocaba',@idSaoPaulo),
    ('Rio de Janeiro',@idRioDeJaneiro),
    ('Niteroi',@idRioDeJaneiro),
    ('Mage',@idRioDeJaneiro),
    ('Porto Real',@idRioDeJaneiro),
    ('Petropolis',@idRioDeJaneiro),
    ('Salvador',@idBahia),
    ('Feira de Santana',@idBahia),
    ('Recife',@idPernambuco),
    ('Olinda',@idPernambuco),
    ('Petrolina',@idPernambuco),
    ('Belem',@idPara),
    ('Cuiaba',@idMatoGrosso);

SELECT * FROM cidade;

SELECT 
    * 
FROM 
    cidade
INNER JOIN
    estado on cidade.id_estado = estado.id_estado
where
    cidade.nome = 'Petropolis';

CREATE TABLE restaurantes (
    id_restaurante INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    id_cidade INTEGER NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

SET @idCuritibaCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Curitiba');
SET @idSaoPauloCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Sao Paulo');
SET @idRiodeJaneiroCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Rio de Janeiro');
SET @idPetropolesCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Petropolis');
SET @idFeiraDeSantanaCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Feira de Santana');

select @idFeiraDeSantanaCidade as 'cidade';

INSERT INTO restaurantes (nome,descricao,id_cidade) VALUES
    ('Comida Mineira', 'Comida tipica de Minas',@idCuritibaCidade),
    ('Fogo de chao','Costela de fogo de chao',@idSaoPauloCidade),
    ('Frangao','frango',@idRiodeJaneiroCidade),
    ('Pizza Maromba','pizza com muita proteina',@idPetropolesCidade),
    ('Pertuti','Restaurante',@idFeiraDeSantanaCidade);

select * from restaurantes;

select 
    *
from
    cidade
inner JOIN
    restaurantes on cidade.id_cidade = restaurantes.id_cidade
where
    restaurantes.nome = 'Pizza Maromba';

select 
    *
from
    restaurantes
inner JOIN
    cidade on restaurantes.id_cidade = cidade.id_cidade
where
    restaurantes.nome = 'Comida Mineira';


select 
    cidade.nome            as nome_da_cidade,
    restaurantes.nome      as nome_do_restaurantes,
    restaurantes.descricao as descricao_do_restaurante
from
    cidade
inner JOIN
    restaurantes on restaurantes.id_cidade = cidade.id_cidade
where
    restaurantes.nome = 'Comida Mineira';

select 
    cidade.nome            as nome_da_cidade,
    restaurantes.nome      as nome_do_restaurantes,
    restaurantes.descricao as descricao_do_restaurante
from
    cidade
inner JOIN
    restaurantes on restaurantes.id_cidade = cidade.id_cidade
where
    restaurantes.nome LIKE '%M%';    


select 
    t1.nome_da_cidade,
    t1.nome_do_restaurantes
from
(
    select 
        cidade.nome            as nome_da_cidade,
        restaurantes.nome      as nome_do_restaurantes,
        restaurantes.descricao as descricao_do_restaurante
    from
        cidade
    inner JOIN
        restaurantes on restaurantes.id_cidade = cidade.id_cidade
    where
        restaurantes.nome LIKE '%M%'
) as t1

where 
    t1.nome_da_cidade = 'Curitiba';


select 'com mais de um INNER JOIN --------------------------' as 'INFO';


select 
    cidade.nome as nome_da_cidade,
    estado.nome as nome_do_estado,
    restaurantes.nome as nome_do_restaurantes
from
    restaurantes
INNER JOIN
    cidade
        on restaurantes.id_cidade = cidade.id_cidade
INNER JOIN
    estado
        on cidade.id_estado = estado.id_estado
where
    restaurantes.nome LIKE 'Comida M%';    




  




   
   
   
   
   
   
   
   
   
   
    