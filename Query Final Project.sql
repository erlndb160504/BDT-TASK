DELIMITER $$

-- -----------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS `last project`.`GetAppointmentDiagnosis` $$
/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAppointmentDiagnosis`()
BEGIN
    SELECT a.idAppointment, a.date, a.start_time, a.end_time, a.status, d.nama_doc, d.gender_doc, diag.diagnosis, diag.prescription
    FROM appointment a
    JOIN diagnose diag ON a.idAppointment = diag.idAppointment
    JOIN doctor d ON diag.email_doc = d.email_doc;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

-- -----------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS `last project`.`GetPatient` $$
/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPatient`()
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
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

-- -----------------------------------------------------------------------------

DROP FUNCTION IF EXISTS `last project`.`GetPatientByPassword` $$
/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `GetPatientByPassword`(`pass` VARCHAR(1000)
) RETURNS varchar(1000) CHARSET armscii8
BEGIN
    DECLARE nama VARCHAR(50);
    SELECT nama_pat into nama
    FROM patient
    WHERE password_pat = pass
    LIMIT 1;
    RETURN nama;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

-- -----------------------------------------------------------------------------
CREATE TRIGGER update_appointment_status AFTER INSERT ON diagnose
FOR EACH ROW
BEGIN
  IF NEW.idAppointment IS NOT NULL THEN
    UPDATE appointment SET `status` = 'Diagnosed' WHERE idAppointment = NEW.idAppointment;
  END IF;
END//
DELIMITER ;

INSERT INTO diagnose (idAppointment) VALUES (1);
INSERT INTO diagnose (idAppointment) VALUES (2);
-- -----------------------------------------------------------------------------
DELIMITER ;


SELECT a.nama_pat, s.day
FROM patient a
JOIN doctorhaveschedules dh JOIN doctor d ON d.email_doc = dh.email_doc
JOIN schedules s ON dh.idSchedule = s.idSchedule
WHERE s.day = 'Monday';


SELECT a.nama_pat, mh.idMedicalHistory
FROM patient a
JOIN patientfillhistory pf ON pf.email_pat = a.email_pat
Join medicalhistory mh on pf.IdMedicalHistory = mh.IdMedicalHistory
WHERE pf.idMedicalHistory = '10006';

DELETE FROM diagnose WHERE idAppointment= 10;

SELECT * FROM appointment a;

UPDATE schedules
SET start_time = '8:10'
WHERE idSchedule = '109'; #mengubah jadwal aktif dokter yamaguchi menjadi jam 8:10

INSERT INTO patient (email_pat)
VALUES ('zuzuzu@gmail.com');

