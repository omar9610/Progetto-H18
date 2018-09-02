CREATE TABLE `COMPAGNIA` (
  `NOME` VARCHAR(45) NULL,
PRIMARY KEY (`NOME`))
ENGINE = InnoDB;

CREATE TABLE `ITINERARI` (
  `NOME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NOME`))
ENGINE = InnoDB;

CREATE TABLE `TRATTE` (
  `NUMTRATTA` INT NOT NULL,
  `ITINERARI_NOME` VARCHAR(45) NOT NULL,
  `STAZIONE1` VARCHAR(45) NOT NULL,
  `STAZIONE2` VARCHAR(45) NOT NULL,
  `DURATA` INT NOT NULL,
  `LUNGHEZZA` INT NOT NULL,
FOREIGN KEY (`ITINERARI_NOME`) REFERENCES ITINERARI(`NOME`)
ON UPDATE CASCADE,
PRIMARY KEY (`NUMTRATTA`,`ITINERARI_NOME`))
ENGINE = InnoDB;

CREATE TABLE `TRENO` (
  `CODTRENO` VARCHAR(45) NOT NULL,
  `COMPAGNIA_NOME` VARCHAR(45) NOT NULL,
FOREIGN KEY (`COMPAGNIA_NOME`) REFERENCES COMPAGNIA(`NOME`)
ON UPDATE CASCADE,
PRIMARY KEY (`CODTRENO`))
ENGINE = InnoDB;

CREATE TABLE `VAGONE` (
  `NUMVAG` INT NOT NULL,
  `CODTRENO` VARCHAR(45) NOT NULL,
  `TIPOLOGIA` VARCHAR(45) NOT NULL,
  `NUMPOSTI` INT NOT NULL,
FOREIGN KEY (`CODTRENO`) REFERENCES TRENO(`CODTRENO`)
ON UPDATE CASCADE,
PRIMARY KEY (`NUMVAG`,`CODTRENO`))
ENGINE = InnoDB;

CREATE TABLE `PREZZI` (
  `COMPAGNIA_NOME` VARCHAR(45) NOT NULL,
  `TIPOLOGIA` VARCHAR(45) NOT NULL,
  `PREZZO` DOUBLE NOT NULL,
FOREIGN KEY (`COMPAGNIA_NOME`) REFERENCES COMPAGNIA(`NOME`)
ON UPDATE CASCADE,
PRIMARY KEY (`COMPAGNIA_NOME`,`TIPOLOGIA`))
ENGINE = InnoDB;

CREATE TABLE `VIAGGIO` (
  `CODVIAGGIO` VARCHAR(45) NOT NULL,
  `COMPAGNIA_NOME` VARCHAR(45) NOT NULL,
  `TRENO_CODTRENO` VARCHAR(45) NOT NULL,
  `ITINERARI_NOME` VARCHAR(45) NOT NULL,
  `MODALITA` VARCHAR(45) NOT NULL,
  `DATA_ORA` DATETIME NOT NULL,
FOREIGN KEY (`COMPAGNIA_NOME`) REFERENCES COMPAGNIA(`NOME`)
ON UPDATE CASCADE,
FOREIGN KEY (`TRENO_CODTRENO`) REFERENCES TRENO(`CODTRENO`)
ON UPDATE CASCADE,
FOREIGN KEY (`ITINERARI_NOME`) REFERENCES ITINERARI(`NOME`)
ON UPDATE NO ACTION,
PRIMARY KEY (`CODVIAGGIO`))
ENGINE = InnoDB;

CREATE TABLE `REGISTRO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CODVIAGGIO` VARCHAR(45) NOT NULL,
  `POSTO` VARCHAR(45) NOT NULL,
  `STAZIONEP` VARCHAR(45) NOT NULL,
  `STAZIONEA` VARCHAR(45) NOT NULL,
FOREIGN KEY (`CODVIAGGIO`) REFERENCES VIAGGIO(`CODVIAGGIO`)
ON UPDATE CASCADE,
PRIMARY KEY (`ID`,`CODVIAGGIO`))
ENGINE = InnoDB;