-- Renanzito e Giovannita

--Criacao de tabelas
drop table emprestimos;
drop table autorias;
drop table autores;
drop table livros;
drop table assuntos;
drop table socios;

CREATE TABLE socios
(
    codigo number(10,0), 
    nome varchar2(40) NOT NULL, 
    telefone varchar2(20) NOT NULL,
    lograd varchar2(30) NOT NULL,
    complem varchar2(15),
    bairro varchar2(15),    
    cidade varchar2(20),
    UF varchar2(2), 
    CEP varchar2(8),
   constraint pk_socios primary key(codigo)
);

CREATE TABLE assuntos
(
    codigo Numeric(10,0) PRIMARY KEY,
    nome varchar2(40) UNIQUE NOT NULL
);

CREATE TABLE livros
(
    id varchar2(15),
    titulo varchar2(80) NOT NULL,
    editora varchar2(20) NOT NULL,
    totpag number(8,2) check (totpag >0), 
    diasprazo number(8,2)check (diasprazo >=0), 
    codassunto number(8,2) NOT NULL,
    constraint pk_livro primary key (id),
    constraint fk_livro_assunto foreign key (codassunto) references assuntos(codigo) 
);

CREATE TABLE emprestimos
( 
    idlivro varchar2(15), 
    codsocio number(10,0),  
    dtretirada timestamp NOT NULL, 
    dtdevprev timestamp NOT NULL,
    dtdevreal timestamp,
    vrmulta number(8,2) check(vrmulta >=0),
    constraint pk_emprestimo primary key (idlivro, codsocio, dtretirada),
    constraint fk_emp_socio foreign key (codsocio) references socios(codigo),
    constraint fk_emp_livro foreign key (idlivro) references livros(id)
);

    
CREATE TABLE autores
(
    codigo number(10,0) primary key,
    nome varchar2(40) NOT NULL,
    origem varchar2(20)NOT NULL
);

          
CREATE TABLE autorias
(
    idlivro varchar2(15) ,
    codautor number(10,0),
    constraint fk_autoria_livro foreign key (idlivro) references livros(id),
    constraint fk_autoria_autor foreign key (codautor) references autores(codigo),
    primary key (idlivro, codautor)
);



--inserts
insert into assuntos values (1,'Microbiologia');
insert into assuntos values (2,'Programacao');
insert into assuntos values (3,'Materiais');
insert into assuntos values (4,'Fisiologia');
insert into assuntos values (5,'Banco de Dados');
insert into assuntos values (6,'Cálculo');
insert into assuntos values (7,'Usinagem');

insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('737.4.202 S2002','Os bichos s�o assim','LTC',0,1,1);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('681.5.203 S442','Técnicas de programação estruturada','Campus',0,1,2);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('588.9.949 S3003','Ensaios de dureza e de moleza','LTC',0,1,3);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('737.4.234 S2323','O funcionamento do intestino','Globo',0,1,4);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('588.3.342 S4343','Torno radial: Como funciona a coisa','LTC',0,1,7);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('737.4.180 S2023','Bactérias, micróbios e coisas parecidas','Erika',0,1,1);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('683.2.343 S334','Teoria de bancos de dados','Campus',0,1,5);
insert into livros (id, titulo,editora,diasprazo,totpag, codassunto)
values ('333.5.656 S1849','Calculo diferencial e integral','LTC',0,1,6);


insert into autores values (1,'Silva, José da','Brasil');
insert into autores values (2,'Silva, Vanderlei da','Brasil');
insert into autores values (3,'Silva, João da','Brasil');
insert into autores values (4,'Silva, Pedro da','Brasil');
insert into autores values (5,'Silva, Ana da','Brasil');
insert into autores values (6,'Silva, Antonio da','Brasil');
insert into autores values (7,'Silva, Joaquim da','Brasil');
insert into autores values (8,'Silva, Maria da','Brasil');
insert into autores values (9,'Silva, Teobaldo da','Brasil');
insert into autores values (10,'Silva, Arlete da','Brasil');

insert into autorias values ('737.4.202 S2002',1);
insert into autorias values ('737.4.202 S2002',2);
insert into autorias values ('681.5.203 S442',3);
insert into autorias values ('588.9.949 S3003',4);
insert into autorias values ('737.4.234 S2323',5);
insert into autorias values ('588.3.342 S4343',6);
insert into autorias values ('588.3.342 S4343',7);
insert into autorias values ('588.3.342 S4343',4);
insert into autorias values ('737.4.180 S2023',8);
insert into autorias values ('737.4.180 S2023',2);
insert into autorias values ('683.2.343 S334',9);
insert into autorias values ('333.5.656 S1849',10);

insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(1,'Giovanna','Rua Emilia Gonssalves,100',null,'2222222','18080222','Centro','Sorocaba','SP');
insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(2,'Renan','Rua Paz Geralda Esmeralda,100',null,'2222222','18080222','Centro','Sorocaba','SP');
insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(3,'Gislaine Peres','Ruas das Orquideas,100',null,'2222222',null,'Itu','Votorantim','SP');
insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(4,'Romilda Santos','Ruas das Margaridas,100',null,'2222222','18080222','São Roque','Sorocaba','SP');
insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(5,'Maria Alcina','Ruas das Hortências,100',null,'2222222',null,'Centro','Votorantim','SP');
insert into socios (codigo,nome,lograd,complem,telefone,CEP,bairro,cidade,UF) values
(6,'Giovanna Silva','Rua Emilia Gonssalves,100',null,'2222222','18080222','Centro','Votorantim','SP');

insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(1,'737.4.202 S2002','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(2,'737.4.202 S2002','10/09/2012','17/09/2012',15.00);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(3,'737.4.202 S2002','10/09/2012','17/09/2012',20.00);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(4,'737.4.202 S2002','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(5,'737.4.202 S2002','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(1,'681.5.203 S442','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(2,'681.5.203 S442','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(3,'737.4.234 S2323','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(2,'683.2.343 S334','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(4,'333.5.656 S1849','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(4,'588.3.342 S4343','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(5,'588.3.342 S4343','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(2,'588.3.342 S4343','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(1,'588.3.342 S4343','10/09/2012','17/09/2012',0);
insert into emprestimos (codsocio,idlivro,dtretirada,dtdevprev,vrmulta) values
(1,'588.9.949 S3003','10/09/2012','17/09/2012',0);


--========================================================================--

--2)Editora

CREATE TABLE editoras
(
    id number(8),
    nome varchar2(20) NOT NULL,
    cidade varchar2(20) NOT NULL,
    estado varchar2(20) NOT NULL,
    constraint pk_editora primary key(id)
);
--- criando sequencia 
create sequence seq_editora;
insert into editoras values (seq_editora.nextval, 'Erika');
-----------------------------

alter table livros add ideditora number(8);

select * from livros;

ALTER TABLE livros ADD CONSTRAINT fk_livro_editora FOREIGN KEY (ideditora)
REFERENCES editoras(id);

--inserts editora

insert into editoras (id, nome, cidade, estado) 
values (seq_editora.nextval, 'Erika', 'São Paulo', 'SP');

insert into editoras (id, nome, cidade, estado) 
values (seq_editora.nextval,'LTC', 'Rio de Janeiro', 'RJ');

insert into editoras (id, nome, cidade, estado) 
values (seq_editora.nextval,'Campus', 'São Paulo', 'SP');

insert into editoras (id, nome, cidade, estado) 
values (seq_editora.nextval, 'Globo', 'São Paulo', 'SP');

insert into editoras (id, nome, cidade, estado) 
values (seq_editora.nextval, 'Editora do SEBRAE', 'Brasília', 'DF');


update livros set ideditora = 1 where editora = 'Erika';
update livros set ideditora = 2 where editora = 'LTC';
update livros set ideditora = 3 where editora = 'Campus';
update livros set ideditora = 4 where editora = 'Globo';

alter table livros drop column editora;

--------------------------------------------

--3)Livro mais de um assunto

CREATE TABLE livros_assuntos
(
    idlivro varchar2(15) primary key,
    codassunto Numeric(10,0),
    constraint fk_autoria_livro1 foreign key (idlivro) references livros(id),
    constraint fk_autoria_autor1 foreign key (codassunto) references assuntos(codigo)
);

insert into livros_assuntos values ('737.4.202 S2002', 1);
insert into livros_assuntos values('681.5.203 S442', 2);
insert into livros_assuntos values('588.9.949 S3003', 3);
insert into livros_assuntos values('737.4.234 S2323', 4);
insert into livros_assuntos values('588.3.342 S4343', 7);
insert into livros_assuntos values('737.4.180 S2023', 1);
insert into livros_assuntos values('683.2.343 S334', 5);
insert into livros_assuntos values('333.5.656 S1849', 6);

select * from assuntos;
ALTER TABLE livros DROP column codassunto;


-------------------------------------------

--4)Exclua o livro de calculo do banco de dados

DELETE FROM livros WHERE id = '333.5.656 S1849';


-------------------------------------------

--5)Altere os socios que nao tenham CEP cadastrado para a cidade de Sorocaba

UPDATE socios SET cidade = "Sorocaba" WHERE CEP = null;
--========================================================================--

--15/03

--2-) Adicionar uma nova coluna de nome DataNasc na tabela Autor. 
ALTER TABLE autores
ADD (datanasc date);

--3-) Alterar a coluna Titulo da tabela Livros de 80 para 100 posicoes.
ALTER TABLE livros MODIFY titulo varchar2(100);

--4-)
ALTER TABLE autores 
ADD CONSTRAINT ck_origem
CHECK (origem IN ('Brasil', 'EUA')); 

--5-)
SELECT titulo FROM livros
WHERE titulo = 'banco de dados';

--6-) criar as vibes datanasc 
SELECT datanasc FROM autores
WHERE datanasc >= 1950 and datanasc <=1970
ORDER BY origem, nome;

--7-) vai cair na prova 
SELECT l.titulo, a.nome, a.codigo
FROM livros l
INNER JOIN livros_assuntos la ON la.idlivro = l.id
INNER JOIN assuntos a ON a.codigo = la.codassunto;

--8-)
SELECT l.titulo, a.nome
FROM livros l
INNER JOIN livros_assuntos la ON la.idlivro = l.id
INNER JOIN assuntos a ON a.codigo = la.codassunto;

--9-) 
SELECT l.id, l.titulo, a.codigo, a.nome
FROM livros l
INNER JOIN autorias aus ON aus.idlivro = l.id
INNER JOIN autores a ON a.codigo = aus.codautor
ORDER BY l.id;

--10-)
SELECT a.codigo, count(a.codigo) FROM autores a
INNER JOIN autorias aus ON aus.codautor = a.codigo
INNER JOIN livros l ON l.id = aus.idlivro
GROUP BY aus.codautor
HAVING count(a.codigo) >=2;
--WHERE l.codautor = count(*) >= 2
