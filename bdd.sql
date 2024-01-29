DROP DATABASE IF EXISTS tai;

CREATE DATABASE IF NOT EXISTS tai;

USE tai;

CREATE TABLE admin (
    usernameAdmin int(11) NOT NULL,
    passwordAdmin varchar(64) NOT NULL
) ENGINE=InnoDB; DEFAULT CHARSET=latin1;

CREATE TABLE utilisateur(
    idUtilisateur int(11) NOT NULL,
    username varchar(32) NOT NULL,
    password varchar(64) NOT NULL,
    estFormateur boolean NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE question(
    idQuestion int(11) NOT NULL,
    intitule text NOT NULL,
    explication text,
    image varchar(128),
    idSerie int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE serie(
    idSerie int(11) NOT NULL,
    semaine date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE categorie(
    idCategorie int(11) NOT NULL,
    nomCategorie varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE reponse(
    idReponse int(11) NOT NULL,
    numeroReponse int(1) NOT NULL,
    texteReponse text NOT NULL,
    estVraie boolean NOT NULL,
    idQuestion int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE appartient(
    idQuestion int(11) NOT NULL,
    idCategorie int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE effectue(
    idUtilisateur int(11) NOT NULL,
    idSerie int(11) NOT NULL,
    score int(2) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE repond(
    idUtilisateur int(11) NOT NULL,
    idQuestion int(11) NOT NULL,
    correct boolean NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE admin
ADD PRIMARY KEY (`usernameAdmin`);

ALTER TABLE utilisateur
ADD PRIMARY KEY (`idUtilisateur`);

ALTER TABLE question
ADD PRIMARY KEY (`idQuestion`),
ADD KEY `FK_SERIE` (`idSerie`),
MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE serie
ADD PRIMARY KEY (`idSerie`),
MODIFY `idSerie` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE categorie
ADD PRIMARY KEY (`idCategorie`),
MODIFY `idCategorie` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE reponse
ADD PRIMARY KEY (`idReponse`),
ADD KEY `FK_QUESTION` (`idQuestion`),
MODIFY `idReponse` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE appartient
ADD KEY `FK_AQUESTION` (`idQuestion`),
ADD KEY `FK_ACATEGORIE` (`idCategorie`);

ALTER TABLE effectue
ADD KEY `FK_EUTILISATEUR` (`idUtilisateur`),
ADD KEY `FK_ESERIE` (`idSerie`);

ALTER TABLE repond
ADD KEY `FK_RUTILISATEUR` (`idUtilisateur`),
ADD KEY `FK_RQUESTION` (`idQuestion`);

ALTER TABLE question
ADD CONSTRAINT `FK_SERIE` FOREIGN KEY (`idSerie`) References `serie` (`idSerie`);

ALTER TABLE reponse
ADD CONSTRAINT `FK_QUESTION` FOREIGN KEY (`idQuestion`) References `question` (`idQuestion`);

ALTER TABLE appartient
ADD CONSTRAINT `FK_AQUESTION` FOREIGN KEY (`idQuestion`) References `question` (`idQuestion`),
ADD CONSTRAINT `FK_ACATEGORIE` FOREIGN KEY (`idCategorie`) References `categorie` (`idCategorie`);

ALTER TABLE effectue
ADD CONSTRAINT `FK_EUTILISATEUR` FOREIGN KEY (`idUtilisateur`) References `utilisateur` (`idUtilisateur`),
ADD CONSTRAINT `FK_ESERIE` FOREIGN KEY (`idSerie`) References `serie` (`idSerie`);

ALTER TABLE repond
ADD CONSTRAINT `FK_RUTILISATEUR` FOREIGN KEY (`idQuestion`) References `utilisateur` (`idUtilisateur`),
ADD CONSTRAINT `FK_RQUESTION` FOREIGN KEY (`idQuestion`) References `question` (`idQuestion`);