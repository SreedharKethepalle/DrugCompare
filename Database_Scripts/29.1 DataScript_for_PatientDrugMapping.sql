USE [DrugCompare]
GO

IF NOT EXISTS (SELECT * FROM PatientDrugMapping)
BEGIN
INSERT INTO [dbo].[PatientDrugMapping]
           SELECT 1,1,1,1,1,5,GETDATE(),GETDATE(),0
END
ELSE
	PRINT 'Data already exists in PatientDrugMapping Table'
GO


