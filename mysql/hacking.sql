CREATE TABLE `admin` (
 `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(100) NOT NULL,
 `username` varchar(100) NOT NULL,
 `role` varchar(10) NOT NULL DEFAULT 'superadmin',
 `phone` varchar(15) DEFAULT NULL,
 `email` varchar(200) DEFAULT NULL,
 `nickname` varchar(100) DEFAULT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `password` varchar(1000) DEFAULT NULL,
 `lastlogin` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `uniq_admin` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

INSERT INTO admin (user_id, username, phone, email, nickname, password) 
VALUES ("ee72dcf7-c2ea-47a0-a42d-4600823fcfca", "Andres felipe", "3207846771", "cto.cloudming@gmail.com", "cto.cloudming", "99100605208"), ("ee345678-c2ea-4346-a42d-4667823fcfca", "Cristian david", "32178467d1", "ceo.cloudming@gmail.com", "ceo.cloudming", "99100605208"), ("ee345678-c2ea-4346-a42d-4600823fcfca", "Diego alexander", "32178467d1", "cio.cloudming@gmail.com", "cio.cloudming", "99100605208");

CREATE TABLE `business` (
 `business_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(100) NOT NULL,
 `username` varchar(100) NOT NULL,
 `role` varchar(10) NOT NULL DEFAULT 'business',
 `phone` varchar(15) DEFAULT NULL,
 `email` varchar(200) DEFAULT NULL,
 `nickname` varchar(100) DEFAULT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `social_reason` varchar(100) DEFAULT NULL,
 `business_description` text,
 `password` varchar(1000) DEFAULT NULL,
 `lastlogin` varchar(20) NOT NULL DEFAULT '0',
 `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`business_id`),
  UNIQUE KEY `uniq_business` (`social_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

INSERT INTO business (user_id, username, phone, email, nickname, social_reason, business_description, password) 
VALUES ("84766586-feb7-41bb-842e-d9867ce402d6", "Cloudming", "3176069623", "business.cloudming@gmail.com", "business.cloudming", "social_reason1 ...", "business_description1 ...", "99100605208"), ("a5237d70-a118-4fbd-8605-6554fc4b6322", "Avianca", "30032145432", "business.avianca@gmail.com", "avianca.cloudming", "social_reason2 ...", "business_description2 ...", "99100605208");

CREATE TABLE `hackers` (
 `hacker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(100) NOT NULL,
 `username` varchar(100) NOT NULL,
 `role` varchar(10) NOT NULL DEFAULT 'ordinary',
 `phone` varchar(15) DEFAULT NULL,
 `email` varchar(200) DEFAULT NULL,
 `nickname` varchar(100) DEFAULT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `password` varchar(1000) DEFAULT NULL,
 `lastlogin` varchar(20) NOT NULL DEFAULT '0',
 `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hacker_id`),
  UNIQUE KEY `uniq_hacker` (`registration`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

-- Programms
CREATE TABLE `programms` (
 `programm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `user_id` varchar(100) NOT NULL,
 `vulnerabilitie_id` varchar(100) NOT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`programm_id`),
  UNIQUE KEY `uniq_programm` (`registration`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

CREATE TABLE `vulnerabilities` (
 `vuln_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `vulnerabilitie_id` varchar(100) NOT NULL,
 `business_id` varchar(100) NOT NULL,
 `category` varchar(15) DEFAULT NULL,
 `procedement` varchar(200) DEFAULT NULL,
 `location` varchar(100) DEFAULT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vuln_id`),
  UNIQUE KEY `uniq_vulnerabilitie` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- Administration vulnerabilities
CREATE TABLE `administration` (
 `vuln_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `vulnerabilitie_id` varchar(100) NOT NULL,
 `hacker_id` varchar(100) NOT NULL,
 `category` varchar(15) DEFAULT NULL,
 `procedement` varchar(200) DEFAULT NULL,
 `location` varchar(100) DEFAULT NULL,
 `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `status` enum('created','review', 'terminated') NOT NULL,
 `terminated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vuln_id`),
  UNIQUE KEY `uniq_vulnerabilitie` (`terminated`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;