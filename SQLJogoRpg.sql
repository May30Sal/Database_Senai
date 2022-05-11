-- DDL
CREATE DATABASE JogoRpgOnline
GO

USE JogoRpgOnline
GO

CREATE TABLE Usuario(
	UserId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(50) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Classe (
	ClasseId INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE Personagem (
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(50) UNIQUE NOT NULL,
	UserId INT UNIQUE FOREIGN KEY REFERENCES Usuario(UserId),
	ClasseId INT FOREIGN KEY REFERENCES Classe(ClasseId)
)
GO

CREATE TABLE Habilidade (
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE ClasseHabilidade (
	ClasseId INT FOREIGN KEY REFERENCES Classe(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidade(HabilidadeId)
)
GO

--DML
INSERT INTO Usuario VALUES ('teste1@email.com', '123456')
INSERT INTO Classe VALUES ('Bárbaro')
INSERT INTO Habilidade VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagem VALUES ('DeuBug', 1, 1)
INSERT INTO ClasseHabilidade VALUES (1, 1), (1, 2)

INSERT INTO Usuario VALUES ('teste2@email.com', '123456')
INSERT INTO Classe VALUES ('Monge')
INSERT INTO Habilidade VALUES ('Recuperar Vida')
INSERT INTO Personagem VALUES ('BitBug', 2, 2)
INSERT INTO ClasseHabilidade VALUES (2, 2), (2, 3)

UPDATE Usuario
SET Senha = '456789'
WHERE UserId = 2

-- DQL
SELECT * FROM Usuario
SELECT * FROM Classe
SELECT * FROM Personagem
SELECT * FROM Classe

SELECT P.NomePersonagem 'Nome do Personagem', C.NomeClasse 'Nome da Classe', U.Email 'Email'
FROM Personagem AS P 
JOIN Classe AS C
	ON P.ClasseId = C.ClasseId
JOIN Usuario AS U
	ON U.UserId = P.UserId

CREATE LOGIN usuario
WITH PASSWORD = '1234'
CREATE USER usuario FOR LOGIN usuario
GRANT SELECT TO usuario

CREATE LOGIN usuario1
WITH PASSWORD = '1234'
CREATE USER usuario1 FOR LOGIN usuario1
GRANT SELECT TO usuario1

SELECT * FROM Usuario

INSERT INTO Usuario VALUES ('teste4@email.com', '123456')
