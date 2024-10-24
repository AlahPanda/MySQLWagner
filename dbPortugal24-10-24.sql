create database armazem;
use armazem;
#criação de uma base de dados para armazenar os produtos
create table Produtos(
ID_NF int,
ID_ITEM int,
COD_PROD int, 
VALOR_UNIT decimal(4,2), 
QUANTIDADE int, 
DESCONTO int
);

select * from Produtos;

INSERT INTO Produtos (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO)
VALUES 
(4, 1, 5, 30.00, 10, 15),(4, 2, 4, 10.00, 12, 5),(4, 3, 1, 25.00, 13, 5),(4, 4, 2, 13.50, 15, 5),(5, 1, 3, 15.00, 3, null),(5, 2, 5, 30.00, 6, null),(6, 1, 1, 25.00, 22, 15),(6, 2, 3, 15.00, 25, 20),(7, 1, 1, 25.00, 10, 3),(7, 2, 2, 13.50, 10, 4),(7,3,3,15.00,10,4),(7, 4, 5, 30.00, 10, 1);

drop table Produtos;

select * from Produtos where DESCONTO is null;
