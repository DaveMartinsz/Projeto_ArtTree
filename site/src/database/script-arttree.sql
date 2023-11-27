drop database arttree;
create database arttree;
use arttree;

CREATE TABLE EstiloFav (
	idEstiloFav INT PRIMARY KEY AUTO_INCREMENT,
    TipoArte VARCHAR(11), constraint chkTipoArte CHECK (TipoArte in('Digital', 'Tradicional'))
    );
    
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    fkEstiloFav INT, FOREIGN KEY (fkEstiloFav) REFERENCES EstiloFav(idEstiloFav)
);

CREATE TABLE Login (
	idLogin INT PRIMARY KEY AUTO_INCREMENT,
	Email VARCHAR(50),
	Senha VARCHAR(50),
	fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Lista (
idLista INT PRIMARY KEY AUTO_INCREMENT,
Artes VARCHAR(45),
fkUsuario INT, FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);
    
INSERT INTO EstiloFav VALUES
    (null, 'Digital'),
    (null, 'Tradicional');

INSERT INTO Usuario (nome, fkEstiloFav) VALUES
    ('Leonardo Da Vinci', 1),
    ('Beethoveen', 1),
	('Monalisa', 1),
    ('Anne Frank', 1),
    ('Joana Darc', 1),
    ('Mozart', 2),
    ('Galileu', 2);
    
INSERT INTO Login (Email, Senha, fkUsuario) VALUES 
	('davinci@sptech.com', 'senha', 1),
    ('beethoveen@gmail.com', '321', 2),
    ('monalisa@outlook.com', 'abc', 3),
    ('annefrank@email.com', '666', 4),
    ('joanadarc@yahoo.com', 'loremipsium', 5),
    ('mozartcontato@sptech', 'musica', 6),
    ('Galileu@terra.com', 'terra', 7);
    
INSERT INTO Lista (Artes, fkUsuario) VALUES 
	('Naruto', 1),
    ('Dragon Ball', 1),
    ('Simpsons', 1),
    ('Naruto', 2),
    ('Rick e Morty', 2),
    ('Minions', 2),
    ('Sonic', 3),
    ('Hora de aventura', 4),
    ('Minions', 4),
    ('Cavaleiros do Zodiaco', 5),
    ('Padrinhos Magicos', 6),
    ('Naruto', 7),
    ('Dragon Ball', 7),
    ('Homem Aranha', 7);
    
SELECT * FROM Usuario;
SELECT * FROM Login;
SELECT * FROM EstiloFav;
SELECT * FROM Lista;
    
-- Join usuario e login
SELECT Usuario.*, Login.* FROM Usuario
JOIN Login
ON idUsuario = fkUsuario;

-- Exibir Usuario e Lista de Artes que gosta
SELECT Lista.Artes, Lista.fkUsuario, Usuario.nome FROM Lista
JOIN Usuario
ON fkUsuario = idUsuario
WHERE idUsuario = 7;

-- Excluir lista por usuário
DELETE FROM Lista WHERE fkUsuario = 7;

-- Exibir quantidade de usuários que preferem Arte Digital/Tradicional
SELECT COUNT(fkEstiloFav) FROM Usuario GROUP BY fkEstiloFav;

-- Exibir quantidade de usuários que preferem Arte Digital/Tradicional
SELECT EstiloFav.TipoArte,
 COUNT(fkEstiloFav) as QuantasPreferem
 FROM EstiloFav
 JOIN Usuario
 ON idEstiloFav = fkEstiloFav
 GROUP BY fkEstiloFav;

-- Exibir nome das pessoas que preferem cada tipo de arte
SELECT Usuario.nome, EstiloFav.TipoArte FROM Usuario
JOIN EstiloFav
ON fkEstiloFav = idEstiloFav;

-- Instrução SQL para aquarioModels fazer requisição no banco
SELECT COUNT(fkEstiloFav) as Preferencias FROM Usuario GROUP BY fkEstiloFav;

-- Join Usuario, Login, Estilo Favorito
SELECT u.*, l.*, ef.* FROM Usuario as u
JOIN Login as l
ON u.idUsuario = l.fkUsuario
JOIN EstiloFav as ef
ON u.fkEstiloFav = ef.idEstiloFav;

-- Join Usuario, Login, Estilo Favorito e Lista
SELECT u.*, l.*, li.Artes, ef.* FROM Usuario as u
JOIN Login as l
ON u.idUsuario = l.fkUsuario
JOIN Lista as li
ON li.fkUsuario = u.idUsuario
JOIN EstiloFav as ef
ON u.fkEstiloFav = ef.idEstiloFav;

-- Join com todas as tabelas
SELECT u.*, l.*, li.*, ef.* FROM Usuario as u
JOIN Login as l
ON u.idUsuario = l.fkUsuario
JOIN Lista as li
ON li.fkUsuario = u.idUsuario
JOIN EstiloFav as ef
ON u.fkEstiloFav = ef.idEstiloFav;


SELECT Usuario.nome, EstiloFav.TipoArte FROM Usuario
JOIN EstiloFav
ON idUsuario = fkEstiloFav;


create user 'ConexaoComBanco'@'localhost' identified by 'sptech';
GRANT INSERT, SELECT, DELETE ON arttree.* to 'ConexaoComBanco'@localhost;
flush privileges;

