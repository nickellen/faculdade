-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: teste
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `controle_de_acesso`
--

DROP TABLE IF EXISTS `controle_de_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controle_de_acesso` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_conexao` int unsigned NOT NULL DEFAULT '0',
  `user` varchar(64) NOT NULL,
  `login_ts` timestamp NULL DEFAULT NULL,
  `logout_ts` timestamp NULL DEFAULT NULL,
  `qtd_select` int unsigned NOT NULL DEFAULT '0',
  `qtd_insert` int DEFAULT '0',
  `qtd_delete` int DEFAULT '0',
  `qtd_update` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle_de_acesso`
--

LOCK TABLES `controle_de_acesso` WRITE;
/*!40000 ALTER TABLE `controle_de_acesso` DISABLE KEYS */;
INSERT INTO `controle_de_acesso` VALUES (1,68,'fernanda@localhost','2023-12-04 15:47:52','2023-12-04 15:47:54',1,0,0,0),(2,73,'fernanda@localhost','2023-12-04 16:01:00','2023-12-04 16:01:05',0,0,0,0),(3,77,'monique@localhost','2023-12-04 16:01:54',NULL,0,0,0,0),(4,78,'monique@localhost','2023-12-04 16:05:52',NULL,0,0,0,0),(5,79,'monique@localhost','2023-12-04 16:06:53','2023-12-04 16:07:06',0,0,0,0),(6,80,'monique@localhost','2023-12-04 16:07:19','2023-12-04 16:07:23',0,0,0,0),(7,82,'monique@localhost','2023-12-04 16:08:51','2023-12-04 16:09:10',0,0,0,0),(8,83,'monique@localhost','2023-12-04 16:09:18',NULL,0,0,0,0),(9,84,'monique@localhost','2023-12-04 16:09:43','2023-12-04 16:09:48',1,0,0,0),(11,797,'fernanda@localhost','2023-12-05 21:43:46','2023-12-05 21:43:59',1,0,0,0),(12,816,'monique@localhost','2023-12-05 21:45:07',NULL,0,0,0,0),(13,824,'monique@localhost','2023-12-05 21:45:39','2023-12-05 21:45:42',1,0,0,0),(14,907,'fernanda@localhost','2023-12-05 21:52:29','2023-12-05 21:55:11',8,2,0,4),(15,978,'fernanda@localhost','2023-12-05 21:58:09','2023-12-05 21:59:39',5,2,0,2),(16,1131,'fernanda@localhost','2023-12-05 22:10:40',NULL,0,1,0,0),(17,1594,'fernanda@localhost','2023-12-05 22:49:01',NULL,0,0,0,0),(18,1601,'fernanda@localhost','2023-12-05 22:49:31','2023-12-05 22:49:46',1,2,0,1),(19,1705,'fernanda@localhost','2023-12-05 22:58:02',NULL,0,1,0,0),(20,1725,'fernanda@localhost','2023-12-05 22:59:36','2023-12-05 23:00:12',1,2,0,1),(21,1773,'fernanda@localhost','2023-12-05 23:03:26',NULL,0,1,0,0),(22,1832,'fernanda@localhost','2023-12-05 23:08:17',NULL,0,1,0,0),(23,1873,'fernanda@localhost','2023-12-05 23:11:36',NULL,0,1,0,0),(24,1903,'fernanda@localhost','2023-12-05 23:14:01',NULL,0,0,0,0),(25,1912,'fernanda@localhost','2023-12-05 23:14:43','2023-12-05 23:15:05',1,2,0,1),(26,1932,'fernanda@localhost','2023-12-05 23:16:13','2023-12-05 23:16:32',0,1,0,0),(27,1943,'fernanda@localhost','2023-12-05 23:16:55',NULL,0,0,0,0),(28,1950,'fernanda@localhost','2023-12-05 23:17:27','2023-12-05 23:17:37',2,2,1,1),(29,1965,'fernanda@localhost','2023-12-05 23:18:32','2023-12-05 23:18:51',0,0,1,0),(30,1973,'fernanda@localhost','2023-12-05 23:19:03','2023-12-05 23:19:23',4,2,0,2),(32,2020,'fernanda@localhost','2023-12-05 23:22:36','2023-12-05 23:22:44',0,0,0,1),(33,2026,'fernanda@localhost','2023-12-05 23:22:59','2023-12-05 23:23:14',0,0,1,0),(34,2041,'fernanda@localhost','2023-12-05 23:23:52','2023-12-05 23:23:57',2,1,0,0),(35,2062,'fernanda@localhost','2023-12-05 23:25:27','2023-12-05 23:25:31',2,1,0,0),(36,2099,'fernanda@localhost','2023-12-05 23:28:23','2023-12-05 23:28:26',1,1,0,0),(37,2114,'fernanda@localhost','2023-12-05 23:29:24','2023-12-05 23:29:30',0,1,0,0),(40,268,'fernanda@localhost','2023-12-06 16:37:15',NULL,0,0,0,0),(41,274,'fernanda@localhost','2023-12-06 16:37:40',NULL,0,0,0,0),(42,281,'fernanda@localhost','2023-12-06 16:38:13','2023-12-06 16:38:38',0,1,0,1),(43,314,'fernanda@localhost','2023-12-06 16:40:44','2023-12-06 16:41:19',0,2,0,1),(44,347,'fernanda@localhost','2023-12-06 16:43:22','2023-12-06 16:43:56',0,2,0,1),(46,445,'fernanda@localhost','2023-12-06 16:51:13',NULL,0,0,0,0),(47,454,'fernanda@localhost','2023-12-06 16:51:51','2023-12-06 16:52:14',0,2,0,0),(48,468,'fernanda@localhost','2023-12-06 16:52:50','2023-12-06 16:53:08',0,1,0,0),(49,476,'fernanda@localhost','2023-12-06 16:53:21','2023-12-06 16:53:28',3,0,0,0),(50,482,'fernanda@localhost','2023-12-06 16:53:39','2023-12-06 16:54:35',1,0,1,0),(51,528,'fernanda@localhost','2023-12-06 16:57:23','2023-12-06 16:58:09',0,2,0,0),(52,543,'fernanda@localhost','2023-12-06 16:58:25','2023-12-06 16:58:55',3,0,1,1),(53,555,'fernanda@localhost','2023-12-06 16:59:19','2023-12-06 16:59:59',4,1,0,0),(59,639,'fernanda@localhost','2023-12-06 17:05:42','2023-12-06 17:05:50',1,0,0,0);
/*!40000 ALTER TABLE `controle_de_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `isbn` char(13) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `autor` varchar(256) NOT NULL,
  `genero` varchar(256) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES ('1111111111111','Duna','Fernanda Martins','feminino'),('1118884695276','Pablito','Pablo','Biografias'),('1777774446952','Linguiça','Sr linguiça','comida'),('1777777775869','O menino','Tolkien','romance'),('1788175264826','O passaro','Antonia','ficção'),('1788847569222','O camarao','Sr Camarao','camarao'),('1875558926847','Guia do mochileiro das Galáxias','Douglas Adams','Viagens intergalácticas'),('2222222222222','Grafos','Rodacki','grafos'),('4120556016951','The help','Kathryn Stockett','Drama'),('4150664086539','The Secret Life of Bees','Sue Monk Kidd','Drama'),('4160813085726','The Lovely Bones','Alice Sebold','Drama'),('4170718079189','Midnight in the Garden of Good and Evil','John Berendt','Não Ficção'),('4180816035020','East of Eden','John Steinbeck','Drama'),('4190441015375','The Name of the Wind','Patrick Rothfuss','Fantasia'),('4200786926740','Sapiens: A Brief History of Humankind','Yuval Noah Harari','História'),('4210674165071','The Great Gatsby','F. Scott Fitzgerald','Ficção'),('4221101475179','The Girl on the Train','Paula Hawkins','Suspense'),('4230385495509','Memoirs of a Geisha','Arthur Golden','Romance Histórico'),('4240385538685','Gone Girl','Gillian Flynn','Suspense'),('4250525559731','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('4260441172711','The Stand','Stephen King','Ficção Pós-Apocalíptica'),('4270385514239','A Clash of Kings','George R.R. Martin','Fantasia'),('4280345539875','The Goldfinch','Donna Tartt','Ficção'),('4291400069598','The Help','Kathryn Stockett','Drama'),('4300316015846','The Girl with the Dragon Tattoo','Stieg Larsson','Mistério'),('4310143110342','The Help','Kathryn Stockett','Drama'),('4320062255657','The Silent Wife','A.S.A. Harrison','Suspense'),('4330451203594','The Red Tent','Anita Diamant','Ficção Histórica'),('4340375727342','The Devil in the White City','Erik Larson','História'),('4350385315546','The Five People You Meet in Heaven','Mitch Albom','Ficção'),('4360451169533','Jurassic Park','Michael Crichton','Ficção Científica'),('4371400033419','The Da Vinci Code','Dan Brown','Mistério'),('4380553384775','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('4390452284249','The Glass Castle','Jeanette Walls','Biografia'),('4400307592739','A Dance with Dragons','George R.R. Martin','Fantasia'),('4410452286869','Freakonomics','Steven D. Levitt','Economia'),('4420812988407','The Girl on the Train','Paula Hawkins','Suspense'),('4431400067949','The Secret Life of Bees','Sue Monk Kidd','Drama'),('4440142000664','The Lovely Bones','Alice Sebold','Drama'),('4450679745589','Midnight in the Garden of Good and Evil','John Berendt','Não Ficção'),('4460451524936','East of Eden','John Steinbeck','Drama'),('4470441013594','The Name of the Wind','Patrick Rothfuss','Fantasia'),('4480316769487','Sapiens: A Brief History of Humankind','Yuval Noah Harari','História'),('4491400034773','The Great Gatsby','F. Scott Fitzgerald','Ficção'),('4500812988408','The Girl on the Train','Paula Hawkins','Suspense'),('4510060935468','Memoirs of a Geisha','Arthur Golden','Romance Histórico'),('4520062315008','Gone Girl','Gillian Flynn','Suspense'),('4530316491329','Where the Crawdads Sing','Delia Owens','Mistério'),('4540307346628','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('4550441172712','The Stand','Stephen King','Ficção Pós-Apocalíptica'),('4560385514232','A Clash of Kings','George R.R. Martin','Fantasia'),('4570345539879','The Goldfinch','Donna Tartt','Ficção'),('4581400069591','The Help','Kathryn Stockett','Drama'),('4590316015845','The Girl with the Dragon Tattoo','Stieg Larsson','Mistério'),('4600143110343','The Help','Kathryn Stockett','Drama'),('4610062255656','The Silent Wife','A.S.A. Harrison','Suspense'),('7474747474747','o LIVRO','MARCIA','fantasia'),('7777777222000','Uma nova chance','Carn','Superação'),('7778477785777','MEUBD','LEUNCE','Documentos historicos'),('7888512699245','A viagem','Poliana','fantasia'),('7888594268325','As memoria de uma vida','Amanda','Real'),('8874958126520','Dia e noite','Noturno','Biografia'),('8887774449995','O pintassilgo','Larissa','Drama'),('8888888888888','A cobra','Eleanor','fantasia'),('9780060548785','Life of Pi','Yann Martel','Aventura'),('9780060850524','The Catcher in the Rye','J.D. Salinger','Romance'),('9780060935467','Memoirs of a Geisha','Arthur Golden','Romance Histórico'),('9780061120084','To Kill a Mockingbird','Harper Lee','Romance'),('9780061122415','The Alchemist','Paulo Coelho','Ficção'),('9780061950728','The Hunger Games','Suzanne Collins','Ficção Científica'),('9780062255655','The Silent Wife','A.S.A. Harrison','Suspense'),('9780062315007','Gone Girl','Gillian Flynn','Suspense'),('9780062316097','The Fault in Our Stars','John Green','Romance'),('9780062457738','The Subtle Art of Not Giving a F*ck','Mark Manson','Autoajuda'),('9780137135266','Clean Code','Robert C. Martin','Programação'),('9780140283334','1984','George Orwell','Ficção Científica'),('9780141189574','One Flew Over the Cuckoo\'s Nest','Ken Kesey','Ficção'),('9780142000663','The Lovely Bones','Alice Sebold','Drama'),('9780143038412','The Da Vinci Code','Dan Brown','Mistério'),('9780143110342','The Help','Kathryn Stockett','Drama'),('9780143110632','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('9780307277679','The Kite Runner','Khaled Hosseini','Ficção Histórica'),('9780307346627','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('9780307454546','Water for Elephants','Sara Gruen','Romance'),('9780307474278','The Help','Kathryn Stockett','Drama'),('9780307592736','A Dance with Dragons','George R.R. Martin','Fantasia'),('9780307887436','The Night Circus','Erin Morgenstern','Fantasia'),('9780316015844','The Girl with the Dragon Tattoo','Stieg Larsson','Mistério'),('9780316330318','Ready Player One','Ernest Cline','Ficção Científica'),('9780316416896','The Martian','Andy Weir','Ficção Científica'),('9780316491329','Where the Crawdads Sing','Delia Owens','Mistério'),('9780316769486','Sapiens: A Brief History of Humankind','Yuval Noah Harari','História'),('9780345538376','The Help','Kathryn Stockett','Drama'),('9780345539878','The Goldfinch','Donna Tartt','Ficção'),('9780375727344','The Devil in the White City','Erik Larson','História'),('9780385311390','Jurassic Park','Michael Crichton','Ficção Científica'),('9780385315541','The Five People You Meet in Heaven','Mitch Albom','Ficção'),('9780385504201','A Game of Thrones','George R.R. Martin','Fantasia'),('9780385514231','A Clash of Kings','George R.R. Martin','Fantasia'),('9780441013593','The Name of the Wind','Patrick Rothfuss','Fantasia'),('9780441172719','The Stand','Stephen King','Ficção Pós-Apocalíptica'),('9780451169532','Jurassic Park','Michael Crichton','Ficção Científica'),('9780451191144','One Hundred Years of Solitude','Gabriel García Márquez','Realismo Mágico'),('9780451203592','The Red Tent','Anita Diamant','Ficção Histórica'),('9780451457998','Neuromancer','William Gibson','Ficção Científica'),('9780451524935','East of Eden','John Steinbeck','Drama'),('9780451526342','Brave New World','Aldous Huxley','Ficção Científica'),('9780452284246','The Glass Castle','Jeanette Walls','Biografia'),('9780452286868','Freakonomics','Steven D. Levitt','Economia'),('9780525951054','The Girl on the Train','Paula Hawkins','Suspense'),('9780544003287','The Hobbit','J.R.R. Tolkien','Fantasia'),('9780553382563','The Shack','William P. Young','Religião'),('9780553384772','The Road','Cormac McCarthy','Ficção Pós-Apocalíptica'),('9780670026196','All the Light We Cannot See','Anthony Doerr','Ficção Histórica'),('9780671027346','Angels & Demons','Dan Brown','Suspense'),('9780679745587','Midnight in the Garden of Good and Evil','John Berendt','Não Ficção'),('9780743273565','The Catcher in the Rye','J.D. Salinger','Romance'),('9780804172707','Pequena vida','Hanya Yanagihara','Drama'),('9780812998603','The Underground Railroad','Colson Whitehead','Ficção Histórica'),('9781400033416','The Da Vinci Code','Dan Brown','Mistério'),('9781400034772','The Great Gatsby','F. Scott Fitzgerald','Ficção'),('9781400064281','The Goldfinch','Donna Tartt','Ficção'),('9781400067947','The Secret Life of Bees','Sue Monk Kidd','Drama'),('9788528617986','O velho e o mar','Ernest Hemingway','Fantasia'),('9788532531216','Todas as crônicas: Clarice Lispector','Lispector, Clarice','Crônicas Brasileiras'),('9788563560155','Orgulho e preconceito','Austen, Jane','Ficção Inglesa'),('9788580573107','Herois do olimpo: A marca de Atenas','Rick Riordan','Literatura infanto-juvenil'),('9788595084759','A sociedade do Anel','Tolkien, J.R.R.','Literatura inglesa'),('9788598078175','A menina que roubava livros','Markus Zusak','Ficção');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 15:06:39
