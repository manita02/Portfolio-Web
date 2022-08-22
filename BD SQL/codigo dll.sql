-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema backendaj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema backendaj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `backendaj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `backendaj` ;

-- -----------------------------------------------------
-- Table `backendaj`.`banner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`banner` (
  `id_banner` INT NOT NULL AUTO_INCREMENT,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `titulo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_banner`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`educacion` (
  `id_educacion` INT NOT NULL AUTO_INCREMENT,
  `anocomienzo` INT NOT NULL,
  `descripcione` VARCHAR(255) NULL DEFAULT NULL,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `nombree` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_educacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`experiencia` (
  `id_experiencia` INT NOT NULL AUTO_INCREMENT,
  `anocomienzo` INT NOT NULL,
  `descripcione` VARCHAR(255) NULL DEFAULT NULL,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `nombree` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_experiencia`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`habilidades` (
  `id_habilidades` INT NOT NULL AUTO_INCREMENT,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `nombreh` VARCHAR(255) NULL DEFAULT NULL,
  `porcentaje` INT NOT NULL,
  PRIMARY KEY (`id_habilidades`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`persona` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `acerca_de` VARCHAR(1500) NULL DEFAULT NULL,
  `apellido` VARCHAR(255) NULL DEFAULT NULL,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `profesion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`proyecto` (
  `id_proyecto` INT NOT NULL AUTO_INCREMENT,
  `anocomienzo` INT NOT NULL,
  `descripcione` VARCHAR(800) NULL DEFAULT NULL,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `link` VARCHAR(1500) NULL DEFAULT NULL,
  `nombree` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`red_social` (
  `id_red` INT NOT NULL AUTO_INCREMENT,
  `img` VARCHAR(1500) NULL DEFAULT NULL,
  `link` VARCHAR(1500) NULL DEFAULT NULL,
  `nombre_reds` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_red`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(255) NOT NULL,
  `nombre_usuario` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `id_banner` INT NULL DEFAULT NULL,
  `id_educacion` INT NULL DEFAULT NULL,
  `id_experiencia` INT NULL DEFAULT NULL,
  `id_habilidades` INT NULL DEFAULT NULL,
  `id_persona` INT NULL DEFAULT NULL,
  `id_proyecto` INT NULL DEFAULT NULL,
  `id_red` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `UK_puhr3k3l7bj71hb7hk7ktpxn0` (`nombre_usuario` ASC) VISIBLE,
  INDEX `FKgccnabixau0pw1n8hmxsa3cq4` (`id_banner` ASC) VISIBLE,
  INDEX `FKjv3tu6vgm8jv3u9pxsf7mmqrb` (`id_educacion` ASC) VISIBLE,
  INDEX `FK1aagjf104ugwrgqhu79allh5k` (`id_experiencia` ASC) VISIBLE,
  INDEX `FK1q7ddprmvw4pd00t7icdj9wc7` (`id_habilidades` ASC) VISIBLE,
  INDEX `FKagix3q8yqktlyj3yp1sn0mcd9` (`id_persona` ASC) VISIBLE,
  INDEX `FK1ktc8j90plc67ljqg3j2n0sve` (`id_proyecto` ASC) VISIBLE,
  INDEX `FK9royqn2jl2p76ynsbbrysmxcl` (`id_red` ASC) VISIBLE,
  CONSTRAINT `FK1aagjf104ugwrgqhu79allh5k`
    FOREIGN KEY (`id_experiencia`)
    REFERENCES `backendaj`.`experiencia` (`id_experiencia`),
  CONSTRAINT `FK1ktc8j90plc67ljqg3j2n0sve`
    FOREIGN KEY (`id_proyecto`)
    REFERENCES `backendaj`.`proyecto` (`id_proyecto`),
  CONSTRAINT `FK1q7ddprmvw4pd00t7icdj9wc7`
    FOREIGN KEY (`id_habilidades`)
    REFERENCES `backendaj`.`habilidades` (`id_habilidades`),
  CONSTRAINT `FK9royqn2jl2p76ynsbbrysmxcl`
    FOREIGN KEY (`id_red`)
    REFERENCES `backendaj`.`red_social` (`id_red`),
  CONSTRAINT `FKagix3q8yqktlyj3yp1sn0mcd9`
    FOREIGN KEY (`id_persona`)
    REFERENCES `backendaj`.`persona` (`id_persona`),
  CONSTRAINT `FKgccnabixau0pw1n8hmxsa3cq4`
    FOREIGN KEY (`id_banner`)
    REFERENCES `backendaj`.`banner` (`id_banner`),
  CONSTRAINT `FKjv3tu6vgm8jv3u9pxsf7mmqrb`
    FOREIGN KEY (`id_educacion`)
    REFERENCES `backendaj`.`educacion` (`id_educacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `backendaj`.`usuario_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `backendaj`.`usuario_rol` (
  `usuario_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `rol_id`),
  INDEX `FK610kvhkwcqk2pxeewur4l7bd1` (`rol_id` ASC) VISIBLE,
  CONSTRAINT `FK610kvhkwcqk2pxeewur4l7bd1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `backendaj`.`rol` (`id`),
  CONSTRAINT `FKbyfgloj439r9wr9smrms9u33r`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `backendaj`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
