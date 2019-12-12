USE [DrugCompare]
GO 

IF NOT EXISTS(SELECT * FROM Sys.columns WHERE Name LIKE 'DrugID' AND object_ID IN (SELECT object_id FROM sys.tables WHERE Name = 'PatientDrugMapping'))
BEGIN 
	ALTER TABLE PatientDrugMapping ADD DrugID INT 
END
ELSE
	PRINT 'Already DrugID Column exists in PatientDrugMapping table'