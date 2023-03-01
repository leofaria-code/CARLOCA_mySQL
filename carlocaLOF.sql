CREATE DATABASE  IF NOT EXISTS `carloca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carloca`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `T100_Carros`
--

DROP TABLE IF EXISTS T100_Carros;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T100_Carros (
  id_carro int unsigned NOT NULL AUTO_INCREMENT,
  modelo_id int NOT NULL,
  cor_id int unsigned NOT NULL,
  km_atual int NOT NULL,
  disponibilidade enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel',
  PRIMARY KEY (id_carro),
  UNIQUE KEY id_carro_UNIQUE (id_carro),
  KEY Carros_fk_modelo (modelo_id),
  KEY Carros_fk_cor_idx (cor_id),
  CONSTRAINT Carros_fk_cor FOREIGN KEY (cor_id) REFERENCES T130_Cores (id_cor),
  CONSTRAINT Carros_fk_modelo FOREIGN KEY (modelo_id) REFERENCES T120_Modelos (id_modelo)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T100_Carros`
--

INSERT INTO T100_Carros VALUES (1,1,3,33000,'disponivel'),(2,2,1,23560,'disponivel'),(3,3,1,136450,'disponivel'),(4,4,1,92180,'disponivel'),(5,5,2,52310,'disponivel'),(6,6,1,42170,'disponivel'),(7,7,1,63210,'disponivel'),(8,8,2,64970,'disponivel'),(9,9,1,87340,'disponivel'),(10,10,3,62480,'disponivel'),(11,11,2,99680,'disponivel');

--
-- Table structure for table `T110_ModeloCategoria`
--

DROP TABLE IF EXISTS T110_ModeloCategoria;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T110_ModeloCategoria (
  id_Modelo int NOT NULL,
  id_categoria int unsigned NOT NULL,
  PRIMARY KEY (id_Modelo,id_categoria),
  UNIQUE KEY id_Modelo_UNIQUE (id_Modelo),
  KEY fk_categoria_idx (id_categoria),
  CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES T121_Categorias (id_categoria),
  CONSTRAINT fk_modelo FOREIGN KEY (id_Modelo) REFERENCES T120_Modelos (id_modelo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T110_ModeloCategoria`
--

INSERT INTO T110_ModeloCategoria VALUES (1,3),(2,7),(3,10),(4,2),(5,1),(6,2),(7,2),(8,6),(9,3),(10,3),(11,5);

--
-- Table structure for table `T120_Modelos`
--

DROP TABLE IF EXISTS T120_Modelos;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T120_Modelos (
  id_modelo int NOT NULL AUTO_INCREMENT,
  montadora_id int unsigned NOT NULL,
  nome_modelo varchar(50) NOT NULL,
  versao varchar(50) NOT NULL,
  transmissao enum('manual','automatica') NOT NULL DEFAULT 'automatica',
  PRIMARY KEY (id_modelo),
  UNIQUE KEY id_modelo_UNIQUE (id_modelo),
  UNIQUE KEY nome_modelo_UNIQUE (nome_modelo),
  KEY Modelo_fk_montadora_idx (montadora_id),
  CONSTRAINT Modelo_fk_montadora FOREIGN KEY (montadora_id) REFERENCES T122_Montadoras (id_montadora)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T120_Modelos`
--

INSERT INTO T120_Modelos VALUES (1,1,'Nivus','Highline','automatica'),(2,1,'T-Cross','Comfortline','automatica'),(3,1,'Amarok','Highline','automatica'),(4,1,'Fox','Pepper','manual'),(5,3,'Ka','Basico','manual'),(6,2,'Onix','Activ','automatica'),(7,1,'Polo','MSI','manual'),(8,1,'Jetta','Highline','automatica'),(9,1,'Golf','GTI','automatica'),(10,5,'Fit','LX','manual'),(11,4,'Corolla','XEi','automatica');

--
-- Table structure for table `T121_Categorias`
--

DROP TABLE IF EXISTS T121_Categorias;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T121_Categorias (
  id_categoria int unsigned NOT NULL AUTO_INCREMENT,
  nome_categoria varchar(50) NOT NULL,
  cap_passageiros int unsigned NOT NULL,
  cap_bagagem int unsigned NOT NULL,
  ar_condicionado tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (id_categoria),
  UNIQUE KEY id_Categorias_UNIQUE (id_categoria),
  UNIQUE KEY nome_categoria_UNIQUE (nome_categoria)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T121_Categorias`
--

INSERT INTO T121_Categorias VALUES (1,'hatch_economico',4,2,0),(2,'hatch_medio',5,3,1),(3,'hatch_premium',5,5,1),(4,'sedan_economico',5,4,0),(5,'sedan_medio',5,6,1),(6,'sedan_premium',5,7,1),(7,'suv_medio',5,5,1),(8,'suv_familia',7,6,1),(9,'pick-up_trabalho',2,9,0),(10,'pick-up_familia',5,9,1);

--
-- Table structure for table `T122_Montadoras`
--

DROP TABLE IF EXISTS T122_Montadoras;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T122_Montadoras (
  id_montadora int unsigned NOT NULL AUTO_INCREMENT,
  nome_montadora varchar(50) NOT NULL,
  PRIMARY KEY (id_montadora),
  UNIQUE KEY id_montadora_UNIQUE (id_montadora),
  UNIQUE KEY nome_montadora_UNIQUE (nome_montadora)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T122_Montadoras`
--

INSERT INTO T122_Montadoras VALUES (2,'Chevrolet'),(3,'Ford'),(5,'Honda'),(4,'Toyota'),(1,'Volkswagen');

--
-- Table structure for table `T130_Cores`
--

DROP TABLE IF EXISTS T130_Cores;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T130_Cores (
  id_cor int unsigned NOT NULL AUTO_INCREMENT,
  nome_cor varchar(20) NOT NULL,
  PRIMARY KEY (id_cor),
  UNIQUE KEY id_cor_UNIQUE (id_cor),
  UNIQUE KEY nome_cor_UNIQUE (nome_cor)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T130_Cores`
--

INSERT INTO T130_Cores VALUES (1,'Branco'),(3,'Prata'),(2,'Preto');

--
-- Table structure for table `T200_Clientes`
--

DROP TABLE IF EXISTS T200_Clientes;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T200_Clientes (
  id_cliente int unsigned NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  cpf varchar(14) NOT NULL,
  endereco_id int unsigned NOT NULL,
  telefone varchar(20) NOT NULL,
  email varchar(50) NOT NULL,
  status_cliente enum('com_carro','sem_carro') NOT NULL DEFAULT 'sem_carro',
  PRIMARY KEY (id_cliente),
  UNIQUE KEY id_cliente_UNIQUE (id_cliente),
  KEY Cliente_fk_endereco_idx (endereco_id),
  CONSTRAINT Cliente_fk_endereco FOREIGN KEY (endereco_id) REFERENCES T800_Enderecos (id_Enderecos)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T200_Clientes`
--

INSERT INTO T200_Clientes VALUES (1,'Leonardo Oliveira Faria','012345678-90',4,'(31)99503-8567','leofaria.email@gmail.com','sem_carro');

--
-- Table structure for table `T300_Historico_locacao`
--

DROP TABLE IF EXISTS T300_Historico_locacao;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T300_Historico_locacao (
  id_historico int NOT NULL,
  cliente_id_historico int unsigned NOT NULL,
  carro_id_historico int unsigned NOT NULL,
  data_locacao datetime NOT NULL,
  km_inicial_hist int unsigned NOT NULL,
  unidade_locacao_id int unsigned NOT NULL,
  data_devolucao datetime DEFAULT NULL,
  km_final_hist int unsigned DEFAULT NULL,
  unidade_devolucao_id int unsigned DEFAULT NULL,
  locacao_status enum('finalizada','em_curso') NOT NULL DEFAULT 'em_curso',
  PRIMARY KEY (id_historico),
  KEY Historico_fk_cliente_idx (cliente_id_historico),
  KEY Historico_fk_carro_idx (carro_id_historico),
  KEY Historico_fk_retirada_idx (unidade_locacao_id),
  KEY Historico_fk_devolucao_idx (unidade_devolucao_id),
  CONSTRAINT Historico_fk_carro FOREIGN KEY (carro_id_historico) REFERENCES T100_Carros (id_carro),
  CONSTRAINT Historico_fk_cliente FOREIGN KEY (cliente_id_historico) REFERENCES T200_Clientes (id_cliente),
  CONSTRAINT Historico_fk_devolucao FOREIGN KEY (unidade_devolucao_id) REFERENCES T900_Unidades_franquia (id_unidade),
  CONSTRAINT Historico_fk_retirada FOREIGN KEY (unidade_locacao_id) REFERENCES T900_Unidades_franquia (id_unidade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T300_Historico_locacao`
--

INSERT INTO T300_Historico_locacao VALUES (1,1,1,'2023-03-01 02:30:45',26910,1,'2023-03-01 02:31:29',33000,2,'finalizada');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@`%`*/ /*!50003 TRIGGER finaliza BEFORE UPDATE ON T300_Historico_locacao FOR EACH ROW BEGIN
    SET 
		NEW.locacao_status = 'finalizada',
        NEW.data_devolucao = CURRENT_TIMESTAMP;
    UPDATE `T100_Carros`
		SET 
			km_atual = NEW.km_final_hist
        WHERE id_carro = NEW.carro_id_historico;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@`%`*/ /*!50003 TRIGGER libera_carroEcliente AFTER UPDATE ON T300_Historico_locacao FOR EACH ROW BEGIN
	UPDATE `T100_Carros`
		SET 
			disponibilidade = 'disponivel'
        WHERE id_carro = NEW.carro_id_historico;
	UPDATE `T200_Clientes`
		SET status_cliente = 'sem_carro'
        WHERE id_cliente = NEW.cliente_id_historico;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `T310_Retirada_Veiculo`
--

DROP TABLE IF EXISTS T310_Retirada_Veiculo;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T310_Retirada_Veiculo (
  id_contrato_inicio int unsigned NOT NULL AUTO_INCREMENT,
  cliente_id_cont int unsigned NOT NULL,
  carro_id_cont int unsigned NOT NULL,
  km_inicial int unsigned DEFAULT NULL,
  datahora_retirada datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  local_retirada_id int unsigned NOT NULL,
  PRIMARY KEY (id_contrato_inicio),
  UNIQUE KEY idRetirada_Veiculo_UNIQUE (id_contrato_inicio),
  KEY Retirada_fk_cliente_idx (cliente_id_cont),
  KEY Retirada_fk_carro_idx (carro_id_cont),
  KEY Retirada_fk_local_idx (local_retirada_id) /*!80000 INVISIBLE */,
  CONSTRAINT Retirada_fk_carro FOREIGN KEY (carro_id_cont) REFERENCES T100_Carros (id_carro),
  CONSTRAINT Retirada_fk_cliente FOREIGN KEY (cliente_id_cont) REFERENCES T200_Clientes (id_cliente),
  CONSTRAINT Retirada_fk_local FOREIGN KEY (local_retirada_id) REFERENCES T900_Unidades_franquia (id_unidade)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T310_Retirada_Veiculo`
--

INSERT INTO T310_Retirada_Veiculo VALUES (1,1,1,26910,'2023-03-01 02:30:45',1);
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@`%`*/ /*!50003 TRIGGER inicia_locacao BEFORE INSERT ON T310_Retirada_Veiculo FOR EACH ROW BEGIN
	SET NEW.km_inicial = 
		(SELECT km_atual FROM `T100_Carros` WHERE id_carro = NEW.carro_id_cont);
	UPDATE `T100_Carros`
		SET disponibilidade = 'indisponivel'
        WHERE id_carro = NEW.carro_id_cont;
	UPDATE `T200_Clientes`
		SET status_cliente = 'com_carro'
        WHERE id_cliente = NEW.cliente_id_cont;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=root@`%`*/ /*!50003 TRIGGER salva_historico AFTER INSERT ON T310_Retirada_Veiculo FOR EACH ROW BEGIN
	INSERT INTO `T300_Historico_locacao`
		(id_historico, 
			cliente_id_historico, 
			carro_id_historico, 
			data_locacao, 
			km_inicial_hist,
            unidade_locacao_id)
    VALUES 
		(NEW.id_contrato_inicio, 
			NEW.cliente_id_cont, 
            NEW.carro_id_cont,
            NEW.datahora_retirada,
			NEW.km_inicial,
            NEW.local_retirada_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `T800_Enderecos`
--

DROP TABLE IF EXISTS T800_Enderecos;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T800_Enderecos (
  id_Enderecos int unsigned NOT NULL AUTO_INCREMENT,
  cep varchar(9) NOT NULL DEFAULT '00000-000',
  logradouro varchar(255) NOT NULL,
  num varchar(7) NOT NULL,
  compl varchar(20) DEFAULT NULL,
  cidade varchar(45) NOT NULL,
  estado_sigla varchar(2) NOT NULL,
  pais_sigla varchar(3) NOT NULL DEFAULT 'BRA',
  PRIMARY KEY (id_Enderecos),
  UNIQUE KEY idEnderecos_UNIQUE (id_Enderecos)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T800_Enderecos`
--

INSERT INTO T800_Enderecos VALUES (1,'12345-678','Rua ABC','111',NULL,'Belo_Horizonte','MG','BRA'),(2,'23456-789','Rua BCD','222',NULL,'Sao_Paulo','SP','BRA'),(3,'34567-890','Rua CDE','333',NULL,'Rio_de_Janeiro','RJ','BRA'),(4,'35501-284','Rua Afranio Peixoto','1901',NULL,'Divinopolis','MG','BRA'),(5,'30350-540','Av. Raja Gabáglia','1400',NULL,'Belo_Horizonte','MG','BRA'),(6,'01415-003','R. Bela Cintra','755',NULL,'Sao_Paulo','SP','BRA');

--
-- Table structure for table `T900_Unidades_franquia`
--

DROP TABLE IF EXISTS T900_Unidades_franquia;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE T900_Unidades_franquia (
  id_unidade int unsigned NOT NULL,
  nome_unidade varchar(100) NOT NULL,
  endereco_id int unsigned NOT NULL,
  telefone varchar(14) NOT NULL DEFAULT '(DD)12345-6789',
  email varchar(50) NOT NULL,
  PRIMARY KEY (id_unidade),
  UNIQUE KEY email_UNIQUE (email),
  UNIQUE KEY id_unidade_UNIQUE (id_unidade),
  KEY Franquia_pk_endereco_idx (endereco_id),
  CONSTRAINT Franquia_pk_endereco FOREIGN KEY (endereco_id) REFERENCES T800_Enderecos (id_Enderecos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T900_Unidades_franquia`
--

INSERT INTO T900_Unidades_franquia VALUES (1,'Loja_BH',1,'(31)98765-1111','carloca_bh@carloca.com'),(2,'Loja_SP',2,'(11)98765-2222','carloca_sp@carloca.com'),(3,'Loja_RJ',3,'(21)98765-3333','carloca_rj@carloca.com');

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
