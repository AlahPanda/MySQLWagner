create database dbPortugal;
use dbPortugal;

create table cidades
(
CodigoPostal int primary key,
Nome varchar(100) not null, 
populacao bigint not null,
DiaDeFundacao date not null
);