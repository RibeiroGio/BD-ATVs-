-- Giovanna Dias Ribeiro, Renan Queiroz de Souza;
--1) Selecionar os empréstimos que foram devolvidos com atraso. Exibir idlivro,título, nome do sócio, data de retirada, data de devolução real e multa.

SELECT l.id, l.titulo, s.nome, e.dtretirada, e.dtdevprev, e.vrmulta 
FROM livros l
INNER JOIN emprestimos e ON e.idlivro = l.id
INNER JOIN socios s ON s.codigo = e.codsocio
WHERE e.vrmulta >0;

--2) Selecione os sócios que não moram em Sorocaba juntamente com os sócios que tenham Silva no nome.

select codigo, nome, cidade 
from socios 
where nome like '%Silva%' and cidade <> 'Sorocaba';

--3) Suponha que um livro possa ser cadastrado sem editora. Desenvolva um select que mostre todos os livros da base de dados, mesmo os que
--possam ser cadastrados sem editora. Exibir título do livro e nome da editora.
select * from emprestimos;

SELECT l.titulo, e.nome
FROM livros l
INNER JOIN editoras e ON e.id = l.ideditora;

--4) Exibir quantos livros cada sócio emprestou em determinada data. Mostrar nome do sócio, data e quantidade de livros.

select l.titulo, s.nome, e.dtretirada from socios s 
inner join emprestimos e on e.codsocio = s.codigo
inner join livros l on l.id = e.idlivro;


--5) Selecione todos os livros cujo dias de prazo de entrega 
--seja maior que o menor dias prazo registrado nos livros. 
--(usar sub-select).

select id, titulo, diasprazo
from livros l
where diasprazo in(select dtdevprev from emprestimos e where dtdevprev > diasprazo);
