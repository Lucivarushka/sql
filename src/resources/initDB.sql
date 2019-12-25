CREATE SCHEMA `cinematickets`;

CREATE TABLE `cinematickets`.`viewer`
(
    `idViewer`  INT         NOT NULL AUTO_INCREMENT,
    `Name`      VARCHAR(45) NOT NULL,
    `Birthdate` DATE        NOT NULL,
    PRIMARY KEY (`idViewer`)
);

CREATE TABLE `cinematickets`.`films`
(
    `idFilms` INT         NOT NULL AUTO_INCREMENT,
    `Name`    VARCHAR(45) NOT NULL,
    `Genre`   VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idFilms`)
);

CREATE TABLE `cinematickets`.`tickets`
(
    `idtickets` INT         NOT NULL AUTO_INCREMENT,
    `Date`      DATE        NOT NULL,
    `typeSeat`  VARCHAR(45) NOT NULL,
    `price`     INT         NOT NULL,
    `idFilm`    INT         NOT NULL,
    `idViewer`  INT         NOT NULL,
    PRIMARY KEY (`idtickets`),
    INDEX `idFilms_idx` (`idFilm` ASC) VISIBLE,
    INDEX `idViewer_idx` (`idViewer` ASC) VISIBLE,
    CONSTRAINT `idFilms`
        FOREIGN KEY (`idFilm`)
            REFERENCES `cinematickets`.`films` (`idFilms`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `idViewer`
        FOREIGN KEY (`idViewer`)
            REFERENCES `cinematickets`.`viewer` (`idViewer`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);