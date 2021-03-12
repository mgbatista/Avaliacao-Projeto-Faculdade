create database ProjetoFaculdadeCORRIGIDO;
use ProjetoFaculdadeCORRIGIDO;

create table Curso
(
	nome_curso varchar(50) not null,
	constraint pk_nome_curso primary key (nome_curso)
);

create table Aluno
(
	ra int not null identity(1,1),
	nome_aluno varchar(100) not null,
	end_logradouro varchar(50) not null,
	end_numero int not null,
	end_bairro varchar(50) not null,
	end_cep char(8) not null,
	end_localidade varchar(50) not null,
	end_uf char(2) not null,
	nome_curso varchar(50) not null,
	constraint pk_ra primary key (ra),
	constraint fk_nome_curso foreign key (nome_curso) references Curso (nome_curso)
);

create table Fone_Aluno
(
	ra int not null,
	numero char(15) not null,
	tipo varchar(20) not null,
	constraint pk_numero primary key (numero),
	constraint fk_ra_fone foreign key (ra) references Aluno (ra)
);

create table Disciplina
(
	sigla_disciplina char(5) not null,
	nome_disciplina varchar(50) not null,
	qtd_aulas int not null,
	nome_curso varchar(50) not null,
	constraint pk_sigla_disciplina primary key (sigla_disciplina),
	constraint fk_nome_curso_disciplina foreign key (nome_curso) references Curso (nome_curso)
);

create table Possui
(
	ra int not null,
	sigla_disciplina char(5) not null,
	semestre char(1) not null,
	ano char(10) not null,
	faltas int not null,
	nota_b1 float not null,
	nota_b2 float not null,
	nota_media float default 0,
	nota_sub float,
	situacao varchar(100) default 'Não Avaliado',
	constraint pk_ra_disc_semestre_ano primary key (ra, sigla_disciplina, semestre, ano),
	constraint fk_ra_possui foreign key (ra) references Aluno (ra),
	constraint fk_sigla_disciplina foreign key (sigla_disciplina) references Disciplina (sigla_disciplina)
);


-- Inserindo Dados

--Curso
insert into Curso (nome_curso) values('Análise Desenvolvimento de Sistemas');
insert into Curso (nome_curso) values('Ciência da Computação');
insert into Curso (nome_curso) values('Engenharia da Computação');

select * from Curso

-- Aluno
insert into Aluno (nome_aluno, end_logradouro, end_numero, end_bairro, end_cep, end_localidade, end_uf, nome_curso)
values('Luis Henrique Gavirate', 'Rua Bahia', 356, 'Jardim Brasil', '14975369', 'Araraquara', 'SP', 'Análise Desenvolvimento de Sistemas');
insert into Aluno (nome_aluno, end_logradouro, end_numero, end_bairro, end_cep, end_localidade, end_uf, nome_curso)
values('Maiara Batista', 'Rua Aldo Nicolucci', 258, 'Jardim São José', '15975370', 'Araraquara', 'SP', 'Ciência da Computação');
insert into Aluno (nome_aluno, end_logradouro, end_numero, end_bairro, end_cep, end_localidade, end_uf, nome_curso)
values('Lucas Pereira', 'Avenida Brasil', 785, 'Centro', '18975258', 'Araraquara', 'SP', 'Engenharia da Computação');
insert into Aluno (nome_aluno, end_logradouro, end_numero, end_bairro, end_cep, end_localidade, end_uf, nome_curso)
values('Joaquim Barbosa', 'Avenida Pedro Luis', 741, 'Vila Pereira', '15698741', 'Araraquara', 'SP', 'Ciência da Computação');
insert into Aluno (nome_aluno, end_logradouro, end_numero, end_bairro, end_cep, end_localidade, end_uf, nome_curso)
values('Maria Julia', 'Rua São Pedro', 356, 'Jardim Olivia', '14975526', 'Araraquara', 'SP', 'Análise Desenvolvimento de Sistemas');

select * from Aluno

-- Fone_Aluno
insert into Fone_Aluno (ra, numero, tipo) values(1, 16958862325, 'Celular');
insert into Fone_Aluno (ra, numero, tipo) values(2, 1633369887, 'Residencial');
insert into Fone_Aluno (ra, numero, tipo) values(3, 1685962323, 'Celular');
insert into Fone_Aluno (ra, numero, tipo) values(4, 1633258787, 'Residencial');
insert into Fone_Aluno (ra, numero, tipo) values(5, 16955236874, 'Celular');

select * from Fone_Aluno

-- Disciplina
insert into Disciplina (sigla_disciplina, nome_disciplina, qtd_aulas, nome_curso)
values('MAT', 'Matemática', 80, 'Engenharia da Computação');
insert into Disciplina (sigla_disciplina, nome_disciplina, qtd_aulas, nome_curso)
values('BD', 'Banco de Dados', 80, 'Análise Desenvolvimento de Sistemas');
insert into Disciplina (sigla_disciplina, nome_disciplina, qtd_aulas, nome_curso)
values('IOT', 'Internet das Coisas', 80, 'Ciência da Computação');
insert into Disciplina (sigla_disciplina, nome_disciplina, qtd_aulas, nome_curso)
values('ING', 'Inglês', 80, 'Análise Desenvolvimento de Sistemas');
insert into Disciplina (sigla_disciplina, nome_disciplina, qtd_aulas, nome_curso)
values('LG', 'Linguagem de Programação', 80, 'Análise Desenvolvimento de Sistemas');

select * from Disciplina

-- Possui
insert into Possui (ra, sigla_disciplina, semestre, ano, faltas, nota_b1, nota_b2)
values(1, 'BD', '1', 2020, 5, 10, 8);
insert into Possui (ra, sigla_disciplina, semestre, ano, faltas, nota_b1, nota_b2)
values(2, 'ING', '1', 2020, 20, 10, 8);
insert into Possui (ra, sigla_disciplina, semestre, ano, faltas, nota_b1, nota_b2)
values(3, 'LG', '2', 2020, 3, 2, 5);
insert into Possui (ra, sigla_disciplina, semestre, ano, faltas, nota_b1, nota_b2)
values(4, 'LG', '2', 2019, 3, 10, 8);
insert into Possui (ra, sigla_disciplina, semestre, ano, faltas, nota_b1, nota_b2)
values(5, 'ING', '2', 2019, 4, 8, 8);


select * from Possui

-- Update para testar Trigger de substitutiva
update Possui SET nota_sub = 6
where ra = 3 and sigla_disciplina = 'LG' and semestre = '2' and ano = 2020

-- BUSCAS

-- Item A: Quais são alunos de uma determinada disciplina ministrada no ano de 2020, com suas notas. Você definirá a disciplina.
select distinct A.ra, A.nome_aluno, D.sigla_disciplina, D.nome_disciplina, PO.nota_b1, PO.nota_b2, PO.nota_sub, PO.nota_media, PO.ano from Possui PO
inner join Aluno A on 
	A.ra = PO.ra
inner join Disciplina D on 
	D.sigla_disciplina = PO.sigla_disciplina
	where D.sigla_disciplina = 'LG' and PO.ano = 2020

-- Item B: Quais são as notas de um aluno em todas as disciplinas por ele cursadas no 2º. Semestre de 2019. (“BOLETIM COM AS INFORMAÇÕES DAS DISCIPLINAS CURSADAS”). Você definirá o aluno.
select distinct A.nome_aluno, D.nome_disciplina, PO.nota_b1, PO.nota_b2, PO.nota_sub, PO.nota_media, PO.semestre, PO.ano from Possui PO
inner join Aluno A on 
	A.ra = PO.ra
inner join Disciplina D on 
	D.sigla_disciplina = PO.sigla_disciplina
	where A.nome_aluno like '%Joaquim%' and PO.ano = 2019 and PO.semestre = '2'

-- Item C: Quais são os alunos reprovados por nota (média inferior a cinco) no ano de 2020 e, o nome das disciplinas e as médias. Você definirá o curso.
select distinct A.nome_aluno, C.nome_curso, D.nome_disciplina, PO.nota_media, PO.ano from Possui PO
inner join Aluno A on 
	A.ra = PO.ra
inner join Disciplina D on 
	D.sigla_disciplina = PO.sigla_disciplina
inner join Curso C on
	C.nome_curso = D.nome_curso
	where C.nome_curso = 'Análise Desenvolvimento de Sistemas' and PO.ano = 2020 and PO.nota_media < 6

-- Item D: (Criar consulta envolvendo 4 tabelas) Dado o nome do aluno, mostre seu RA, nome, qual o curso que está matriculado, suas disciplinas, notas e situação.
select distinct A.ra, A.nome_aluno, C.nome_curso, D.nome_disciplina, PO.nota_b1, PO.nota_b2, PO.nota_sub, PO.nota_media, PO.situacao from Possui PO
inner join Aluno A on 
	A.ra = PO.ra
inner join Disciplina D on 
	D.sigla_disciplina = PO.sigla_disciplina
inner join Curso C on
	C.nome_curso = D.nome_curso
	where A.nome_aluno like '%Maiara%'


-- CRIANDO TRIGGERS

-- Trigger para calculo da média na tabela Possui
Drop trigger if exists TCalculo_Media_Situacao;

CREATE TRIGGER TCalculo_Media_Situacao
ON Possui
FOR INSERT
AS
Begin
    DECLARE
    @B1 FLOAT,
	@B2	FLOAT,
	@MEDIA FLOAT,
	@FALTAS INT,
	@SITUACAO VARCHAR(100),
	@RA INT,
	@SIGLA_DISCIPLINA CHAR(5),
	@SEMESTRE CHAR(1),
	@ANO CHAR(10)
    		
    SELECT @B1 = nota_b1, @B2 = nota_b2, @MEDIA =(@B1+@B2)/2, @FALTAS = faltas, @RA = ra, @SIGLA_DISCIPLINA = sigla_disciplina, @SEMESTRE = semestre, @ANO = ano
	FROM INSERTED

	if(@FALTAS >= 20)
	begin
	SET @SITUACAO = 'REPROVADO POR FALTA!'
	end
	else if(@MEDIA >= 6)
	begin
	SET @SITUACAO = 'APROVADO!'
	end
	else
	begin
	SET @SITUACAO = 'AGUARDANDO NOTA SUB!'
	end
	
	ALTER TABLE Possui DISABLE TRIGGER TCalculo_Substitutiva
    UPDATE Possui SET Possui.nota_media = @MEDIA,
	Possui.situacao = @SITUACAO
    WHERE Possui.ra = @RA
	and Possui.sigla_disciplina = @SIGLA_DISCIPLINA
	and Possui.semestre = @SEMESTRE
	and Possui.ano = @ANO
	ALTER TABLE Possui ENABLE TRIGGER TCalculo_Substitutiva
end;

-- Trigger para calcular media e situação após substitutiva 
Drop trigger if exists TCalculo_Substitutiva;

CREATE TRIGGER TCalculo_Substitutiva
ON Possui
FOR UPDATE
AS
Begin
    DECLARE
    @B1 FLOAT,
	@B2	FLOAT,
	@MEDIA FLOAT,
	@RA INT,
	@SIGLA_DISCIPLINA CHAR(5),
	@SUBSTITUTIVA FLOAT,
	@SITUACAO VARCHAR(100),
	@SEMESTRE CHAR(1),
	@ANO CHAR(10)

		
    SELECT @B1 = nota_b1, @B2 = nota_b2, @RA = ra, @SIGLA_DISCIPLINA = sigla_disciplina, @SUBSTITUTIVA = nota_sub, @SEMESTRE = semestre, @ANO = ano
	FROM INSERTED
	
	if(@B1 <= @B2)
	begin
	SET @B1 = @SUBSTITUTIVA
	end 
	else 
	begin
	SET @B2 = @SUBSTITUTIVA
	end

	SET @MEDIA = (@B1+@B2)/2

	if(@MEDIA >= 6)
	begin
	SET @SITUACAO = 'APROVADO!'
	end
	else
	begin
	SET @SITUACAO = 'REPROVADO POR NOTA!'
	end

	UPDATE Possui SET Possui.situacao = @SITUACAO,
	Possui.nota_media = @MEDIA
    WHERE Possui.ra = @RA
	and Possui.sigla_disciplina = @SIGLA_DISCIPLINA
	and Possui.semestre = @SEMESTRE
	and Possui.ano = @ANO
	
end;

