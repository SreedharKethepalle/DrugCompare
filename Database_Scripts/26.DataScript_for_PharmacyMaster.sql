USE [DrugCompare]
GO

/*
ALTER TABLE DrugCompare.dbo.PatientDrugMapping DROP CONSTRAINT Fk_PatientDrugMapping_PharmacyMaster
--TRUNCATE TABLE [dbo].[PharmacyMaster]

*/
   
IF NOT EXISTS( SELECT * FROM [dbo].[PharmacyMaster] )
BEGIN
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('Hanmi Pharmacy, Inc.',90020,'325 1/2 S Western Ave Los Angeles, CA 90020','Out-of-network',1,963852741)
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('Mariposa Pharmacy',90006,'2970 W Olympic Blvd # 104 Los Angeles, CA 90006','Out-of-network',1,987654321)
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('Ardmore Pharmacy',90010,'3545 Wilshire Blvd Los Angeles, CA 90010','In-network',1,951623847)
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('KT Plaza Pharmacy',90006,'928 S Western Ave Los Angeles, CA 90006','In-network',1,938271465)
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('Mother''s Care Pharmacy',90020,'3500 W 6th St Los Angeles, CA 90020','In-network',1,919293688)
	INSERT INTO [dbo].[PharmacyMaster] ([PharmacyName],[PharmacyZip],[Address],[Timings],[StatusFlag],[PharmacyPhone]) VALUES ('Zion Drug',90020,'3900 W 3rd St Los Angeles, CA 90020','In-network',1,9966334252)
END
ELSE
	PRINT 'Data already exists in [dbo].[PharmacyMaster] table'
GO


