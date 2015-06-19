-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema centolla_global
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema centolla_global
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `centolla_global` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `centolla_global` ;

-- -----------------------------------------------------
-- Table `centolla_global`.`mareas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`mareas` (
  `id` INT(11) NOT NULL,
  `cod_marea` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `marea_inidep` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `nombre_buque` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `capitan` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `oficial` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `observador` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `fecha_zarpada` DATE NULL DEFAULT NULL,
  `fecha_arribo` DATE NULL DEFAULT NULL,
  `peso_caja_producto` DECIMAL(9,3) NULL DEFAULT NULL,
  `peso_canasto` DECIMAL(9,3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_marea` (`cod_marea` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `centolla_global`.`lances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`lances` (
  `id` INT(11) NOT NULL,
  `marea_id` INT(11) NOT NULL,
  `nro_registro` INT(11) NOT NULL,
  `prospeccion` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT '0',
  `investigacion` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT '0',
  `cant_trampas_tot` INT(11) NULL DEFAULT NULL,
  `cant_trampas_sin_aro` INT(11) NULL DEFAULT NULL,
  `cant_trampas_3_aros` INT(11) NULL DEFAULT NULL,
  `cant_trampas_otras` INT(11) NULL DEFAULT NULL,
  `cant_trampas_con_fallo` INT(11) NULL DEFAULT NULL,
  `distancia_entre_trampas` INT(11) NULL DEFAULT NULL,
  `carnada` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `kg_carnada` DECIMAL(5,2) NULL DEFAULT NULL,
  `fecha_hora_inicio_calado` DATETIME NOT NULL,
  `lat_ini_calado` DECIMAL(10,4) NOT NULL,
  `long_ini_calado` DECIMAL(10,4) NOT NULL,
  `profundidad_ini_calado` INT(11) NULL DEFAULT NULL,
  `rumbo_calado` INT(11) NULL DEFAULT NULL,
  `fecha_hora_fin_calado` DATETIME NOT NULL,
  `lat_fin_calado` DECIMAL(10,4) NOT NULL,
  `long_fin_calado` DECIMAL(10,4) NOT NULL,
  `profundidad_fin_calado` INT(11) NULL DEFAULT NULL,
  `fecha_hora_inicio_virada` DATETIME NULL DEFAULT NULL,
  `lat_ini_virada` DECIMAL(10,4) NULL DEFAULT NULL,
  `long_ini_virada` DECIMAL(10,4) NULL DEFAULT NULL,
  `profundidad_ini_virada` INT(11) NULL DEFAULT NULL,
  `fecha_hora_fin_virada` DATETIME NULL DEFAULT NULL,
  `lat_fin_virada` DECIMAL(10,4) NULL DEFAULT NULL,
  `long_fin_virada` DECIMAL(10,4) NULL DEFAULT NULL,
  `profundidad_fin_virada` INT(11) NULL DEFAULT NULL,
  `dias_pesca` DECIMAL(5,2) NULL DEFAULT NULL,
  `porcent_trampas_observadas` DECIMAL(5,2) NULL DEFAULT NULL,
  `captura_total` INT(11) NULL DEFAULT NULL,
  `captura_comercial` INT(11) NULL DEFAULT NULL,
  `captura_arania` INT(11) NULL DEFAULT NULL,
  `captura_prom_trampa` DECIMAL(5,2) NULL DEFAULT NULL,
  `comerciales_prom_trampa` DECIMAL(5,2) NULL DEFAULT NULL,
  `captura_prom_sin_aros` DECIMAL(5,2) NULL DEFAULT NULL,
  `captura_prom_3_aros` DECIMAL(5,2) NULL DEFAULT NULL,
  `canastos_procesados` INT(11) NULL DEFAULT NULL,
  `con_muestra` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `comentarios` VARCHAR(256) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_marea_lance` (`marea_id` ASC, `nro_registro` ASC),
  INDEX `fk_lances_mareas_idx` (`marea_id` ASC),
  CONSTRAINT `fk_lances_mareas`
    FOREIGN KEY (`marea_id`)
    REFERENCES `centolla_global`.`mareas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `centolla_global`.`capturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`capturas` (
  `id` INT(11) NOT NULL,
  `lance_id` INT(11) NOT NULL,
  `cant_trampas` INT(11) NOT NULL,
  `tipo_trampa` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `estado_trampa` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `especie1` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `tot_especie1` INT(11) NULL DEFAULT NULL,
  `comerc_especie1` INT(11) NULL DEFAULT NULL,
  `especie2` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `tot_especie2` INT(11) NULL DEFAULT NULL,
  `comerc_especie2` INT(11) NULL DEFAULT NULL,
  `especie3` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `tot_especie3` INT(11) NULL DEFAULT NULL,
  `comerc_especie3` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_capturas_lances1_idx` (`lance_id` ASC),
  CONSTRAINT `fk_capturas_lances1`
    FOREIGN KEY (`lance_id`)
    REFERENCES `centolla_global`.`lances` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `centolla_global`.`factores_conversion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`factores_conversion` (
  `id` INT(11) NOT NULL,
  `marea_id` INT(11) NOT NULL,
  `peso_entero` DECIMAL(9,3) NOT NULL,
  `pinza_chica_crudo` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_grande_crudo` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_chica_cocido` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_grande_cocido` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_chica_congelado` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_grande_congelado` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_chica_descongelado` DECIMAL(9,3) NULL DEFAULT NULL,
  `pinza_grande_descongelado` DECIMAL(9,3) NULL DEFAULT NULL,
  `comentarios` VARCHAR(256) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_factores_conversion_mareas1_idx` (`marea_id` ASC),
  CONSTRAINT `fk_factores_conversion_mareas1`
    FOREIGN KEY (`marea_id`)
    REFERENCES `centolla_global`.`mareas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `centolla_global`.`muestras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`muestras` (
  `id` INT(11) NOT NULL,
  `lance_id` INT(11) NOT NULL,
  `tipo_muestra` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `tipo_trampa` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `especie` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `nro_ejemplar` INT(11) NOT NULL,
  `largo` INT(11) NOT NULL,
  `sexo` INT(11) NOT NULL,
  `codigo_caparazon` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `codigo_huevos` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `porcentaje_huevos` INT(11) NULL DEFAULT NULL,
  `peso` DECIMAL(9,3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_muestras_lances1_idx` (`lance_id` ASC),
  CONSTRAINT `fk_muestras_lances1`
    FOREIGN KEY (`lance_id`)
    REFERENCES `centolla_global`.`lances` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `centolla_global`.`produccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `centolla_global`.`produccion` (
  `id` INT(11) NOT NULL,
  `marea_id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `orden` INT(11) NOT NULL,
  `codigo_producto` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `cant_cajas` INT(11) NULL DEFAULT NULL,
  `kilos` DECIMAL(9,3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uk_prod_fecha` (`marea_id` ASC, `fecha` ASC, `codigo_producto` ASC),
  INDEX `fk_produccion_mareas1_idx` (`marea_id` ASC),
  CONSTRAINT `fk_produccion_mareas1`
    FOREIGN KEY (`marea_id`)
    REFERENCES `centolla_global`.`mareas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
