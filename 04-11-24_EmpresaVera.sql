Create database Empresa;
Use Empresa;

create table Funcionarios(
id_funcionarios bigint primary key,
nome varchar(70),
morada varchar(100),
contato bigint
);
create table Clientes(
id_clientes bigint primary key,
nome varchar(70),
morada varchar (100),
contato bigint,
id_funcionarios int,
foreign key (id_clientes) references Funcionarios(id_funcionarios)
);

insert into Funcionarios values
(1,'Gabriel Wagner','Figueira',6491538271),
(2,'Joao souza','Braga',147392738),
(3,'Emaunel lazaro','Porto',179420640),
(4,'Daniel Henriques','Lisboa',846317485);

insert into Clientes Values
(1,'Gabriel Serpa','Pico',537281953,1),
(2,'Antonio Pinto','Porto',839164638,2),
(3,'Isaura Leal','China',274948186,2),
(4,'Sergio tatarashuk','Coimbra',186026489,4);

Select * from Funcionarios cross join Clientes;