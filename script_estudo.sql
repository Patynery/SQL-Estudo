[CREATE DATABASE [dbEstudo]
GO

USE [dbEstudo]
GO

/* 1- CRIAR TABELAS */
 CREATE TABLE [dbo].[Alunos](
	[AlunoId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[RA] [varchar](50) NULL,
	[DtCadastro] [datetime] NULL,
	CONSTRAINT PK_Alunos PRIMARY KEY (AlunoId ASC)
)
GO

CREATE TABLE [dbo].[Professores](
	[ProfessorID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	CONSTRAINT PK_Professores PRIMARY KEY (ProfessorID ASC)
 )
 GO

 CREATE TABLE [dbo].[ProfessorCurso](
	[ProfessorCursoId] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorId] [int] NULL,
	[CursoId] [int] NULL,
	CONSTRAINT PK_ProfessorCurso PRIMARY KEY (ProfessorCursoId ASC)
 )
GO

CREATE TABLE [dbo].[AlunoCurso](
	[AlunoCursoId] [int] IDENTITY(1,1) NOT NULL,
	[AlunoId] [int] NULL,
	[CursoId] [int] NULL,
	CONSTRAINT PK_AlunoCurso PRIMARY KEY(AlunoCursoId ASC)
) 
GO

CREATE TABLE [dbo].[Cursos](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	CONSTRAINT PK_Cursos PRIMARY KEY(CursoID ASC)
 )
GO

INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('João da Silva', '101900', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Maria da Silva', '101901', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Pedro da Silva', '101902', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Alberto Oliveira', '101903', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Roberto Campos', '101904', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Aline Teixeira', '101905', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Mariana de Souza', '101915', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Maria Aparecida', '101918', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Pedro Soares', '101920', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Elza Soares', '101921', GETDATE());
INSERT INTO Alunos(Nome,RA,DtCadastro) VALUES ('Carlos', '101921', GETDATE());

INSERT INTO Professores(Nome) VALUES ('Professor Mario Antonio');
INSERT INTO Professores(Nome) VALUES ('Professor Claudio Paranhos');
INSERT INTO Professores(Nome) VALUES ('Professor Cleiton da Silva');
INSERT INTO Professores(Nome) VALUES ('Professora Marta Queiroz');
INSERT INTO Professores(Nome) VALUES ('Professora Lucia de Oliveira');
INSERT INTO Professores(Nome) VALUES ('Professora Rosa de Castro');
INSERT INTO Professores(Nome) VALUES ('Professora Lucimara Camargo');

INSERT INTO Cursos(Nome) VALUES ('Análise e Desenvolvimento de Sistemas');
INSERT INTO Cursos(Nome) VALUES ('Logística');
INSERT INTO Cursos(Nome) VALUES ('Educação Física');
INSERT INTO Cursos(Nome) VALUES ('Letras');
INSERT INTO Cursos(Nome) VALUES ('Geografia');
INSERT INTO Cursos(Nome) VALUES ('História');
INSERT INTO Cursos(Nome) VALUES ('Arquitetura');
INSERT INTO Cursos(Nome) VALUES ('Engenharia Civil');
INSERT INTO Cursos(Nome) VALUES ('Engenharia Elétrica');

INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (1,1);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (2,1);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (3,1);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (4,1);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (1,2);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (2,2);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (3,2);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (1,3);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (7,3);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (6,4);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (1,5);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (2,5);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (6,5);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (8,6);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (9,6);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (10,7);
INSERT INTO AlunoCurso(AlunoId,CursoId) VALUES (3,8);


INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (1,1);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (1,2);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (1,3);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (2,4);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (3,5);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (4,5);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (4,6);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (5,7);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (6,8);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (7,1);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (7,8);
INSERT INTO ProfessorCurso(ProfessorId,CursoId) VALUES (7,6);

/* Selecionar aluno, ra, curso */
SELECT A.Nome AS 'ALUNO', A.RA, C.Nome AS 'CURSO' FROM ALUNOS A 
INNER JOIN ALUNOCURSO B ON A.AlunoId = B.AlunoId
INNER JOIN CURSOS C ON B.CursoId = C.CursoId

/* Selecionar professor e curso */
SELECT A.Nome as 'PROFESSOR', C.Nome as 'CURSO' FROM Professores A
INNER JOIN ProfessorCurso B ON A.ProfessorID = B.ProfessorId
INNER JOIN Cursos C ON B.CursoId = C.CursoId

/* Selecionar aluno, curso e professor */
SELECT A.Nome AS Aluno, C.Nome AS Curso,E.Nome AS Professor 
FROM ALUNOS A 
INNER JOIN AlunoCurso B ON A.AlunoId = B.AlunoId
INNER JOIN Cursos C ON C.CursoId = B.CursoId
INNER JOIN ProfessorCurso D ON D.CursoId =C.CursoId
INNER JOIN Professores E ON E.ProfessorID = D.ProfessorId

/* Selecionar a quantidade de alunos em um curso */
SELECT COUNT(A.AlunoId) as 'QTD DE ALUNOS' FROM Alunos A
INNER JOIN AlunoCurso B ON A.AlunoId = B.AlunoId
INNER JOIN Cursos C ON B.CursoId = C.CursoId 
WHERE C.Nome ='Análise e Desenvolvimento de Sistemas'


/* Selecionar a quantidade de alunos de um professor */
SELECT COUNT(A.AlunoId) AS 'Quantidade de Alunos por Professor' FROM Alunos A 
INNER JOIN AlunoCurso B ON A.AlunoId = B.AlunoId
INNER JOIN Cursos C ON C.CursoId = B.CursoId
INNER JOIN ProfessorCurso D ON D.CursoId = C.CursoId
INNER JOIN Professores E ON E.ProfessorId = D.ProfessorId
--Where e.Nome ='Professora Lucia de Oliveira'
--Where e.Nome ='Professor Mario Antonio'
Where e.Nome ='Professor Claudio Paranhos'
--Where e.Nome ='Professora Lucimara Camargo'

/* Selecionar cursos ordenado por nome */
SELECT * FROM Cursos ORDER BY Nome

/* Selecionar alunos que começam com a letra "A" ordenado por data de cadastro */
SELECT * FROM Alunos Where Nome Like'M%' Order by DtCadastro

/* Atualizar o campo RA de um aluno */
UPDATE Alunos SET RA='100200' WHERE AlunoId=11

/* Excluir um aluno */
DELETE Alunos WHERE AlunoId=11