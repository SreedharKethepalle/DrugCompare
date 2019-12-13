USE [DrugCompare]
GO
	

IF NOT EXISTS (SELECT * FROM PatientDrugMapping)
BEGIN
INSERT INTO [dbo].[PatientDrugMapping]
           SELECT 1,1,1,1,1,5,GETDATE(),GETDATE(),0,1
END
ELSE
BEGIN
	PRINT 'Data already exists in PatientDrugMapping Table'
	UPDATE PatientDrugMapping SET DrugID = 1 WHERE UserId = 1
END
GO




