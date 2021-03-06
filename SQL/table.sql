-- -----------------------------------------------------
-- Table `movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `year` SMALLINT(4) UNSIGNED NULL,
  `released` DATE NULL,
  `runtime` SMALLINT(3) UNSIGNED NULL,
  `imdbID` CHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `imdbID_UNIQUE` (`imdbID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `actors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `directors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;i


-- -----------------------------------------------------
-- Table `awards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `awards` (
  `movie_id` INT NOT NULL,
  `oscars` TINYINT(3) UNSIGNED NULL,
  `wins` SMALLINT(4) UNSIGNED NULL,
  `nominations` SMALLINT(4) UNSIGNED NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `awards_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `languages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `language_UNIQUE` (`language` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `writers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `writers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `countries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `country_UNIQUE` (`country` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stats` (
  `movie_id` INT NOT NULL,
  `imdb_rating` FLOAT(2,1) UNSIGNED NULL,
  `imdb_metascore` TINYINT UNSIGNED NULL,
  `imdb_votes` INT UNSIGNED NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `stats_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_cast` (
  `movie_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `actor_id`),
  INDEX `actor_id_idx` (`actor_id` ASC),
  CONSTRAINT `cast_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cast_actor_id`
    FOREIGN KEY (`actor_id`)
    REFERENCES `actors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`genre` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_id`),
  INDEX `fk_genre_id_idx` (`genre_id` ASC),
  CONSTRAINT `genre_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_language` (
  `movie_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `language_id`),
  INDEX `fk_language_id_idx` (`language_id` ASC),
  CONSTRAINT `lan_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `lan_language_id`
    FOREIGN KEY (`language_id`)
    REFERENCES `languages` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_country` (
  `movie_id` INT NOT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `country_id`),
  INDEX `fk_country_id_idx` (`country_id` ASC),
  CONSTRAINT `con_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `con_country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_writer` (
  `movie_id` INT NOT NULL,
  `writer_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `writer_id`),
  INDEX `fk_writer_id_idx` (`writer_id` ASC),
  CONSTRAINT `wrt_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `wrt_writer_id`
    FOREIGN KEY (`writer_id`)
    REFERENCES `writers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_director` (
  `movie_id` INT NOT NULL,
  `director_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `director_id`),
  INDEX `fk_director_id_idx` (`director_id` ASC),
  CONSTRAINT `dir_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dir_director_id`
    FOREIGN KEY (`director_id`)
    REFERENCES `directors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `posters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `posters` (
  `movie_id` INT NOT NULL,
  `url` VARCHAR(128) NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `poster_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `plots` (
  `movie_id` INT NOT NULL,
  `plot` VARCHAR(400) NULL,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `plot_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
