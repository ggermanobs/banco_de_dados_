drop database if exists estoque;
create database estoque;

use estoque;

drop table if exists usuarios;
drop table if exists cargos;
drop table if exists empresas;
drop table if exists produtos;
drop table if exists clientes;
drop table if exists clientes_produtos;
drop table if exists usuarios_produtos;

create table cargos (
    id_cargo integer not null primary key auto_increment,
    cargo varchar(255)
);

desc cargos;

create table usuarios (
    id_usuario integer not null primary key auto_increment,
    nome_usuario varchar(255),
    endereco_usuario varchar(255),
    id_cargo integer,
    foreign key (id_cargo) references cargos (id_cargo)
);

desc usuarios;

create table empresas (
    id_empresa integer not null primary key auto_increment,
    nome_empresa varchar(255)
);

desc empresas;

create table produtos (
    id_produto integer not null primary key auto_increment,
    nome_produto varchar(255),
    preco_compra float,
    preco_venda float,
    quantidade integer,
    id_empresa integer,
    foreign key (id_empresa) references empresas (id_empresa)
);

desc produtos;

create table clientes (
    id_cliente integer not null primary key auto_increment,
    nome_cliente varchar(255),
    cpf_cnpj_cliente varchar(255),
    endereco_cliente varchar(255)
);

desc clientes;

create table clientes_produtos (
    id_cliente integer,
    id_produto integer,
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_produto) references produtos (id_produto)
);

desc clientes_produtos;

create table usuarios_produtos (
    id_usuario integer,
    id_produto integer,
    foreign key (id_usuario) references usuarios (id_usuario),
    foreign key (id_produto) references produtos (id_produto)
);

desc usuarios_produtos;

insert into cargos (cargo) values
('Vendedor'),
('Secretario'),
('Gerente'),
('Diretor');


select * from cargos;

insert into usuarios (nome_usuario, endereco_usuario, id_cargo) values
('Karlinhos dos Santos','Rua dos Ipes',1),
('Eduarda Kzula','Rua dos Alfineiros',1),
('Joao Almeida','Rua Abacaxi',2),
('Tiago Lifer','Rua Batel',3),
('Aldemir Germano','Rua Copo Sujo',4);



select * from usuarios;

insert into empresas (nome_empresa) values
('Lockheed Martin'),
('FN Herstal'),
('Taurus'),
('Sig Sauer');



select * from empresas;

insert into produtos (nome_produto, preco_compra, preco_venda, quantidade, id_empresa) values
('F-22',190000000,234000000,2,1),
('FN-15',2000,3400,322,2),
('FN-SCAR 20S',3900,5100,171,2),
('G3C',3200,5500,824,3),
('P-375',4800,7800,1566,4),
('SIG MPX K',6200,10500,935,4);



select * from produtos;

insert into clientes (nome_cliente, cpf_cnpj_cliente, endereco_cliente) values
('Emerson Almeida','09889777734','Rua Professora Carla'),
('Raphael Pinto','65433389711','Rua Professora Carla'),
('Maria Clara','78512111100','Rua Professora Carla'),
('Forca Aerea Brasileira','99999999900','Av.Erasto Gaetner 1000');


select * from clientes;

insert into clientes_produtos (id_cliente, id_produto) values
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Emerson Almeida'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'G3C')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Raphael Pinto'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'P-375')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Maria Clara'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'SIG MPX K')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Forca Aerea Brasileira'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'F-22')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Forca Aerea Brasileira'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'FN-15')         
    );

select * from clientes_produtos;

insert into usuarios_produtos (id_usuario, id_produto) values
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Karlinhos dos Santos'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'SIG MPX K')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Eduarda Kzula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'FN-15')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Eduarda Kzula'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'FN-SCAR 20S')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Tiago Lifer'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'G3C')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Tiago Lifer'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'P-375')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Aldemir Germano'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'F-22')         
    );

select * from usuarios_produtos;

SELECT
    "EXERCICIO 1" AS MESSAGE_LOG;

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
LIMIT
    3;

SELECT
    "EXERCICIO 2" AS MESSAGE_LOG;

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
ORDER BY
    produtos.quantidade desc;

SELECT
    "EXERCICIO 3" AS MESSAGE_LOG;

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
INNER JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
INNER JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
INNER JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;

SELECT
    "EXERCICIO 4" AS MESSAGE_LOG;

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
LEFT JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
LEFT JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
LEFT JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;
