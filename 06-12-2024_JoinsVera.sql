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
select Matricula,Cor from Veiculo d join estaciona n on d.Matricula=n.veiculo_matricula where estacionamento_num=101;

#exercício 4 Exiba a matricula e o ano do veiculo (add column) que posusi o codico de estacionamento 1
alter table veiculo add column ano_lancamento int;

update veiculo set ano_lancamento = 1964 where Matricula = 'AB12CD34';

update veiculo set ano_lancamento = 1972 where Matricula = 'EF56GH78';

update veiculo set ano_lancamento = 1974 where Matricula = 'IJ90KL12';

select matricula,ano_lancamento from veiculo I join estaciona II on I.Matricula=II.veiculo_matricula where estacionamento_num=101;
#exercício 5 exbiba a data de entrada e de saída dos estacionamentos do veiculo matricula (70CD20ZH)

select dataEntrada,dataSaida from estaciona I join veiculo II on I.veiculo_matricula=II.Matricula where Matricula='IJ90KL12';

#exercício 6 Apresente todos os clientes que possuem um carro de Modelo 123 e 789
select nome from cliente I join veiculo II on I.NIF=II.Cliente_NIF where II.Modelo_CodMod in (123,789);

#exercício 7 Apresente a matrícula que contenham a letra 'k' e os horários de entrada e saida dos veículos de cor preto
select Matricula,horaEntrada,horaSaida from veiculo I join estaciona II on I.Matricula=II.veiculo_matricula where Cor='preto' and matricula like '%k%' ;

#exercício 8 exiba o nome do cliente que possui o veiculo cujo codico do estacionamento é 2
select nome from cliente I join veiculo II on I.NIF=II.Cliente_NIF join estaciona III on II.Matricula=III.veiculo_matricula where estacionamento_num=202;

#exercício 9 Exiba o NIF do Cliente que Possui o Veículo cujo códico do estacionamento 3
select Cliente_NIF from veiculo I join estaciona II on I.Matricula=II.veiculo_matricula where estacionamento_num=303;


#exercício 10 Exiba o nome dos donos e a descrição dos modelos de todos os veiculos
select Matricula,Modelo_codMod,Cor,Nome,Marca from veiculo I join modelo II on I.Modelo_codMod=II.codMod;