create database joins;
use joins;

create table filmes(
id_filme bigint,
nome varchar(100),
categoria varchar(30),
primary key (id_filme)
);

create table atores(
id_ator bigint,
nome varchar(100),
idade int,
id_filme bigint,
primary key (id_ator),
foreign key atores(id_filme) references filmes(id_filme)
);

insert into filmes values
(1,'WYOMING STORM','Sport'),
(2,'Sla manokk','sport'),
(3,'POde ser','drama');

insert into atores values
(1,'emauel',65,1),
(2,'joao',30,1),
(3,'serpa',14,1),
(4,'jeyzi',21,2),
(5,'celso',33,2),
(6,'martim',23,3);
#Exercício 1
select nome from filmes where categoria = 'sport' order by ascii(nome);

#Exercício 2-seleciomar o primeiro e ultimo nome dos atores que participaram no filme wyorm srotp alfabeticamente pelo primeiro e ultimo
select nome from atores where id_filme = 1 order by ascii(nome);

select nome from atores where id_filme = 3;