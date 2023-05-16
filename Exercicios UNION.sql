-- Exercícios
-- UNION - INTERSECT - MINUS

/* 1) Listar os títulos dos livros que cujo assunto é “Banco de Dados” ou
que foram lançados por editoras que contenham “a” no nome
Usar union, minus ou intersect */

select l.titulo 
FROM livros l
INNER JOIN livros_assuntos la ON la.idlivro = l.id
INNER JOIN assuntos a ON a.codigo = la.codassunto
where a.NOME = 'Banco de dados'
union
select l.titulo from livros l inner join editoras e
on l.ideditora = e.id
where l.titulo like '%a%';

/* 2) Selecione idlivro e titulo de todos os livros que não foram
emprestados
Usar union, minus ou intersect */
select id, titulo from livros 
minus 
select e.idlivro, l.titulo from emprestimos e
inner join livros l on l.id = e.idlivro;

/* 3) Quais livros já foram emprestados? Mostrar id do livro
Usar union, minus ou intersect */

SELECT  id,titulo FROM livros l
INNER JOIN emprestimos em ON em.idlivro = l.id
UNION
SELECT l.id, l.titulo FROM livros l
INNER JOIN emprestimos em ON em.idlivro = l.id;

/* 4) Listar o codigo do produto, nome do produto, valor unitário original
e o valor unitário aumentado em 10%.
a) Criar a tabela Produto (CodProd int, Descrição varchar2(30), vrunitario
number(8,2).
b) Inserir os produtos arroz, leite, óleo, caneta conforme descrição abaixo.
c) Desenvolver o select (usando union) que resulte nos dados abaixo: */

CREATE TABLE produtos
(
codprod number(10,0),
descricao varchar2(30),
vrunitario number(8,2),
constraint pk_produto primary key(codprod)
);

insert into produtos values (1, 'arroz', 12.00);
insert into produtos values (2, 'leite', 6.00);
insert into produtos values (3, 'oleo', 5.00);
insert into produtos values (4, 'caneta', 2.00);

select * from produtos;

/*Listar o codigo do produto, nome do produto, valor unitário original
e o valor unitário aumentado em 10%.*/

SELECT codprod, descricao, vrunitario FROM produtos
UNION
SELECT codprod, descricao, (((10/100)* Vrunitario)+ Vrunitario)VrunitarioA 
from produtos;

