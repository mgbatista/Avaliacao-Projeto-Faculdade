create database ProjetoFaculdade;
use ProjetoFaculdade;

create table Aluno
(
	numero_matricula int not null identity(1,1),
	nome_aluno varchar(100) not null,
	constraint pk_numero_matricula primary key (numero_matricula)
);

create table Disciplina
(
	cod_disciplina int not null identity(1,1),
	nome_disciplina varchar(50) not null,
	carga_horaria int not null,
	constraint pk_cod_disciplina primary key (cod_disciplina)
);

create table Boletim
(
	cod_boletim int not null identity(1,1),
	numero_matricula int not null,
	cod_disciplina int not null,
	situacao varchar(50) not null default 'Não Avaliado!',
	semestre varchar(30) not null,
	ano_letivo varchar(6) not null,
	constraint pk_cod_boletim primary key (cod_boletim),
	constraint fk_numero_matricula foreign key (numero_matricula) references Aluno (numero_matricula),
	constraint fk_cod_disciplina foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);


create table Matricula
(
	numero_matricula int not null,
	cod_disciplina int not null,
	B1 float not null,
	B2 float not null,
	media float not null default 0,
	faltas int not null,
	curso varchar(50) not null,
	constraint fk_numero_matricula_matricula foreign key (numero_matricula) references Aluno (numero_matricula),
	constraint fk_cod_disciplina_matricula foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);

create table Substitutiva
(
	numero_matricula int not null,
	cod_disciplina int not null,
	substitutiva float,
	constraint fk_numero_matricula_disc_boletim foreign key (numero_matricula) references Aluno (numero_matricula),
	constraint fk_cod_disciplina_disc_boletim foreign key (cod_disciplina) references Disciplina (cod_disciplina)
);



-- Inserindo Dados

--Alunos
insert into Aluno (nome_aluno) values('Luis Henrique Gavirate');
insert into Aluno (nome_aluno) values('Maiara Batista');
insert into Aluno (nome_aluno) values('Gabriela Pereira');
insert into Aluno (nome_aluno) values('Lucas Silva');
insert into Aluno (nome_aluno) values('Julia Maria Rocha');

select * from Aluno

-- Disciplina
insert into Disciplina (nome_disciplina, carga_horaria) values('Matemática', 80);
insert into Disciplina (nome_disciplina, carga_horaria) values('Ciências', 80);
insert into Disciplina (nome_disciplina, carga_horaria) values('Banco de Dados', 80);
insert into Disciplina (nome_disciplina, carga_horaria) values('Internet das Coisas', 80);
insert into Disciplina (nome_disciplina, carga_horaria) values('Inglês', 80);

select * from Disciplina

-- Matricula
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(1, 1, 10, 8, 5, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(1, 2, 8.5, 8, 2, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(1, 3, 2, 2, 0, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(2, 1, 10, 10, 0, 'Ciência da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(2, 4, 7.5, 10, 1, 'Ciência da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(2, 5, 6, 8, 2, 'Ciência da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(3, 2, 10, 10, 5, 'Engenharia da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(3, 5, 9, 8, 21, 'Engenharia da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(3, 3, 5, 5, 0, 'Engenharia da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(4, 4, 7, 8, 4, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(4, 2, 9.5, 8, 1, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(4, 3, 10, 10, 5, 'Análise Desenvolvimento de Sistemas');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(5, 1, 10, 10, 20, 'Engenharia da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(5, 2, 8, 8, 3, 'Engenharia da Computação');
insert into Matricula (numero_matricula, cod_disciplina, B1, B2, faltas, curso)
values(5, 5, 2, 3, 30, 'Engenharia da Computação');

select * from Matricula

-- Substitutiva
insert into Substitutiva (numero_matricula, cod_disciplina, substitutiva)
values(1, 3, 10)

insert into Substitutiva (numero_matricula, cod_disciplina, substitutiva)
values(3, 3, 5)

select * from Substitutiva

-- Boletim
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(1, 1, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(3, 5, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(3, 3, '2º Semestre', 2019);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(1, 2, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(1, 3, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(2, 1, '2º Semestre', 2019);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(2, 4, '2º Semestre', 2019);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(2, 5, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(3, 2, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(3, 5, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(4, 4, '2º Semestre', 2019);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(4, 2, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(4, 3, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(5, 1, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(5, 2, '1º Semestre', 2020);
insert into Boletim (numero_matricula, cod_disciplina, semestre, ano_letivo)
values(5, 5, '1º Semestre', 2020);


select * from Boletim

-- BUSCAS

-- Item A: Quais são alunos de uma determinada disciplina ministrada no ano de 2020, com suas notas. Você definirá a disciplina.
select distinct MAT.numero_matricula, A.nome_aluno, DI.nome_disciplina, MAT.B1, MAT.B2, MAT.media, BO.ano_letivo from Matricula MAT
inner join Aluno A on 
	MAT.numero_matricula = A.numero_matricula
inner join Boletim BO on 
	BO.cod_disciplina = MAT.cod_disciplina
	and BO.numero_matricula = MAT.numero_matricula
inner join Disciplina DI on
	DI.cod_disciplina = MAT.cod_disciplina
	where DI.nome_disciplina = 'Matemática' and BO.ano_letivo = 2020

-- Item B: Quais são as notas de um aluno em todas as disciplinas por ele cursadas no 2º. Semestre de 2019. (“BOLETIM COM AS INFORMAÇÕES DAS DISCIPLINAS CURSADAS”). Você definirá o aluno.
select distinct A.nome_aluno, DI.nome_disciplina, MAT.B1, MAT.B2, MAT.media, BO.semestre, BO.ano_letivo from Matricula MAT
inner join Aluno A on 
	MAT.numero_matricula = A.numero_matricula
inner join Boletim BO on 
	BO.cod_disciplina = MAT.cod_disciplina
	and BO.numero_matricula = MAT.numero_matricula
inner join Disciplina DI on
	DI.cod_disciplina = MAT.cod_disciplina
	where A.nome_aluno like '%Maiara%' and BO.ano_letivo = 2019 and BO.semestre like '%2%'

-- Item C: Quais são os alunos reprovados por nota (média inferior a cinco) no ano de 2020 e, o nome das disciplinas e as médias. Você definirá o curso.
select distinct A.nome_aluno, MAT.curso, DI.nome_disciplina, MAT.media, BO.ano_letivo from Matricula MAT
inner join Aluno A on 
	MAT.numero_matricula = A.numero_matricula
inner join Boletim BO on 
	BO.cod_disciplina = MAT.cod_disciplina
	and BO.numero_matricula = MAT.numero_matricula
inner join Disciplina DI on
	DI.cod_disciplina = MAT.cod_disciplina
	where MAT.curso = 'Engenharia da Computação' and BO.ano_letivo = 2020 and MAT.media < 6

-- Item D: (Criar consulta envolvendo 4 tabelas) Dado o nome de uma disciplina, mostre quais os alunos que fizeram substitutiva, e suas notas (B1, B, Media, Substitutiva).
select distinct MAT.numero_matricula, A.nome_aluno, MAT.B1, MAT.B2, SU.substitutiva, MAT.media from Matricula MAT
inner join Aluno A on 
	MAT.numero_matricula = A.numero_matricula
inner join Substitutiva SU on 
	SU.cod_disciplina = MAT.cod_disciplina
	and SU.numero_matricula = MAT.numero_matricula
inner join Disciplina DI on
	DI.cod_disciplina = MAT.cod_disciplina
	where DI.nome_disciplina = 'Banco de Dados' 

-- CRIANDO TRIGGERS

-- Trigger para calculo da média na tabela Matricula
Drop trigger if exists TCalculo_Media;

CREATE TRIGGER TCalculo_Media
ON Matricula
FOR INSERT
AS
Begin
    DECLARE
    @B1 FLOAT,
	@B2	FLOAT,
	@MEDIA FLOAT,
	@NUMERO_MATRICULA INT,
	@COD_DISCIPLINA INT
    		
    SELECT @B1 = B1, @B2 = B2, @MEDIA = (@B1+@B2)/2, @NUMERO_MATRICULA = numero_matricula, @COD_DISCIPLINA = cod_disciplina
	FROM INSERTED

    UPDATE Matricula SET Matricula.media = @MEDIA
    WHERE Matricula.numero_matricula = @NUMERO_MATRICULA 
	and Matricula.cod_disciplina = @COD_DISCIPLINA
end;

-- Trigger para calculo da Média Final na tabela Disciplina Boletim
Drop trigger if exists TCalculo_Substitutiva;

CREATE TRIGGER TCalculo_Substitutiva
ON Substitutiva
FOR INSERT
AS
Begin
    DECLARE
    @B1 FLOAT,
	@B2	FLOAT,
	@MEDIA FLOAT,
	@NUMERO_MATRICULA INT,
	@COD_DISCIPLINA INT,
	@SUBSTITUTIVA FLOAT
		
    SELECT @NUMERO_MATRICULA = numero_matricula, @COD_DISCIPLINA = cod_disciplina, @SUBSTITUTIVA = substitutiva
	FROM INSERTED
	SELECT @B1 = B1, @B2 = B2 
	FROM Matricula
	WHERE Matricula.numero_matricula = @NUMERO_MATRICULA and Matricula.cod_disciplina = @COD_DISCIPLINA
	if(@B1 <= @B2)
	begin
	SET @B1 = @SUBSTITUTIVA
	end 
	else 
	begin
	SET @B2 = @SUBSTITUTIVA
	end
	SET @MEDIA = (@B1+@B2)/2

	UPDATE Matricula SET Matricula.media = @MEDIA
    WHERE Matricula.numero_matricula = @NUMERO_MATRICULA 
	and Matricula.cod_disciplina = @COD_DISCIPLINA
end;

-- Trigger para verificar resultado Situação do Aluno
Drop trigger if exists TSituacao_Aluno

CREATE TRIGGER TSituacao_Aluno
ON Boletim
FOR INSERT
AS
Begin
    DECLARE
    @MEDIA FLOAT,
	@FALTAS INT,
	@NUMERO_MATRICULA INT,
	@COD_DISCIPLINA INT,
	@SITUACAO_ALUNO VARCHAR(50)
	
	SELECT @NUMERO_MATRICULA = numero_matricula, @COD_DISCIPLINA = cod_disciplina, @SITUACAO_ALUNO = situacao
	FROM INSERTED
	SELECT @MEDIA = media, @FALTAS = faltas
	FROM Matricula
	WHERE Matricula.numero_matricula = @NUMERO_MATRICULA and Matricula.cod_disciplina = @COD_DISCIPLINA
	if(@MEDIA >= 6 and @FALTAS < 20)
	begin
	SET @SITUACAO_ALUNO = ('APROVADO!')
	end 
	else if (@MEDIA >= 6 and @FALTAS >= 20)
	begin
	SET @SITUACAO_ALUNO = ('REPROVADO POR FALTA!')
	end
	else
	begin
	SET @SITUACAO_ALUNO = ('REPROVADO POR NOTA!')
	end
	
	UPDATE Boletim SET Boletim.situacao = @SITUACAO_ALUNO
    WHERE Boletim.numero_matricula = @NUMERO_MATRICULA 
	and Boletim.cod_disciplina = @COD_DISCIPLINA
end;


