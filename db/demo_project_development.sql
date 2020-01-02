DROP TABLE IF EXISTS `categories`;

DROP TABLE IF EXISTS `mailing_lists_users`;
CREATE TABLE `mailing_lists_users` (
  `mailing_list_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `inventory` int(11) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `restocked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty_sold` int(11) DEFAULT NULL,
  `ref_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_ref_num` (`ref_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `products` VALUES (1,'Couch','Modern blue couch',200,100.00,'2016-12-08 22:59:04','2016-12-08 19:02:31','2016-12-08 22:59:04',21,'1000001'),(2,'Chair','Brown chair',100,40.00,'2016-12-07 19:02:31','2016-12-08 19:02:31','2016-12-08 19:55:42',20,'1000002'),(3,'Green shirt',NULL,NULL,10.00,NULL,'2016-12-09 16:35:03','2016-12-12 15:10:47',NULL,NULL),(4,'Sofa',NULL,-2,300.00,NULL,'2016-12-09 17:10:15','2016-12-14 14:03:35',5,NULL);

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `schema_migrations` VALUES ('20161207181703'),('20161207181804'),('20161207181848'),('20161207181916'),('20161207201425'),('20161208170128'),('20161208172240');

