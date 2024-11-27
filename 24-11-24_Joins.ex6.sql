create database joins_p2_ex6;
use joins_p2_ex6;

create table modelo(
codMod int,
Nome varchar(10),
Marca varchar(10),
primary key (codMod)
);

create table cliente(
NIF int,
Nome Varchar(20),
dtNasc date,
primary key (NIF)
);

create table estacionamento(
Num int,
Piso int,
Capacidade int,
primary key (Num)
);

create table veiculo(
Matricula varchar(8),
Modelo_codMod int,
Cliente_NIF int,
cor varchar(10),
primary key (Matricula),
foreign key (Modelo_codMod) references modelo(codMod),
foreign key (Cliente_NIF) references cliente(NIF)
);

create table estaciona(
cod int,
estacionamento_num int,
veiculo_Matricula varchar(8),
dataEntrada date,
dataSaida date,
horaEntrada Time,
horaSaida time,
primary key (cod),
foreign key (estacionamento_num) references estacionamento(Num),
foreign key (veiculo_Matricula) references veiculo(Matricula)
);

insert into modelo values
(123,'mustang','ford'),
(456,'civic','honda'),
(789,'golf','volkswagen');

insert into cliente values
(234,'Sofia Almeida','1997-02-10'),
(678,'Pedro Rocha','2001-09-15'),
(910,'Catarina Lopes','1995-12-25');

insert into estacionamento values
(101,-1,50),
(202,1,120),
(303,2,75);

insert into veiculo values
('AB12CD34',123,234,'Vermelho'),
('EF56GH78',456,678,'Azul'),
('IJ90KL12',789,910,'Preto');

insert into estaciona values
(48572913,101,'AB12CD34','2024-11-12','2024-11-12','08:30:00','10:15:00'),
(67218354,202,'EF56GH78','2024-11-13','2024-11-14','14:00:00','16:30:00'),
(92356187,303,'IJ90KL12','2024-11-13','2024-11-13','09:45:00','11:00:00');

#exercício 1
select Matricula,Nome from veiculo n join cliente d on n.Cliente_NIF=d.NIF;

#exercício 2 Exiba o nif e o nome do cliente que possui o veiculo com a matricula "21FC41"
select NIF,Nome from cliente n join veiculo d on n.NIF=d.Cliente_NIF where Matricula='EF56GH78';

#exercício 3 exiba a matricula e a cor do veiculo que possui o codico de estacionamento 1
select Matricula,Cor from Veiculo d join estaciona n on d.Matricula=n.veiculo_matricula;