-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for last project
CREATE DATABASE IF NOT EXISTS `last project` /*!40100 DEFAULT CHARACTER SET armscii8 */;
USE `last project`;

-- Dumping structure for table last project.appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `idAppointment` varchar(50) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAppointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.appointment: ~10 rows (approximately)
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` (`idAppointment`, `date`, `start_time`, `end_time`, `status`) VALUES
	('11', '2023-06-04', '9:00', '11:00', 'Undone'),
	('12', '2023-06-04', '13:00', '14:30', 'Undone'),
	('13', '2023-06-04', '19:30', '20:45', 'Undone'),
	('15', '2023-06-05', '10:00', '11:45', 'Undone'),
	('16', '2023-06-05', '13:10', '14:30', 'Undone'),
	('2', '2023-06-02', '11:00', '12:00', 'Done'),
	('3', '2023-06-02', '13:00', '14:00', 'Done'),
	('4', '2023-06-03', '9:00', '10:00', 'Done'),
	('7', '2023-06-03', '12:00', '13:00', 'Undone'),
	('8', '2023-06-03', '14:00', '15:00', 'Undone');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;

-- Dumping structure for table last project.diagnose
CREATE TABLE IF NOT EXISTS `diagnose` (
  `idDiagnose` varchar(50) NOT NULL,
  `idAppointment` varchar(50) NOT NULL,
  `email_doc` varchar(50) NOT NULL,
  `diagnosis` varchar(50) NOT NULL,
  `prescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idDiagnose`),
  KEY `idAppointment` (`idAppointment`),
  KEY `email_doc` (`email_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.diagnose: ~11 rows (approximately)
/*!40000 ALTER TABLE `diagnose` DISABLE KEYS */;
INSERT INTO `diagnose` (`idDiagnose`, `idAppointment`, `email_doc`, `diagnosis`, `prescription`) VALUES
	('23001', '1', 'leviack@gmail.com', 'kidney failure', 'consume enough water'),
	('23002', '2', 'aftaza@gmail.com', 'gastroenteritis', 'prepare food safely'),
	('23003', '3', 'rafifadl@gmail.com', 'influenza', 'get vaccination'),
	('23004', '4', 'yoichi01@gmail.com', 'appendix', 'eat fresh fruits and vegetables'),
	('23005', '7', 'ikbar@gmail.com', 'hemorrhagic fever', 'avoid contact with infected rodents'),
	('23006', '8', 'daffakmal@gmail.com', 'leukemia', 'avoid breathing in formaldehyde '),
	('23007', '11', 'wendyrv@gmail.com', 'vertigo', 'do simple exercises'),
	('23008', '12', 'irenerv@gmail.com', 'lactose intolerance', 'saving milk for mealtimes'),
	('23009', '13', 'yachiikyu@gmail.com', 'cataract', 'have regular eye examinations'),
	('23010', '15', 'tadayama@gmail.com', 'hepatitis a', 'adequate supplies of safe drinking water'),
	('23011', '16', 'shimizuyoko@gmail.com', 'diabetes', 'consume food with less sugar');
/*!40000 ALTER TABLE `diagnose` ENABLE KEYS */;

-- Dumping structure for table last project.doctor
CREATE TABLE IF NOT EXISTS `doctor` (
  `email_doc` varchar(50) NOT NULL,
  `nama_doc` varchar(50) DEFAULT NULL,
  `gender_doc` varchar(50) DEFAULT NULL,
  `password_doc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.doctor: ~11 rows (approximately)
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`email_doc`, `nama_doc`, `gender_doc`, `password_doc`) VALUES
	('aftaza@gmail.com', ' Alfian Tafta Zani', ' Male', ' HaYjma6'),
	('daffakmal@gmail.com', ' Daffa Hanifananda Akmal', ' Male', ' eQ7JIQO'),
	('ikbar@gmail.com', ' Ikbar Razan Nasrullah', ' Male', ' aY3MWFw'),
	('irenerv@gmail.com', ' Bae Irene', ' Female', ' TmwrmjT'),
	('leviack@gmail.com', ' Levi Ackerman', ' Male', ' E2lwbQ3'),
	('rafifadl@gmail.com', ' Rafi Putra Fadlurahman', ' Male', ' 4XbLfk8'),
	('shimizuyoko@gmail.com', ' Kiyoko Shimizu', ' Female', ' HeCWTtN'),
	('tadayama@gmail.com', ' Tadashi Yamaguchi', ' Male', ' BeWQVJa'),
	('wendyrv@gmail.com', ' Son Wendy', ' Female', ' 6C7Yz7E'),
	('yachiikyu@gmail.com', ' Yachi Hitoka', ' Female', ' nhT9euq'),
	('yoichi01@gmail.com', ' Isagi Yoichi', ' Male', ' KD1tXVh');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;

-- Dumping structure for table last project.doctorhaveschedules
CREATE TABLE IF NOT EXISTS `doctorhaveschedules` (
  `iddoctorhaveschedules` varchar(50) NOT NULL,
  `idSchedule` varchar(50) NOT NULL,
  `email_doc` varchar(50) NOT NULL,
  PRIMARY KEY (`iddoctorhaveschedules`),
  KEY `idSchedule` (`idSchedule`),
  KEY `email_doc` (`email_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.doctorhaveschedules: ~11 rows (approximately)
/*!40000 ALTER TABLE `doctorhaveschedules` DISABLE KEYS */;
INSERT INTO `doctorhaveschedules` (`iddoctorhaveschedules`, `idSchedule`, `email_doc`) VALUES
	('3001', ' 105', 'leviack@gmail.com '),
	('3002', '104', 'aftaza@gmail.com'),
	('3003', '103', 'rafifadl@gmail.com '),
	('3004', '102', 'yoichi01@gmail.com '),
	('3005', '101', 'ikbar@gmail.com'),
	('3006', '100', 'daffakmal@gmail.com'),
	('3007', '106', 'wendyrv@gmail.com'),
	('3008', '107', 'irenerv@gmail.com'),
	('3009', '111', 'yachiikyu@gmail.com'),
	('3010', '109 ', 'tadayama@gmail.com'),
	('3011', '112', 'shimizuyoko@gmail.com');
/*!40000 ALTER TABLE `doctorhaveschedules` ENABLE KEYS */;

-- Dumping structure for table last project.doctorviewshistory
CREATE TABLE IF NOT EXISTS `doctorviewshistory` (
  `iddoctorviewhistory` varchar(50) NOT NULL,
  `idMedicalHistory` varchar(50) NOT NULL,
  `email_doc` varchar(50) NOT NULL,
  PRIMARY KEY (`iddoctorviewhistory`),
  KEY `idMedicalHistory` (`idMedicalHistory`),
  KEY `email_doc` (`email_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.doctorviewshistory: ~11 rows (approximately)
/*!40000 ALTER TABLE `doctorviewshistory` DISABLE KEYS */;
INSERT INTO `doctorviewshistory` (`iddoctorviewhistory`, `idMedicalHistory`, `email_doc`) VALUES
	('40001', '10008', ' leviack@gmail.com'),
	('40002', '10007', ' aftaza@gmail.com'),
	('40003', '10006', ' rafifadl@gmail.com'),
	('40004', '10005', ' yoichi01@gmail.com'),
	('40005', '10004', ' ikbar@gmail.com'),
	('40006', '10003', ' daffakmal@gmail.com'),
	('40007', '10012', ' wendyrv@gmail.com'),
	('40008', '10011', ' irenerv@gmail.com'),
	('40009', '10001', ' yachiikyu@gmail.com'),
	('40010', '10011', ' tadayama@gmail.com'),
	('40011', '10002', ' shimizuyoko@gmail.com');
/*!40000 ALTER TABLE `doctorviewshistory` ENABLE KEYS */;

-- Dumping structure for procedure last project.GetAppointmentDiagnosis
DELIMITER //
CREATE PROCEDURE `GetAppointmentDiagnosis`()
BEGIN
    SELECT a.idAppointment, a.date, a.start_time, a.end_time, a.status, d.nama_doc, d.gender_doc, diag.diagnosis, diag.prescription
    FROM appointment a
    JOIN diagnose diag ON a.idAppointment = diag.idAppointment
    JOIN doctor d ON diag.email_doc = d.email_doc;
END//
DELIMITER ;

-- Dumping structure for procedure last project.GetPatient
DELIMITER //
CREATE PROCEDURE `GetPatient`()
BEGIN
	SELECT
    email_pat,
    password_pat,
    nama_pat,
    address,
    gender_pat
	FROM
		patient
	ORDER BY email_pat;
END//
DELIMITER ;

-- Dumping structure for function last project.GetPatientByPassword
DELIMITER //
CREATE FUNCTION `GetPatientByPassword`(`pass` VARCHAR(1000)
) RETURNS varchar(1000) CHARSET armscii8
BEGIN
    DECLARE nama VARCHAR(50);
    SELECT nama_pat into nama
    FROM patient
    WHERE password_pat = pass
    LIMIT 1;
    RETURN nama;
END//
DELIMITER ;

-- Dumping structure for table last project.medicalhistory
CREATE TABLE IF NOT EXISTS `medicalhistory` (
  `idMedicalHistory` varchar(50) NOT NULL,
  `date_time` varchar(50) DEFAULT NULL,
  `condition` varchar(50) NOT NULL,
  `surgeries` varchar(50) DEFAULT NULL,
  `qmaMedication` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMedicalHistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.medicalhistory: ~11 rows (approximately)
/*!40000 ALTER TABLE `medicalhistory` DISABLE KEYS */;
INSERT INTO `medicalhistory` (`idMedicalHistory`, `date_time`, `condition`, `surgeries`, `qmaMedication`) VALUES
	('10001', '2023-06-04', 'clouded, blurred or dim vision', 'phacoemulsification', 'none'),
	('10002', '2023-06-05', 'feel very tired', 'none', 'metformin'),
	('10003', '2023-06-03', 'anaemia', 'bone marrow transplant', 'chemoterapy'),
	('10004', '2023-06-03', 'sore throat', 'none', 'ribavirin'),
	('10005', '2023-06-03', 'constipation or diarrhoea', 'appendectomy', 'none'),
	('10006', '2023-06-02', 'fever', 'none', 'zanamivir'),
	('10007', '2023-06-02', 'vomitting', 'none', 'loperamide link'),
	('10008', '2023-06-02', 'decreased urine output', 'organ replacement', 'none'),
	('10011', '2023-06-05', 'yellow skin or eyes', 'none', 'entecavir '),
	('10012', '2023-06-04', 'problem focusing the eyes', 'none', 'prochlorperazine'),
	('10013', '2023-06-04', 'nausea, and sometimes, vomiting', 'none', 'lactase enz');
/*!40000 ALTER TABLE `medicalhistory` ENABLE KEYS */;

-- Dumping structure for table last project.patient
CREATE TABLE IF NOT EXISTS `patient` (
  `email_pat` varchar(50) NOT NULL,
  `password_pat` varchar(50) DEFAULT NULL,
  `nama_pat` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender_pat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email_pat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.patient: ~11 rows (approximately)
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` (`email_pat`, `password_pat`, `nama_pat`, `address`, `gender_pat`) VALUES
	('adinni08@student.ub.ac.id', 'adinni08', 'Adinni Salsabilla', 'Perumahan Mutiara Sigura-gura No. 16', 'Female'),
	('erlinda@student.ub.ac.id', 'erlinda1605', 'Erlinda Butarbutar', 'Jl. Sigura-gura II Kav. A2. Sumbersari', 'Female'),
	('jaemin12@student.ub.ac.id ', 'najaemin12', 'Na Jaemin', '513. Gangnam-gu. Seoul. South Korea ', 'Male'),
	('jungjaehyun@student.ub.ac.id', 'jjaehyun1402', 'Jung Jaehyun', '237. Dongdaemun-gu. Seoul. South Korea', 'Male'),
	('kurnitaruci@student.ub.ac.id', 'kruciw08', 'Kurnita Ruci Widyana', 'Jl. Kalpataru No.4. Lowokwaru. Malang', 'Female'),
	('moudylestaritw@student.ub.ac.id', 'moudytw1304', 'Moudy Lestari Tulus Widodo', 'Jl. Raya Kepuharjo. Karangploso. Blok C-10', 'Female'),
	('oikawatoru@student.ub.ac.id', 'oikawatoruu01', 'Oikawa Toru', '2-2-1 Sendai-shi. Miyagi. 981-0916', 'Male'),
	('sugawara02@student.ub.ac.id', 'sugasenpai02', 'Sugawara Koshi', '4-2-9 Natori. Miyagi. 981-1232', 'Male'),
	('tsukiiii@student.ub.ac.id', 'tsukikei11', 'Tsukishima Kei', '3-4-7 Matsushima. Miyagi. 981-0200', 'Male'),
	('zakiyyatrustee15@student.ub.ac.id', 'audreyzakiyya15', 'Audrey Zakiya Trustee', 'Jl. Watugong 5.A. Ketawanggede. Lowokwaru. Malang', 'Female'),
	('ziyyandehani@student.ub.ac.id', 'ziyyandehan11', 'Ziyyan Dehani Safti Ajly', 'Jl. Bendungan sigura-gura VI No. 31A', 'Female');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;

-- Dumping structure for table last project.patientfillhistory
CREATE TABLE IF NOT EXISTS `patientfillhistory` (
  `idPatientHistory` varchar(50) NOT NULL,
  `email_pat` varchar(50) NOT NULL,
  `idMedicalHistory` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPatientHistory`),
  KEY `email_pat` (`email_pat`),
  KEY `idMedicalHistory` (`idMedicalHistory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.patientfillhistory: ~11 rows (approximately)
/*!40000 ALTER TABLE `patientfillhistory` DISABLE KEYS */;
INSERT INTO `patientfillhistory` (`idPatientHistory`, `email_pat`, `idMedicalHistory`) VALUES
	('101021', 'moudylestaritw@student.ub.ac.id', '10006'),
	('101022', 'ziyyandehani@student.ub.ac.id', '10007'),
	('101023', 'kurnitaruci@student.ub.ac.id', '10008'),
	('101031', 'adinni08@student.ub.ac.id', '10003'),
	('101032', 'erlinda@student.ub.ac.id', '10005'),
	('101033', 'zakiyyatrustee15@student.ub.ac.id', '10004'),
	('101035', 'sugawara02@student.ub.ac.id', '10010'),
	('202032', 'jaemin12@student.ub.ac.id ', '10012'),
	('202033', 'jungjaehyun@student.ub.ac.id', '10011'),
	('202034', 'oikawatoru@student.ub.ac.id', '10002'),
	('202044', 'tsukiiii@student.ub.ac.id', '10009');
/*!40000 ALTER TABLE `patientfillhistory` ENABLE KEYS */;

-- Dumping structure for table last project.patientsattendappointments
CREATE TABLE IF NOT EXISTS `patientsattendappointments` (
  `idPatientAppointment` varchar(50) NOT NULL,
  `email_pat` varchar(50) NOT NULL,
  `idAppointment` varchar(50) NOT NULL,
  `concerns` varchar(50) DEFAULT NULL,
  `symptomps` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPatientAppointment`),
  KEY `email_pat` (`email_pat`),
  KEY `idAppointment` (`idAppointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.patientsattendappointments: ~11 rows (approximately)
/*!40000 ALTER TABLE `patientsattendappointments` DISABLE KEYS */;
INSERT INTO `patientsattendappointments` (`idPatientAppointment`, `email_pat`, `idAppointment`, `concerns`, `symptomps`) VALUES
	('110013', 'kurnitaruci@student.ub.ac.id', '3', 'Infection', 'Fever'),
	('110014', 'ziyyandehani@student.ub.ac.id', '7', 'Fatigue', 'Weak'),
	('110021', 'adinni08@student.ub.ac.id', '8', 'Overthinking', 'Headache'),
	('110022', 'zakiyyatrustee15@student.ub.ac.id', '15', 'Overthinking', 'Dizzy'),
	('110023', 'moudylestaritw@student.ub.ac.id', '13', 'Infection', 'Coughs'),
	('110024', 'erlinda@student.ub.ac.id', '16', 'Indigestion', 'Stomach ache'),
	('220013', 'jaemin12@student.ub.ac.id ', '4', 'Eat hard food', 'tooth ache'),
	('220014', 'jungjaehyun@student.ub.ac.id', '2', 'Freezing', 'Short nose'),
	('220020', 'sugawara02@student.ub.ac.id', '12', 'Infection', 'teary eyes'),
	('220021', 'tsukiiii@student.ub.ac.id', '11', 'none', 'itchy throat'),
	('220022', 'oikawatoru@student.ub.ac.id', '1', 'Nausea', 'Fever');
/*!40000 ALTER TABLE `patientsattendappointments` ENABLE KEYS */;

-- Dumping structure for table last project.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `idSchedule` varchar(50) NOT NULL,
  `start_time` varchar(50) NOT NULL,
  `end_time` varchar(50) NOT NULL,
  `break_time` varchar(50) NOT NULL,
  `day` varchar(50) NOT NULL,
  PRIMARY KEY (`idSchedule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table last project.schedules: ~11 rows (approximately)
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` (`idSchedule`, `start_time`, `end_time`, `break_time`, `day`) VALUES
	('100', '07.00', '15.30', '11.30', 'Monday'),
	('101', '10.00', '18.00', '13.30', 'Friday'),
	('102', '09.00', '17.00', '12.00', 'Tuesday'),
	('103', '08.00', '16.00', '12.00', 'Friday'),
	('104', '07.00', '15.30', '11.30', 'Tuesday'),
	('105', '08.00', '16.00', '12.00', 'Monday'),
	('106', '09.00', '17.00', '12.00', 'Friday'),
	('107', '08.30', '16.30', '12.00', 'Monday'),
	('109', '09.30', '17.30', '13.30', 'Saturday'),
	('111', '07.30', '16.00', '11.30', 'Monday'),
	('112', '09.00', '17.00', '12.00', 'Saturday');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
