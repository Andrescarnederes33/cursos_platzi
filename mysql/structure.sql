CREATE TABLE `authors` (
 `author_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(100) NOT NULL,
 `nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `uniq_author` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

CREATE TABLE `books` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '1900',
  `language` varchar(2) NOT NULL COMMENT 'ISO 639-1 Language code (2 chars)',
  `cover_url` varchar(500) DEFAULT NULL,
  `price` double(6,2) DEFAULT NULL,
  `sellable` tinyint(1) NOT NULL DEFAULT '0',
  `copies` int(11) NOT NULL DEFAULT '1',
  `description` text,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_language` (`title`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;


CREATE TABLE `clients` (
  `client_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;


CREATE TABLE `transactions` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `type` enum('lend','sell') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO transactions (book_id, client_id, type) VALUES (3, 5, "sell");

-- JOINS 
-- Nota: Se pueden utilizar tantos JOIN como deseé

-- INNER JOIN
SELECT c.name, b.title, t.type 
FROM transactions AS t JOIN books AS b 
ON t.book_id = b.book_id JOIN clients AS c 
ON t.client_id = c.client_id JOIN authors AS a
ON b.author_id = a.author_id;

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a
JOIN books AS b
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5 ORDER BY a.author_id;

-- LEFT JOIN

-- GROUP BY

-- UPDATE AND DELETE

DELETE FROM authors WHERE author_id = 133 LIMIT 1;
-- SELECT client_id, name FROM clients ORDER BY RAND() LIMIT 10;

SELECT * FROM  clients WHERE client_id IN (1, 6, 93, 13, 79);
SELECT * FROM  clients WHERE client_id IN (1, 6, 93, 13, 79) OR name LIKE "%andres%";
UPDATE clients 
SET active = 0
WHERE client_id IN (1, 6, 93, 13, 79) OR name LIKE "%andres%";

-- Clear Table
TRUNCATE name_of_table;

-- Super Querys
SELECT DISTINCT nationality FROM authors;
SELECT sellable, SUM(price*copies) FROM books GROUP BY sellable;

SELECT COUNT(book_id), SUM(if(year < 1950, 1, 0)) as "<1950" FROM books;

SELECT COUNT(book_id) FROM books WHERE year < 1950;

SELECT nationality, COUNT(book_id),
  SUM(IF(year < 1950, 1, 0)) AS"<1950",
  SUM(IF(year >= 1950 and year < 1990, 1, 0)) AS"<1990",
  SUM(IF(year >= 1990 and year < 2000, 1, 0)) AS"<2000",
  SUM(IF(year >= 2000, 1, 0)) AS"<hoy"
FROM books AS b
JOIN authors AS a
ON a.author_id = b.author_id
WHERE a.nationality IS NOT NULL
GROUP BY nationality;

SELECT name, nationality, COUNT(book_id),
  SUM(IF(year < 1950, 1, 0)) AS"<1950",
  SUM(IF(year >= 1950 and year < 1990, 1, 0)) AS"<1990",
  SUM(IF(year >= 1990 and year < 2000, 1, 0)) AS"<2000",
  SUM(IF(year >= 2000, 1, 0)) AS"<hoy"
FROM books AS b
JOIN authors AS a
ON a.author_id = b.author_id
WHERE a.nationality IS NOT NULL
GROUP BY nationality;


-- ALTER 

ALTER TABLE authors ADD COLUMN birthyear INTEGER DEFAULT 1930 AFTER name;

ALTER TABLE authors MODIFY COLUMN birthyear YEAR DEFAULT 1920;

ALTER TABLE authors DROP birthyear;

-- MYSQL DUMP
-- mysqldump -u root -p platzi_operations #Me muestra la estructura

-- Save to Esquema
-- mysqldump -u root -p -d platzi_operations > esquema.sql

-- MYSQL tiene 190 diferentes funciones