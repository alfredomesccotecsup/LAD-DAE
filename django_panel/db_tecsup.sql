
CREATE TABLE IF NOT EXISTS `tbl_alumno` (
  `alumno_id` int(11) NOT NULL AUTO_INCREMENT,
  `alumno_nombre` varchar(100) NOT NULL,
  `alumno_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


INSERT INTO `tbl_alumno` (`alumno_id`, `alumno_nombre`, `alumno_email`) VALUES
	(1, 'Susana Toro', 'susantoro@tecsup.edu.pe'),
	(2, 'Claudia Loza', 'claudialoza@tecsup.edu.pe'),
	(3, 'Anibal Ruiz', 'anibalruiz@tecsup.edu.pe');

CREATE TABLE IF NOT EXISTS `tbl_profesor` (
  `profesor_id` int(11) NOT NULL AUTO_INCREMENT,
  `profesor_nombre` varchar(255) NOT NULL,
  `profesor_email` varchar(255) NOT NULL,
  PRIMARY KEY (`profesor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `tbl_profesor` (`profesor_id`, `profesor_nombre`, `profesor_email`) VALUES
	(1, 'cesar mayta', 'cmayta@tecup.edu.pe');

CREATE TABLE IF NOT EXISTS `tbl_matricula` (
  `matricula_id` int(11) NOT NULL AUTO_INCREMENT,
  `matricula_grupo` varchar(255) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `profesor_id` int(11) NOT NULL,
  PRIMARY KEY (`matricula_id`),
  CONSTRAINT `fk_tbl_matricula_tbl_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `tbl_alumno` (`alumno_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_matricula_tbl_profesor` FOREIGN KEY (`profesor_id`) REFERENCES `tbl_profesor` (`profesor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
