DROP DATABASE  IF EXISTS `spring_security_demo_bcrypt_crm`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo_bcrypt_crm`;
USE `spring_security_demo_bcrypt_crm`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- NOTE: The passwords are encrypted using BCrypt
--
--
-- Default passwords here are: 1234
--

INSERT INTO `users` 
VALUES 
('rohit','{bcrypt}$2a$10$AOHCiRQQ03yh1KNPrnwLz.55cFTAanFcfEuv9B4F5YeHSBc4yvpsK',1),
('tony','{bcrypt}$2a$10$JQM8Dc7Mm3xmRTDJp6E3KuhLT1puDj..ajlg3Tsiv.ODYithZ1owe',1),
('bruce','{bcrypt}$2a$10$PaljehhVfbhUERxkbBJovucoaC4Mar9TlFryTwmTJcX1HpkwjWZnW',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `authorities` 
VALUES 
('rohit','ROLE_EMPLOYEE'),
('tony','ROLE_EMPLOYEE'),
('tony','ROLE_MANAGER'),
('bruce','ROLE_EMPLOYEE'),
('bruce','ROLE_ADMIN');